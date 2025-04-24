import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/core/resources/app_routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      title: Row(
        children: [
          Text(' News',
              style:
                  textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.pushNamed(AppRoutes.search);
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: AppColors.primary,
    );
  }
}
