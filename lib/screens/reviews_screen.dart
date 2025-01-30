import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:modernvet/providers/review_provider.dart';
import 'package:modernvet/screens/submit_review_screen.dart';
import 'package:modernvet/widgets/error_view.dart';
import 'package:modernvet/widgets/review_list.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ReviewProvider>().fetchReviews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ReviewProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.error != null) {
                  return ErrorView(
                    error: provider.error!,
                    onRetry: provider.fetchReviews,
                  );
                }

                return ReviewList(reviews: provider.reviews);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SubmitReviewScreen(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Submit a review',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w300,
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
