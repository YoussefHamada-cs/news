import 'package:flutter/material.dart';
import 'package:news/core/presention/widgets/shimmer_image.dart';
import 'package:news/core/resources/app_colors.dart';

class FeaturedNewsCard extends StatelessWidget {
  const FeaturedNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 260,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[900],
      ),
      child: Stack(
        children: [
          // Background Image with Shimmer
          ShimmerImage(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS47l-TBwq5J39we3hCYx0sV19z51nemqGCYAP4ZZCYSw&s&ec=72940543',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(12),
          ),

          // Content Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),

          // Text Content
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Category & Time
                Row(
                  children: [
                    Text('TechHealth Journal', style: textTheme.bodySmall),
                    const Spacer(),
                    const Icon(
                      Icons.access_time,
                      color: AppColors.iconDisabledLight,
                      size: 10,
                    ),
                    const SizedBox(width: 2),
                    Text('5 min', style: textTheme.bodySmall),
                  ],
                ),
                const SizedBox(height: 4),
                // Title
                Text(
                  'New AI Technology Revolutionizes Healthcare',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Bookmark Button
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4), shape: BoxShape.circle
                  // borderRadius: BorderRadius.circular(15),
                  ),
              child: IconButton(
                icon: const Icon(
                  Icons.bookmark_border,
                  color: AppColors.iconPrimary,
                  size: 18,
                ),
                constraints: const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                onPressed: () {
                  // TODO: Implement bookmark functionality
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
