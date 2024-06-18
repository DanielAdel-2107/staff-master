import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projflut/controller/auth_controller.dart';
import 'package:projflut/view/auth/login_screen.dart';
import 'package:projflut/view/home_screen.dart';

class ControlView extends GetWidget<AuthController> {


  @override
  Widget build(BuildContext context) {
    return Obx(
      (){
        return (Get.find<AuthController>().user == null) 
        ? LoginScreen()
        : AssessorPage();
      }
    );
  }
  //  Widget buttomNavigationBar() {
  //   return GetBuilder<HomeController>(
  //     init: HomeController(),
  //     builder: (controller) => BottomNavigationBar(
  //       items: [
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.explore),
  //           label: 'explore',
            
  //           ),
  //           BottomNavigationBarItem(
  //           icon: Icon(Icons.favorite),
  //           label: 'saved',
            
  //           ),
  //           BottomNavigationBarItem(
  //           icon: Icon(Icons.person),
  //           label: 'profile',
            
  //           )
  //       ],
  //       currentIndex: controller.navigatorValue,
  //       onTap: (index){
  //         controller.changeSelectedValue(index);
  //         },
  //       elevation: 0,
  //       selectedItemColor: Color(0xff446FAF),
  //       backgroundColor: Colors.grey.shade100,
  //       ),
  //   );
  // }
}