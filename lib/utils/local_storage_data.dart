import 'dart:convert';

import 'package:get/get.dart';
import 'package:projflut/constants.dart';
import 'package:projflut/model/assessor_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController{

  Future<AssessorModel?> get getUser async{
    try{
      AssessorModel userModel = await _getUserData();
      if(userModel == null){
        return null;
      }
      return userModel;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var value = pref.getString(CACHED_USER_DATA);

    return AssessorModel.fromJson(json.decode(value!));
  }

  setUser(AssessorModel userModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
  }

  void deleteUser() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}