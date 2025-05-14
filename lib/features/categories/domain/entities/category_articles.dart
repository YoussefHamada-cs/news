import 'package:news/features/news/domain/entities/article.dart';

class CategoryArticles {
  // Generate sample articles for a specific category
  static List<Article> getArticlesForCategory(String categoryName) {
    switch (categoryName) {
      case 'Sports':
        return _getSportsArticles();
      case 'Technology':
        return _getTechnologyArticles();
      case 'Health':
        return _getHealthArticles();
      case 'Politics':
        return _getPoliticsArticles();
      default:
        return _getGenericArticles(categoryName);
    }
  }

  static List<Article> _getSportsArticles() {
    return [
      Article(
        id: 's1',
        title: 'كريستيانو رونالدو يسجل هاتريك في مباراة النصر',
        category: 'Sports',
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/11/29/03/36/athletes-1867185_960_720.jpg',
        publisherName: 'الرياضة العربية',
        publisherImage: 'S',
        publisherType: 'Sports',
        readTime: '3 min',
        date: '2023-05-10',
        paragraphs: [
          'حقق كريستيانو رونالدو إنجازاً رائعاً بتسجيله ثلاثة أهداف (هاتريك) في مباراة فريقه النصر، ليقود الفريق إلى فوز كبير في الدوري السعودي.',
          'أظهر رونالدو مهاراته الاستثنائية طوال المباراة، وتمكن من إنهاء المباراة بثلاثة أهداف رائعة أذهلت الجماهير الحاضرة في الملعب.',
          'هذا الإنجاز يضيف إلى سجل رونالدو الحافل بالإنجازات، ويؤكد أنه لا يزال أحد أفضل المهاجمين في العالم رغم تقدمه في العمر.',
        ],
        url: 'https://example.com/sports/ronaldo-hattrick',
        likesCount: 3500,
        commentsCount: 420,
        viewsCount: 25000,
      ),
      Article(
        id: 's2',
        title: 'الهلال يتوج بطلاً للدوري السعودي للمرة الثالثة على التوالي',
        category: 'Sports',
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/05/16/21/07/football-1396740_960_720.jpg',
        publisherName: 'أخبار الكرة',
        publisherImage: 'F',
        publisherType: 'Sports',
        readTime: '4 min',
        date: '2023-05-12',
        paragraphs: [
          'نجح فريق الهلال السعودي في تحقيق لقب الدوري السعودي للمحترفين للمرة الثالثة على التوالي بعد موسم استثنائي.',
          'قدم الفريق أداءً رائعاً طوال الموسم، وتفوق على منافسيه بفارق كبير من النقاط، مما يؤكد هيمنته على الكرة السعودية.',
          'احتفل لاعبو وجماهير الهلال بهذا الإنجاز الكبير، وتعهد مدرب الفريق بمواصلة النجاحات في المواسم القادمة.',
        ],
        url: 'https://example.com/sports/hilal-champions',
        likesCount: 2900,
        commentsCount: 350,
        viewsCount: 21000,
      ),
      Article(
        id: 's3',
        title: 'منتخب مصر يتأهل إلى نهائيات كأس أمم أفريقيا',
        category: 'Sports',
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/05/06/03/43/stadium-1375912_960_720.jpg',
        publisherName: 'الرياضة اليوم',
        publisherImage: 'S',
        publisherType: 'Sports',
        readTime: '5 min',
        date: '2023-05-08',
        paragraphs: [
          'تمكن منتخب مصر من التأهل رسمياً إلى نهائيات كأس أمم أفريقيا بعد فوزه في المباراة الحاسمة ضد منتخب غانا.',
          'قدم المنتخب المصري أداءً قوياً، وتمكن من تحقيق الفوز بهدفين نظيفين، ليضمن بذلك مكانه في البطولة الأفريقية.',
          'أشاد المدرب بأداء اللاعبين وروحهم القتالية، مؤكداً أن الفريق سيستعد بقوة للمنافسة على اللقب في النهائيات.',
        ],
        url: 'https://example.com/sports/egypt-qualification',
        likesCount: 2200,
        commentsCount: 280,
        viewsCount: 18000,
      ),
      Article(
        id: 's4',
        title: 'صفقة جديدة: النادي الأهلي يضم لاعباً برازيلياً',
        category: 'Sports',
        imageUrl:
            'https://cdn.pixabay.com/photo/2013/07/13/12/18/football-159775_960_720.png',
        publisherName: 'كورة نيوز',
        publisherImage: 'K',
        publisherType: 'Sports',
        readTime: '3 min',
        date: '2023-05-05',
        paragraphs: [
          'أعلن النادي الأهلي المصري عن ضم لاعب برازيلي جديد لتعزيز صفوف الفريق في الموسم المقبل.',
          'اللاعب البرازيلي يتمتع بسمعة طيبة في الدوري البرازيلي، ويُتوقع أن يضيف قوة هجومية كبيرة للفريق المصري.',
          'تعد هذه الصفقة من أهم صفقات الموسم، وتعكس طموح النادي الأهلي للمنافسة بقوة على جميع البطولات المحلية والقارية.',
        ],
        url: 'https://example.com/sports/ahly-new-player',
        likesCount: 1800,
        commentsCount: 230,
        viewsCount: 15000,
      ),
      Article(
        id: 's5',
        title: 'بطولة كأس العالم للسيدات تنطلق الشهر المقبل',
        category: 'Sports',
        imageUrl:
            'https://cdn.pixabay.com/photo/2019/07/25/18/58/football-4363323_960_720.jpg',
        publisherName: 'الرياضة العالمية',
        publisherImage: 'W',
        publisherType: 'Sports',
        readTime: '4 min',
        date: '2023-05-03',
        paragraphs: [
          'تستعد الفرق المشاركة في بطولة كأس العالم للسيدات التي ستنطلق الشهر المقبل، حيث تتواصل التحضيرات في الدول المستضيفة.',
          'تشارك 32 فريقاً في البطولة، ويُتوقع أن تشهد منافسة قوية، خاصة مع تطور مستوى كرة القدم النسائية في السنوات الأخيرة.',
          'منتخب الولايات المتحدة يدخل البطولة كمرشح أول للفوز باللقب، لكن منتخبات أوروبية مثل إنجلترا وفرنسا وألمانيا تسعى للمنافسة بقوة.',
        ],
        url: 'https://example.com/sports/womens-world-cup',
        likesCount: 1500,
        commentsCount: 190,
        viewsCount: 12000,
      ),
    ];
  }

  static List<Article> _getTechnologyArticles() {
    return [
      Article(
        id: 't1',
        title: 'آبل تكشف عن هاتف آيفون الجديد بميزات ذكاء اصطناعي متطورة',
        category: 'Technology',
        imageUrl:
            'https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_960_720.jpg',
        publisherName: 'تك نيوز',
        publisherImage: 'T',
        publisherType: 'Technology',
        readTime: '4 min',
        date: '2023-05-15',
        paragraphs: [
          'كشفت شركة آبل عن الجيل الجديد من هواتف آيفون، الذي يأتي مع مزايا ذكاء اصطناعي متطورة تعزز تجربة المستخدم بشكل كبير.',
          'يتميز الهاتف الجديد بمعالج أسرع وكاميرا محسنة، بالإضافة إلى بطارية تدوم لفترة أطول، مما يجعله خياراً مثالياً لعشاق التكنولوجيا.',
          'من المتوقع أن يتم طرح الهاتف الجديد في الأسواق العالمية خلال الشهر المقبل، بسعر منافس مقارنة بالهواتف الذكية الأخرى.',
        ],
        url: 'https://example.com/tech/apple-new-iphone',
        likesCount: 2500,
        commentsCount: 320,
        viewsCount: 19000,
      ),
      Article(
        id: 't2',
        title: 'سامسونج تطلق نظارة الواقع المعزز الجديدة للألعاب والتطبيقات',
        category: 'Technology',
        imageUrl:
            'https://cdn.pixabay.com/photo/2018/06/07/16/49/virtual-3460451_960_720.jpg',
        publisherName: 'عالم التقنية',
        publisherImage: 'T',
        publisherType: 'Technology',
        readTime: '5 min',
        date: '2023-05-12',
        paragraphs: [
          'أطلقت شركة سامسونج نظارة الواقع المعزز الجديدة التي تستهدف عشاق الألعاب والتطبيقات التفاعلية.',
          'تتميز النظارة بتصميم خفيف الوزن وبطارية طويلة العمر، كما تدعم مجموعة واسعة من الألعاب والتطبيقات المتطورة.',
          'تسعى سامسونج من خلال هذا المنتج إلى منافسة شركات أخرى في سوق الواقع المعزز، الذي يشهد نمواً متسارعاً في السنوات الأخيرة.',
        ],
        url: 'https://example.com/tech/samsung-ar-glasses',
        likesCount: 1800,
        commentsCount: 240,
        viewsCount: 14000,
      ),
      // Add more technology articles
    ];
  }

  static List<Article> _getHealthArticles() {
    return [
      Article(
        id: 'h1',
        title:
            'دراسة جديدة: تناول القهوة بانتظام يقلل من خطر الإصابة بأمراض القلب',
        category: 'Health',
        imageUrl:
            'https://cdn.pixabay.com/photo/2015/05/31/10/54/coffee-791045_960_720.jpg',
        publisherName: 'الصحة اليوم',
        publisherImage: 'H',
        publisherType: 'Health',
        readTime: '4 min',
        date: '2023-05-14',
        paragraphs: [
          'كشفت دراسة علمية حديثة أن تناول القهوة بانتظام يمكن أن يساهم في تقليل خطر الإصابة بأمراض القلب بنسبة تصل إلى 15%.',
          'الدراسة التي أجراها باحثون من جامعة هارفارد شملت أكثر من 40 ألف شخص، وأظهرت أن المركبات الموجودة في القهوة تساعد في تحسين صحة الأوعية الدموية.',
          'ينصح الخبراء بتناول 2-3 أكواب من القهوة يومياً للاستفادة من فوائدها، مع تجنب إضافة كميات كبيرة من السكر.',
        ],
        url: 'https://example.com/health/coffee-heart-benefits',
        likesCount: 2100,
        commentsCount: 270,
        viewsCount: 16000,
      ),
      // Add more health articles
    ];
  }

  static List<Article> _getPoliticsArticles() {
    return [
      Article(
        id: 'p1',
        title: 'قمة عربية مرتقبة لبحث التحديات الإقليمية والقضايا المشتركة',
        category: 'Politics',
        imageUrl:
            'https://cdn.pixabay.com/photo/2013/07/13/12/43/flag-160486_960_720.png',
        publisherName: 'أخبار السياسة',
        publisherImage: 'P',
        publisherType: 'Politics',
        readTime: '6 min',
        date: '2023-05-18',
        paragraphs: [
          'من المقرر أن تنعقد قمة عربية مهمة الشهر المقبل، لبحث التحديات الإقليمية والقضايا المشتركة التي تواجه الدول العربية.',
          'ستناقش القمة عدة ملفات مهمة، بما في ذلك الأزمات السياسية في المنطقة، والتعاون الاقتصادي، وجهود مكافحة الإرهاب.',
          'يأمل القادة العرب في الخروج بقرارات فعالة تعزز التضامن العربي وتساهم في حل المشكلات المشتركة.',
        ],
        url: 'https://example.com/politics/arab-summit',
        likesCount: 1700,
        commentsCount: 230,
        viewsCount: 13000,
      ),
      // Add more politics articles
    ];
  }

  static List<Article> _getGenericArticles(String categoryName) {
    final List<Article> articles = [];

    // Generate 5 sample articles for this category
    for (int i = 1; i <= 5; i++) {
      articles.add(
        Article(
          id: '$i',
          title: 'مقال في قسم $categoryName رقم $i',
          category: categoryName,
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS47l-TBwq5J39we3hCYx0sV19z51nemqGCYAP4ZZCYSw&s&ec=72940543',
          publisherName: 'مجلة $categoryName',
          publisherImage: categoryName[0],
          publisherType: 'Publisher',
          readTime: '${i + 2} دقائق',
          date: '2023-04-${15 + i}',
          paragraphs: [
            'هذا مقال تجريبي عن $categoryName. المحتوى تم إنشاؤه لأغراض العرض فقط.',
            'مجال $categoryName في تطور مستمر، مع ظهور تطورات واتجاهات جديدة بانتظام.',
            'يتوقع الخبراء في مجال $categoryName نمواً كبيراً في السنوات القادمة.',
          ],
          url: 'https://example.com/categories/$categoryName/article-$i',
          likesCount: i * 100,
          commentsCount: i * 5,
          viewsCount: i * 1000,
        ),
      );
    }

    return articles;
  }
}
