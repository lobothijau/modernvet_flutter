import 'package:flutter/material.dart';
import 'models/review.dart';
import 'review_card.dart';
class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final List<Review> reviews = [
    Review(name: 'Bob', petName: 'Garfield', rating: 4),
    Review(name: 'Michael', petName: 'Bobo', rating: 5),
    Review(name: 'Arief', petName: 'Mochi', rating: 3),
    Review(name: 'Gelbi', petName: 'Miso', rating: 4),
    Review(name: 'Sarah', petName: 'Luna', rating: 5),
    Review(name: 'John', petName: 'Max', rating: 4),
    Review(name: 'Emma', petName: 'Bella', rating: 3),
    Review(name: 'David', petName: 'Rocky', rating: 5),
    Review(name: 'Lisa', petName: 'Charlie', rating: 4),
    Review(name: 'Alex', petName: 'Daisy', rating: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Submit a review',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
