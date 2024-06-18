import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projflut/utils/binding.dart';
import 'package:projflut/view/control_view.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      home: ControlView(),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
