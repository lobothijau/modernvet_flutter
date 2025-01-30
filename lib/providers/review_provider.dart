import 'package:flutter/material.dart';
import '../models/review.dart';
import '../api_services.dart';

class ReviewProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Review> _reviews = [];
  bool _isLoading = false;
  String? _error;

  List<Review> get reviews => _reviews;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchReviews({bool showLoading = true}) async {
    _isLoading = showLoading;
    _error = null;
    notifyListeners();

    try {
      _reviews = await _apiService.getReviews();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load reviews.\nPlease try again.';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> submitReview({
    required String name,
    required String petName,
    required int rating,
    required String comments,
  }) async {
    try {
      await _apiService.submitReview(
        name: name,
        petName: petName,
        rating: rating,
        comments: comments,
      );
      await fetchReviews();
    } catch (e) {
      rethrow;
    }
  }
} 