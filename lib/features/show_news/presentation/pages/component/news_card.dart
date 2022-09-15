import 'package:flutter/material.dart';
import 'package:newsblocsclean/core/constants/palette.dart';
import 'package:newsblocsclean/features/show_news/domain/entities/news_info.dart';
import 'package:newsblocsclean/features/show_news/presentation/pages/news_view_page.dart';

class NewsCard extends StatelessWidget {
  final NewsInfo newsInfo;

  const NewsCard({Key? key, required this.newsInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => NewsViewPage(newsInfo: newsInfo),
          ),
        );
      },
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width - (2 * 16),
        margin: EdgeInsets.only(bottom: 16),
        child: Stack(
          children: [
            Container(
              height: 260,
              color: Palette.lightGrey,
              child: newsInfo.imageUrl != null
                  ? Image.network(
                      newsInfo.imageUrl!,
                      // "https://images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg",
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    newsInfo.title != null ? newsInfo.title! : "No title",
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
