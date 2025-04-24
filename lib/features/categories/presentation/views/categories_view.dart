import 'package:flutter/material.dart';
import 'package:news/core/presention/widgets/custom_listview_vertical.dart';
import 'package:news/core/resources/app_strings.dart';
import 'package:news/core/resources/app_colors.dart';
import 'package:news/features/categories/domain/entities/category.dart';
import 'package:news/features/categories/presentation/views/category_details_view.dart';
import 'package:news/features/categories/presentation/widgets/category_card.dart';
import 'package:news/features/categories/presentation/widgets/category_list_item.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final List<Category> categories = Category.samples;
  bool isGridView = true;

  void _navigateToCategoryDetails(Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetailsView(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.categories,
              style:
                  textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isGridView = true;
                    });
                  },
                  icon: Icon(Icons.grid_view,
                      color: isGridView
                          ? AppColors.darkPurple
                          : AppColors.iconDisabledDark),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isGridView = false;
                    });
                  },
                  icon: Icon(
                    Icons.format_list_bulleted,
                    color: !isGridView
                        ? AppColors.darkPurple
                        : AppColors.iconDisabledDark,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: isGridView
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      category: categories[index],
                      onTap: _navigateToCategoryDetails,
                    );
                  },
                )
              : CustomListviewVertical(
                  itemCount: categories.length,
                  itemBuilder: (context, index) => CategoryListItem(
                    category: categories[index],
                    onTap: _navigateToCategoryDetails,
                  ),
                ),
        ),
      ),
    );
  }
}
