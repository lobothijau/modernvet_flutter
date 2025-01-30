import 'package:flutter/material.dart';
import 'package:modernvet/models/review.dart';
import 'package:modernvet/review_card.dart';
import 'package:modernvet/widgets/empty_reviews_view.dart';

class ReviewList extends StatelessWidget {
  final List<Review> reviews;

  ReviewList({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return reviews.isEmpty
        ? const EmptyReviewsView()
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final review = reviews[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ReviewCard(
                  name: review.name,
                  petName: review.petName,
                  rating: review.rating,
                ),
              );
            },
          );
  }
}
