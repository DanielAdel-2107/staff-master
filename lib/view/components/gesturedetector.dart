import 'package:flutter/material.dart';
class CustomGestureDetector extends StatelessWidget {
var text;
var ontap;
CustomGestureDetector(this.text, this.ontap);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: ontap,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                    color:const Color(0xff446FAF)
                    ),
                    child: Center(
                      child: Text(
                        text,
                        style:const TextStyle(
                        //fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white
                      ),
                      ),
                    ),
                    ),
                   
                );
  }
}