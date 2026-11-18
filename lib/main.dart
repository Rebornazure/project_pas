import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    title: 'Kuliner & Premier League',
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.login,
    getPages: Routes.mypages,
  );
}
