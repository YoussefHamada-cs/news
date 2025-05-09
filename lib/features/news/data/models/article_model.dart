import 'package:news/features/news/domain/entities/article.dart';

class ArticleModel extends Article {
  const ArticleModel({
    required String id,
    required String title,
    required String category,
    required String imageUrl,
    required String publisherName,
    required String publisherImage,
    required String publisherType,
    required String readTime,
    required String date,
    required List<String> paragraphs,
    required String url,
    String quote = '',
    String quoteAuthor = '',
    int likesCount = 0,
    int commentsCount = 0,
    int viewsCount = 0,
    bool isBookmarked = false,
  }) : super(
          id: id,
          title: title,
          category: category,
          imageUrl: imageUrl,
          publisherName: publisherName,
          publisherImage: publisherImage,
          publisherType: publisherType,
          readTime: readTime,
          date: date,
          paragraphs: paragraphs,
          url: url,
          quote: quote,
          quoteAuthor: quoteAuthor,
          likesCount: likesCount,
          commentsCount: commentsCount,
          viewsCount: viewsCount,
          isBookmarked: isBookmarked,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    try {
      final source = json['source'] as Map<String, dynamic>? ?? {};
      final content = json['content'] as String? ?? '';
      final author = json['author'] as String? ?? 'Unknown';
      final title = json['title'] as String? ?? 'No Title';
      final description = json['description'] as String? ?? '';
      final urlToImage = json['urlToImage'] as String?;
      final url = json['url'] as String? ?? '';
      final publishedAt = json['publishedAt'] as String? ?? '';

      // Clean and combine content
      final List<String> contentParts = [];

      if (description.isNotEmpty) {
        contentParts.add(description);
      }

      if (content.isNotEmpty) {
        // Remove the "[+chars]" part and clean the content
        final cleanContent =
            content.replaceAll(RegExp(r'\[\+\d+ chars\]'), '').trim();
        if (cleanContent.isNotEmpty && cleanContent != description) {
          contentParts.add(cleanContent);
        }
      }

      // Validate image URL
      final imageUrl = _validateImageUrl(urlToImage);

      // Format date
      final readableDate = _formatDate(publishedAt);

      // Calculate read time (approx 200 words per minute)
      final String readTime =
          '${((description.length + content.length) ~/ 200) + 1} min';

      return ArticleModel(
        id: source['id']?.toString() ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        category: source['name']?.toString() ?? 'General',
        imageUrl: imageUrl,
        publisherName: author,
        publisherImage: author.isNotEmpty ? author[0].toUpperCase() : 'N',
        publisherType: source['name']?.toString() ?? 'News',
        readTime: readTime,
        date: readableDate,
        paragraphs: contentParts,
        url: url,
      );
    } catch (e) {
      // Fall back to a default article in case of error
      return ArticleModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: 'Error loading article',
        category: 'Error',
        imageUrl: 'assets/images/placeholder_news.jpg',
        publisherName: 'Unknown',
        publisherImage: 'E',
        publisherType: 'Error',
        readTime: '1 min',
        date: DateTime.now().toString(),
        paragraphs: ['There was an error loading this article.'],
        url: '',
      );
    }
  }

  static String _validateImageUrl(String? url) {
    if (url == null || url.isEmpty) {
      return 'assets/images/placeholder_news.jpg';
    }

    // Check if URL is valid
    try {
      final uri = Uri.parse(url);
      if (!uri.isAbsolute) {
        return 'assets/images/placeholder_news.jpg';
      }
      return url;
    } catch (e) {
      return 'assets/images/placeholder_news.jpg';
    }
  }

  static String _formatDate(String publishedAt) {
    try {
      final date = DateTime.parse(publishedAt);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return DateTime.now().toString().substring(0, 10);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'imageUrl': imageUrl,
      'publisherName': publisherName,
      'publisherImage': publisherImage,
      'publisherType': publisherType,
      'readTime': readTime,
      'date': date,
      'paragraphs': paragraphs,
      'url': url,
      'quote': quote,
      'quoteAuthor': quoteAuthor,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'viewsCount': viewsCount,
      'isBookmarked': isBookmarked,
    };
  }
}
