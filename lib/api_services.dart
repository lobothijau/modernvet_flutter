import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/review.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl;

  ApiService({String? baseUrl}) 
    : baseUrl = baseUrl ?? 'https://afraid-treefrog-27.telebit.io',
      _dio = Dio() {
    _dio.options.baseUrl = this.baseUrl;
  }

  Future<List<Review>> getReviews() async {
    try {
      final response = await _dio.get('/feedback');
      final List<dynamic> data = response.data;
      
      return data.map((json) => Review(
        name: json['name'],
        petName: json['pet_name'],
        rating: json['rating'],
        comments: json['comments'],
        createdAt: json['created_at'],
      )).toList();
    } on DioException catch (e) {
      debugPrint('Error fetching reviews: ${e.message}');
      rethrow;
    }
  }

  Future<void> submitReview({
    required String name,
    required String petName,
    required int rating,
    required String comments,
  }) async {
    try {
      await _dio.post('/feedback', data: {
        'name': name,
        'pet_name': petName,
        'rating': rating,
        'comment': comments,
      });
    } on DioException catch (e) {
      debugPrint('Error submitting review: ${e.message}');
      rethrow;
    }
  }
}