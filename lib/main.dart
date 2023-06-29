import 'package:flutter/material.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/data/model/user.dart';
import 'package:flutter_full_course/provider/app_repo.dart';
import 'package:flutter_full_course/provider/post_provider.dart';
import 'package:flutter_full_course/provider/user_provider.dart';
import 'package:flutter_full_course/styles/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppRepo>(
        create: (context) => AppRepo(),
      ),
      ChangeNotifierProvider<PostProvider>(
        create: (context) => PostProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: AppColors.background,
        brightness: Brightness.dark,
      ),
      initialRoute: AppRoutes.user,
      routes: AppRoutes.pages,
    );
  }
}
