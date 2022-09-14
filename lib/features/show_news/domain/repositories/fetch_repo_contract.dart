import 'package:dartz/dartz.dart';
import 'package:newsblocsclean/core/failures_successes/failures.dart';
import 'package:newsblocsclean/features/show_news/domain/entities/news_info.dart';

abstract class FetchRepo {
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText);
}
