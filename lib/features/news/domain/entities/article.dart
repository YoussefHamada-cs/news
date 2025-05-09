class Article {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final String publisherName;
  final String publisherImage;
  final String publisherType;
  final String readTime;
  final String date;
  final List<String> paragraphs;
  final String url;
  final String quote;
  final String quoteAuthor;
  final int likesCount;
  final int commentsCount;
  final int viewsCount;
  final bool isBookmarked;

  const Article({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.publisherName,
    required this.publisherImage,
    required this.publisherType,
    required this.readTime,
    required this.date,
    required this.paragraphs,
    required this.url,
    this.quote = '',
    this.quoteAuthor = '',
    this.likesCount = 0,
    this.commentsCount = 0,
    this.viewsCount = 0,
    this.isBookmarked = false,
  });

  // Sample article for testing purposes
  static Article get sample => const Article(
        id: '1',
        title: 'New AI Technology Revolutionizes Healthcare',
        category: 'Technology',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS47l-TBwq5J39we3hCYx0sV19z51nemqGCYAP4ZZCYSw&s&ec=72940543',
        publisherName: 'TechHealth Journal',
        publisherImage: 'T',
        publisherType: 'Publisher',
        readTime: '5 min',
        date: '2023-04-15',
        paragraphs: [
          'Artificial intelligence is transforming how doctors diagnose and treat patients, bringing unprecedented efficiency and accuracy to the healthcare industry. A new AI system developed by researchers at Stanford University can detect early-stage cancer with 99% accuracy.',
          'In addition to cancer detection, AI is now being used to predict patient outcomes, personalize treatment plans, and even assist in complex surgeries. Hospitals implementing these systems report dramatic reductions in diagnostic errors.',
          'However, the integration of AI in healthcare also raises important ethical questions about the role of human doctors and patient privacy. Medical associations are calling for new regulations to ensure AI systems are used responsibly.',
        ],
        url: 'https://example.com/article/1',
        quote:
            '"We\'re at the beginning of a revolution in medicine," says Dr. Elena Martinez, chief of AI innovation at Mayo Clinic. "These tools will never replace human doctors, but they can dramatically enhance our capabilities."',
        quoteAuthor: 'Dr. Elena Martinez',
        likesCount: 445,
        commentsCount: 8,
        viewsCount: 4742,
        isBookmarked: false,
      );
}
