class NewsInfo {
  final String? title;
  final String? author;
  final String? imageUrl;
  final String? content;
  final String dateTime;

  NewsInfo({
    this.title,
    this.author,
    this.imageUrl,
    this.content,
    required this.dateTime,
  });
}

// NewsInfo({
//   required this.title,
//   required this.author,
//   required this.imageUrl,
//   required this.content,
//   required this.dateTime,
// });
