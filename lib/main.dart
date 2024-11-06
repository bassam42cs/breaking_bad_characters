import 'package:breaking_bad/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(appRoutes: AppRoutes()));
}

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes;
  const MyApp({super.key ,required this.appRoutes});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
     debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoutes.generateRoute,

    );
  }
}

