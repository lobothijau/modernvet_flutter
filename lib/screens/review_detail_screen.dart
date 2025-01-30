import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/review.dart';

class ReviewDetailScreen extends StatelessWidget {
  final Review review;

  const ReviewDetailScreen({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${review.name}'s review",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < review.rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 35,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/paw.svg',
                  width: 24,
                ),
                const SizedBox(width: 8),
                Text(review.petName, style: const TextStyle(fontSize: 25)),
              ],
            ),
            const SizedBox(height: 22),
            Text(
              review.comments,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
