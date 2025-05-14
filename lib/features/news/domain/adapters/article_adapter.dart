import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/features/news/domain/entities/article.dart';

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final int typeId = 1; // Unique type id for Article

  @override
  Article read(BinaryReader reader) {
    return Article(
      id: reader.readString(),
      title: reader.readString(),
      category: reader.readString(),
      imageUrl: reader.readString(),
      publisherName: reader.readString(),
      publisherImage: reader.readString(),
      publisherType: reader.readString(),
      readTime: reader.readString(),
      date: reader.readString(),
      paragraphs: List<String>.from(reader.readList()),
      url: reader.readString(),
      quote: reader.readString(),
      quoteAuthor: reader.readString(),
      likesCount: reader.readInt(),
      commentsCount: reader.readInt(),
      viewsCount: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.category);
    writer.writeString(obj.imageUrl);
    writer.writeString(obj.publisherName);
    writer.writeString(obj.publisherImage);
    writer.writeString(obj.publisherType);
    writer.writeString(obj.readTime);
    writer.writeString(obj.date);
    writer.writeList(obj.paragraphs);
    writer.writeString(obj.url);
    writer.writeString(obj.quote);
    writer.writeString(obj.quoteAuthor);
    writer.writeInt(obj.likesCount);
    writer.writeInt(obj.commentsCount);
    writer.writeInt(obj.viewsCount);
  }
}
