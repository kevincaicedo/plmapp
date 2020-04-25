import 'package:flutter/material.dart';
import 'package:plmapp/config/constant.dart';
import 'package:plmapp/config/routes.dart';

class PlmApp extends StatelessWidget {
  const PlmApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME_DISPLAY,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: Routes.main,
      routes: Routes.getRoute(),
    );
  }
}
