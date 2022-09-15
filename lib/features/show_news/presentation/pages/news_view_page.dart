import 'package:flutter/material.dart';
import 'package:newsblocsclean/core/constants/palette.dart';
import 'package:newsblocsclean/features/show_news/domain/entities/news_info.dart';

class NewsViewPage extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsViewPage({Key? key, required this.newsInfo}) : super(key: key);

  String _getDataInDDMMYYFormat(DateTime dateTime){
    return "${dateTime.day}/ ${dateTime.month}/ ${dateTime.year}";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Palette.deepBlue,
            size: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsInfo.title != null ? newsInfo.title! : "No title",
                style: TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 300,
                color: Palette.lightGrey,
                child: newsInfo.imageUrl != null
                    ? Image.network(
                  newsInfo.imageUrl!,
                  // "https://images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg",
                  fit: BoxFit.cover,
                )
                    : const SizedBox(),
              ),
              SizedBox(height: 16),
              Text(
                // "Date: 14/09/2022",
                _getDataInDDMMYYFormat(newsInfo.dateTime!),
                style: TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              Text(
                newsInfo.author != null ? newsInfo.author! : "No Author",
                // "Author/Publisher Name: Tarun,",
                style: TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              Text(
                newsInfo.content != null ? newsInfo.content! : "No Content",
                // "News Content",
                style: TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
