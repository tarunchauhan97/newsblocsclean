import 'package:newsblocsclean/features/show_news/domain/entities/news_info.dart';

class NewsInfoModel extends NewsInfo {
  // NewsInfoModel({required super.dateTime});

  NewsInfoModel({
    String? title,
    String? author,
    String? imageUrl,
    String? content,
    String? dateTime,
  }) : super(
          title: title,
          author: author,
          imageUrl: imageUrl,
          content: content,
          dateTime: _getDataTimeInDateTime(dateTime),
        );

  static DateTime _getDataTimeInDateTime(String? dateTime) {
    if (dateTime == null) {
      return DateTime.now();
    } else {
      final DateTime? dateTimeInDateFormat = DateTime.tryParse(dateTime);
      if (dateTimeInDateFormat == null) {
        return DateTime.now();
      } else
        return dateTimeInDateFormat;
    }
  }

  factory NewsInfoModel.fromMap(Map<String, dynamic> newsMap) {
    return NewsInfoModel(
      title: newsMap['title'],
      author: newsMap['author'],
      imageUrl: newsMap['urlToImage'],
      content: newsMap['content'],
      dateTime: newsMap['publishedAt'],
    );
  }
}
