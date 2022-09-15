import 'package:newsblocsclean/core/constants/strings.dart';
import 'package:newsblocsclean/core/failures_successes/exceptions.dart';
import 'package:newsblocsclean/core/services/api_service.dart';
import 'package:newsblocsclean/features/show_news/data/models/news_info_model.dart';
import 'package:newsblocsclean/service_locator.dart';

abstract class FetchFromRemoteDataResource {
  Future<List<NewsInfoModel>> fetchNews(String? searchText);
}

class FetchFromRemoteDataResourceImpl implements FetchFromRemoteDataResource {
  final ApiService apiService = sl<ApiService>();

  // final ApiService apiService;
  //
  // const FetchFromRemoteDataResourceImpl({required this.apiService});

  @override
  Future<List<NewsInfoModel>> fetchNews(String? searchText) async {
    try {
      Map<String, dynamic> mapDataResponse = await apiService
          .getData(searchText != null ? Strings.apiEverything : Strings.apiTopHeadlines, {
        'apiKey': Strings.apiKey,
        if (searchText == null) 'country': 'in',
        if (searchText != null) 'q': searchText,
      });
      List list = mapDataResponse['articles'];
      List<Map<String, dynamic>> mapList = [];
      for (int i = 0; i < list.length; i++) {
        Map<String, dynamic> map = list[i] as Map<String, dynamic>;
        mapList.add(map);
      }

      List<NewsInfoModel> news = [];
      for (int i = 0; i < mapList.length; i++) {
        NewsInfoModel newsInfoModel = NewsInfoModel.fromMap(mapList[i]);
        news.add(newsInfoModel);
      }
      return news;
    } catch (e) {
      throw FetchException(message: 'failed to get data');
    }
  }
}
