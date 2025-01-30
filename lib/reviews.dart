import 'package:flutter/material.dart';
import 'package:modernvet/api_services.dart';
import 'package:modernvet/widgets/error_display.dart';
import 'models/review.dart';
import 'review_card.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  List<Review> reviews = [];
  final apiService = ApiService();
  bool isLoading = false;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final fetchedReviews = await apiService.getReviews();
      setState(() {
        reviews = fetchedReviews;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'Failed to load reviews.\nPlease try again.';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our reviews'),
      ),
      body: Column(
        children: [
          if (isLoading)
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else if (error != null)
            Expanded(
              child: ErrorDisplay(
                error: error!,
                onRetry: fetchReviews,
              ),
            )
          else
            Expanded(
              child: reviews.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 16),
                            const Text(
                              'No reviews yet',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Be the first by clicking the button below!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
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
                    ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement review submission
                },
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
