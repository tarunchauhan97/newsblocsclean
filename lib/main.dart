import 'package:flutter/material.dart';
import 'package:newsblocsclean/core/constants/palette.dart';
import 'package:newsblocsclean/service_locator.dart';

import 'features/show_news/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Blocs Clean App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.light().copyWith(
            secondary: Palette.deepBlue,
          ),
          fontFamily: 'Poppins'),
      home: const HomePage(),
    );
  }
}
