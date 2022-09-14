import 'package:newsblocsclean/core/failures_successes/failures.dart';
import 'package:newsblocsclean/features/show_news/domain/entities/news_info.dart';
import 'package:dartz/dartz.dart';
import 'package:newsblocsclean/features/show_news/domain/repositories/fetch_repo_contract.dart';

class FetchNewsUseCase {
  final FetchRepo fetchRepo;

  const FetchNewsUseCase({required this.fetchRepo});

  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) {
    return fetchRepo.fetchNews(searchText);
  }
}
