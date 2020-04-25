import 'package:flutter/material.dart';
import 'package:plmapp/app/app.dart';
import 'locator.dart' as service_locator;

void main() {
  service_locator.init();
  runApp(PlmApp());
}
