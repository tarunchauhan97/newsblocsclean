import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:newsblocsclean/core/failures_successes/failures.dart';
import 'package:newsblocsclean/features/show_news/domain/entities/news_info.dart';
import 'package:newsblocsclean/features/show_news/domain/usecases/fetch_news.dart';
import 'package:newsblocsclean/service_locator.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial(news: const []));

  final FetchNewsUseCase _fetchNewsUseCase = sl<FetchNewsUseCase>();

  void fetchNews(String? searchText) async {
    emit(NewsLoading());
    final Either<Failure, List<NewsInfo>> fetchNewsResult =
        await _fetchNewsUseCase.fetchNews(searchText);
    fetchNewsResult.fold(
      (l) => emit(NewsError()),
      (news) => emit(NewsInitial(news: news)),
    );
  }
}
