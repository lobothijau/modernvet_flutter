import 'package:flutter/material.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our reviews'),
      ),
      body:const Column(
        children: [
          Text('Reviews'),
          Text('Reviews'),
          Text('Reviews'),
          Text('Reviews'),
          Text('Reviews'),
        ],
      ),
    );
  }
}
