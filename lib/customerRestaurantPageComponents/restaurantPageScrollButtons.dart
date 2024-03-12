import 'package:flutter/material.dart';

class RestaurantPageScrollButtons extends StatelessWidget {
  final VoidCallback onPhotosTap;
  final VoidCallback onMenuTap;
  final VoidCallback onReviewsTap;
  final VoidCallback onAboutTap;

  RestaurantPageScrollButtons({
    required this.onPhotosTap,
    required this.onMenuTap,
    required this.onReviewsTap,
    required this.onAboutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 193, 193, 193)),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8), bottom: Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              buildTabButton('Photos', onPhotosTap),
              buildTabButton('Menu', onMenuTap),
              buildTabButton('Reviews', onReviewsTap),
              buildTabButton('About', onAboutTap),
            ],
          ),
          // Add more sections if needed
        ],
      ),
    );
  }

  Widget buildTabButton(String text, VoidCallback onTapCallback) {
    return InkWell(
      onTap: onTapCallback,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(text),
      ),
    );
  }
}
