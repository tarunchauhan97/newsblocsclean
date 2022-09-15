import 'package:get_it/get_it.dart';
import 'package:newsblocsclean/core/services/api_service.dart';
import 'package:newsblocsclean/features/show_news/data/data_sources/fetch_from_remote_datasource.dart';
import 'package:newsblocsclean/features/show_news/data/repositories/fetch_repo_impl.dart';
import 'package:newsblocsclean/features/show_news/domain/repositories/fetch_repo_contract.dart';
//s1 service locator

final GetIt sl = GetIt.instance;

void setUpServices() {
  sl.registerSingleton<ApiService>(ApiServiceImpl());
  sl.registerSingleton<FetchFromRemoteDataResource>(FetchFromRemoteDataResourceImpl());
  sl.registerSingleton<FetchRepo>(FetchRepoImpl());
  // sl.registerSingleton<FetchRepo>(FetchRepoImpl(fetchFromRemoteDataResource: fetchFromRemoteDataResource));
}
