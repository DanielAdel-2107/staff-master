import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projflut/model/property_model.dart';
import 'package:projflut/services/firestore_property.dart';

class GetPropertyController extends GetxController{

    String? locationn, area, type, paymentType, amenty, noOfRooms, noOfBaths, price, downPayment, installmentValue, description, userPhone, userEmail;

    //var userPhone, userEmail;


  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<PropertyModel> get propertyModel => _propertyModel;

  List<PropertyModel> _propertyModel = [];

  getProperties() async{
    _loading.value = true;
    FireStoreProperty().getPropertiess().then((value){
      for(int i = 0; i < value.length; i++){
        _propertyModel.add(PropertyModel.fromJson(value[i].data() as Map));
        _loading.value = false;
      }
      update();
    });
    }

    GetPropertyController(){
      getProperties();
    }

  CollectionReference properties = FirebaseFirestore.instance.collection('Staff Properties');

      Future<void> addProperty()async {

      return properties
          .add({
            'Location': locationn, 
            'area': area, 
            'type': type ,
            'number of rooms':noOfRooms,
            'number of baths': noOfBaths,
            'Amenties': amenty,
            'payment type': paymentType,
            'down payment': downPayment,
            'installment value': installmentValue,
            'description': description,
            'user phone': userPhone,
            'user email': userEmail
          })
          .then((value) {
            print("User Added");
            update();
            })
          .catchError((error) => print("Failed to add user: $error"));



    }

}