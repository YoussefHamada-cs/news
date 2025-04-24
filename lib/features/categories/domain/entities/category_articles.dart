import 'package:news/features/news/domain/entities/article.dart';

class CategoryArticles {
  // Generate sample articles for a specific category
  static List<Article> getArticlesForCategory(String categoryName) {
    final List<Article> articles = [];

    // Generate 5 sample articles for this category
    for (int i = 1; i <= 5; i++) {
      articles.add(
        Article(
          id: '$i',
          title: 'Sample $categoryName Article $i',
          category: categoryName,
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS47l-TBwq5J39we3hCYx0sV19z51nemqGCYAP4ZZCYSw&s&ec=72940543',
          publisherName: '$categoryName Journal',
          publisherImage: categoryName[0],
          publisherType: 'Publisher',
          readTime: '${i + 2} min',
          date: '2023-04-${15 + i}',
          paragraphs: [
            'This is a sample article about $categoryName. The content is generated for demonstration purposes.',
            'The $categoryName industry is constantly evolving, with new developments and trends emerging regularly.',
            'Experts in the field of $categoryName predict significant growth in the coming years.',
          ],
          likesCount: i * 100,
          commentsCount: i * 5,
          viewsCount: i * 1000,
        ),
      );
    }

    return articles;
  }
}
