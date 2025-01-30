import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String petName;
  final int rating;

  const ReviewCard({
    super.key,
    required this.name,
    required this.petName,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 24,
              );
            }),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/user.svg',
                width: 24,
              ),
              const SizedBox(width: 8),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/paw.svg',
                width: 24,
              ),
              const SizedBox(width: 8),
              Text(petName, style: const TextStyle(fontSize: 25)),
            ],
          ),
        ],
      ),
    );
  }
}
