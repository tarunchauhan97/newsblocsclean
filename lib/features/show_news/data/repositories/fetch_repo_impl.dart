import 'package:dartz/dartz.dart';
import 'package:newsblocsclean/core/failures_successes/exceptions.dart';
import 'package:newsblocsclean/core/failures_successes/failures.dart';
import 'package:newsblocsclean/features/show_news/data/data_sources/fetch_from_remote_datasource.dart';
import 'package:newsblocsclean/features/show_news/domain/entities/news_info.dart';
import 'package:newsblocsclean/features/show_news/domain/repositories/fetch_repo_contract.dart';
import 'package:newsblocsclean/service_locator.dart';
class FetchRepoImpl implements FetchRepo {
  final FetchFromRemoteDataResource fetchFromRemoteDataResource = sl<FetchFromRemoteDataResource>();

  // FetchRepoImpl({required this.fetchFromRemoteDataResource});

  @override
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) async {
    try {
      return Right(await fetchFromRemoteDataResource.fetchNews(searchText));
    } on FetchException catch (e) {
      return Left(
        FetchFailure(message: e.message!),
      );
    }
  }
}
