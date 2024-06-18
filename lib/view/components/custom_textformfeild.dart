import 'package:flutter/material.dart';
class CustomTextformfeild extends StatelessWidget {
  var labelTextt;
  var hintText;
  var icon;
  var keyboardType;
  var validator;
  var onsaved;

  CustomTextformfeild(this.labelTextt, this.hintText, this.icon, this.keyboardType, this.validator, this.onsaved);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    decoration: InputDecoration(
    labelText: labelTextt,
    labelStyle: TextStyle(color: Colors.black),
    hintText: hintText ,hintStyle:TextStyle(fontSize: 10,color: Colors.grey),
    suffixIcon: Icon(icon,size: 17,color:Color(0xff446FAF),),
    ), 
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      onSaved:onsaved ,
    );
  }
}