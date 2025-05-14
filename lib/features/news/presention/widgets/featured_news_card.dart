import 'package:flutter/material.dart';
import 'package:news/core/presention/widgets/shimmer_image.dart';
import 'package:news/core/resources/app_colors.dart';

class FeaturedNewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final String? time;
  final VoidCallback? onTap;
  final String? id;

  const FeaturedNewsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    this.time,
    this.onTap,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 260,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
        ),
        child: Stack(
          children: [
            // Background Image with Shimmer
            ShimmerImage(
              imageUrl: imageUrl,
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
                    Theme.of(context).cardColor.withOpacity(0.8),
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
                      Text(category, style: textTheme.bodySmall),
                      const Spacer(),
                      const Icon(
                        Icons.access_time,
                        color: AppColors.iconDisabledLight,
                        size: 10,
                      ),
                      const SizedBox(width: 2),
                      Text(time ?? '5 min', style: textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Title
                  Text(
                    title,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
