import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsblocsclean/core/constants/palette.dart';
import 'package:newsblocsclean/features/login_screen/bloc/auth_bloc.dart';
import 'package:newsblocsclean/features/login_screen/data/repositories/auth_repository.dart';
import 'package:newsblocsclean/features/login_screen/presentation/sign_in.dart';
import 'package:newsblocsclean/features/show_news/presentation/news_cubit/news_cubit.dart';
import 'package:newsblocsclean/service_locator.dart';
import 'features/show_news/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(authRepository: sl<AuthRepository>()),
          ),
          BlocProvider(
            create: (_) => NewsCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'News Blocs Clean App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              colorScheme: ColorScheme.light().copyWith(
                secondary: Palette.deepBlue,
              ),
              fontFamily: 'Poppins'),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return const HomePage();
              } else
                return SignIn();
            },
          ),
        ));
  }
}
