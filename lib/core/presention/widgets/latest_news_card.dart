import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/presention/widgets/shimmer_image.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/features/newsmarked/domain/cubit/newsmarked_cubit.dart';
import 'package:news/features/news/domain/entities/article.dart';

class LatestNewsCard extends StatelessWidget {
  const LatestNewsCard({
    super.key,
    required this.imageurl,
    required this.time,
    required this.content,
    required this.type,
    this.onTap,
    this.id,
  });
  final String imageurl;
  final String time;
  final String content;
  final String type;
  final VoidCallback? onTap;
  final String? id;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // News Image with Shimmer
            ShimmerImage(
              imageUrl: imageurl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),

            // News Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Source & Time
                    Row(
                      children: [
                        // اسم الشبكة الإخبارية مع إمكانية التقليص
                        Flexible(
                          child: Text(
                            type,
                            style: textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.access_time,
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Title
                    Text(
                      content,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),

            // Bookmark Button
            if (id != null)
              BlocBuilder<NewsmarkedCubit, List<Article>>(
                builder: (context, articles) {
                  // Check if this article is in newsmarked list
                  bool isMarked = false;
                  if (id != null) {
                    isMarked = articles.any((article) => article.id == id);
                  }

                  return IconButton(
                    icon: Icon(
                      isMarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isMarked ? AppColors.primary : Colors.white,
                    ),
                    onPressed: () {
                      // We need a full article to add/remove from newsmarked
                      // So this should be handled where we have access to full article object
                      // Usually we'll navigate to article details to add to bookmarks
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Open article to add to bookmarks'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                  );
                },
              )
            else
              IconButton(
                icon: const Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
          ],
        ),
      ),
    );
  }
}
