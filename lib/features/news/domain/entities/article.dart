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
      );

  // List of sample articles for testing purposes
  static List<Article> get samples => [
        sample,
        const Article(
          id: '2',
          title: 'Global Climate Summit Reaches Breakthrough Agreement',
          category: 'Environment',
          imageUrl:
              'https://cdn.pixabay.com/photo/2018/07/15/10/44/climate-conference-3539868_960_720.jpg',
          publisherName: 'Global News Network',
          publisherImage: 'G',
          publisherType: 'News',
          readTime: '4 min',
          date: '2023-04-14',
          paragraphs: [
            'World leaders have reached a historic agreement at the latest climate summit, pledging to reduce carbon emissions by 50% by 2030. The breakthrough came after intense negotiations that extended well beyond the scheduled end of the conference.',
            'The agreement includes significant financial commitments from developed nations to help developing countries transition to clean energy. China and the United States, the world\'s largest emitters, have both signed the accord.',
            'Environmental activists have cautiously welcomed the deal but emphasize that implementation will be the true test. "We\'ve heard promises before," said Greta Thunberg. "Now we need action."',
          ],
          url: 'https://example.com/article/2',
          quote:
              '"This is a pivotal moment for our planet," declared UN Secretary-General António Guterres. "For the first time, all nations have committed to a timeline that science tells us can prevent catastrophic warming."',
          quoteAuthor: 'António Guterres',
          likesCount: 839,
          commentsCount: 32,
          viewsCount: 7210,
        ),
        const Article(
          id: '3',
          title: 'Revolutionary Smartphone Design Unveiled',
          category: 'Technology',
          imageUrl:
              'https://cdn.pixabay.com/photo/2016/12/09/11/33/smartphone-1894723_960_720.jpg',
          publisherName: 'Tech Today',
          publisherImage: 'T',
          publisherType: 'Technology',
          readTime: '3 min',
          date: '2023-04-13',
          paragraphs: [
            'A major smartphone manufacturer has revealed a revolutionary new design featuring a completely foldable, transparent display. The device, called the "Flex X," can transform from a standard smartphone into a 10-inch tablet.',
            'The new technology uses advanced materials that allow the screen to be folded thousands of times without showing a crease. The transparent display can also switch to opaque mode for privacy.',
            'The Flex X is expected to retail for approximately \$1,800 when it launches next quarter. Industry analysts predict it could spark a new trend in smartphone design, with other manufacturers scrambling to develop competing technology.',
          ],
          url: 'https://example.com/article/3',
          likesCount: 1254,
          commentsCount: 87,
          viewsCount: 15432,
        ),
        const Article(
          id: '4',
          title: 'Local Community Transforms Abandoned Lot Into Urban Garden',
          category: 'Community',
          imageUrl:
              'https://cdn.pixabay.com/photo/2017/08/10/03/47/urban-garden-2617866_960_720.jpg',
          publisherName: 'Community Chronicles',
          publisherImage: 'C',
          publisherType: 'Local News',
          readTime: '6 min',
          date: '2023-04-12',
          paragraphs: [
            'Residents of Greenhill neighborhood have transformed an abandoned lot into a thriving community garden, producing fresh vegetables and creating a new community gathering space. The project began when local resident Maria Sanchez organized a neighborhood meeting to discuss the eyesore.',
            'Working weekends over six months, volunteers cleared debris, tested and remediated soil, built raised beds, and installed a water collection system. The garden now produces over 200 pounds of vegetables monthly, which are shared among volunteers and donated to local food banks.',
            'The success has inspired similar projects in neighboring communities. "This isn\'t just about growing food," explained Sanchez. "It\'s about growing community connections and showing what we can accomplish together."',
          ],
          url: 'https://example.com/article/4',
          quote:
              '"When I see children learning where food comes from and tasting vegetables they\'ve grown themselves, I know we\'ve created something special," said volunteer coordinator James Wilson.',
          quoteAuthor: 'James Wilson',
          likesCount: 372,
          commentsCount: 18,
          viewsCount: 2150,
        ),
        const Article(
          id: '5',
          title: 'Scientists Discover Potential New Treatment for Alzheimer\'s',
          category: 'Health',
          imageUrl:
              'https://cdn.pixabay.com/photo/2018/07/15/10/40/dna-3539309_960_720.jpg',
          publisherName: 'Medical Research Today',
          publisherImage: 'M',
          publisherType: 'Medical',
          readTime: '7 min',
          date: '2023-04-11',
          paragraphs: [
            'A team of researchers at Johns Hopkins University has discovered a compound that appears to reverse cognitive decline in mouse models of Alzheimer\'s disease. The experimental treatment targets a newly identified protein pathway involved in neuronal degradation.',
            'In trials, mice treated with the compound showed dramatic improvements in memory tests and had significantly reduced brain plaque formation compared to untreated mice. The research team is now preparing for initial human safety trials.',
            'While the results are promising, the researchers caution that many treatments that work in mice fail to translate to humans. "We\'re optimistic but realistic," said lead researcher Dr. Sarah Johnson. "We\'re still years away from knowing if this will help human patients."',
          ],
          url: 'https://example.com/article/5',
          likesCount: 967,
          commentsCount: 43,
          viewsCount: 8754,
        ),
      ];

  // Get article content as string for search functionality
  String get content => paragraphs.join(' ');

  // Copy with method
  Article copyWith({
    String? id,
    String? title,
    String? category,
    String? imageUrl,
    String? publisherName,
    String? publisherImage,
    String? publisherType,
    String? readTime,
    String? date,
    List<String>? paragraphs,
    String? url,
    String? quote,
    String? quoteAuthor,
    int? likesCount,
    int? commentsCount,
    int? viewsCount,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      publisherName: publisherName ?? this.publisherName,
      publisherImage: publisherImage ?? this.publisherImage,
      publisherType: publisherType ?? this.publisherType,
      readTime: readTime ?? this.readTime,
      date: date ?? this.date,
      paragraphs: paragraphs ?? this.paragraphs,
      url: url ?? this.url,
      quote: quote ?? this.quote,
      quoteAuthor: quoteAuthor ?? this.quoteAuthor,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      viewsCount: viewsCount ?? this.viewsCount,
    );
  }
}
