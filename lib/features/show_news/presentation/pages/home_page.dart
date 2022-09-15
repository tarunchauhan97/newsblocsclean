import 'package:flutter/material.dart';
import 'package:newsblocsclean/core/constants/palette.dart';
import 'package:newsblocsclean/features/show_news/presentation/news_cubit/news_cubit.dart';
import 'package:newsblocsclean/features/show_news/presentation/pages/component/news_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().fetchNews(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        title: Text(
          "News",
          style: TextStyle(
            color: Palette.deepBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              cursorColor: Palette.deepBlue,
              style: TextStyle(
                color: Palette.deepBlue,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Palette.lightGrey,
                  size: 20,
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Palette.lightGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Palette.deepBlue),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Top News",
              style: TextStyle(
                color: Palette.deepBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<NewsCubit, NewsState>(builder: (_, state) {
                if (state is NewsInitial) {
                  return ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (_, index) {
                        return NewsCard(newsInfo: state.news[index]);
                      });
                } else if (state is NewsLoading)
                  return const Center(child: CircularProgressIndicator());
                else {
                  return const Center(child: Text("tatat"));
                }
              }),
            ),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: 10,
            //       itemBuilder: (_, index) {
            //         return NewsCard();
            //       }),
            // ),
            // NewsCard(),
          ],
        ),
      ),
    );
  }
}
