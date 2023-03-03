import 'package:flutter/material.dart';
import 'package:dashboard/AppTheme.dart';
import 'package:dashboard/routes/RouteGenerator.dart';
import 'package:dashboard/error_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dashboard',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          initialRoute: '/signIn',
          onGenerateRoute: RouteGenerator.generateRoute,
          builder: (BuildContext context, Widget widget) {
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return ErrorPage(errorDetails);
            };
            return widget;
          },
        );}
  }

