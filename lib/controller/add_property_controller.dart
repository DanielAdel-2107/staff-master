import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AddPropertyController extends GetxController{

  String? locationn, area, type, paymentType, amenty, noOfRooms, noOfBaths, price, downPayment, installmentValue, description;
  
  

  // var image;

  // List<XFile> imageList = [];

  // final imagePicker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Future<void> uploadImage() async{

  //   final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    
  //   imageList.addAll(selectedImages!);
  //   update();

  //   // if(selectedImages!.isNotEmpty){
  //   //   imageList.addAll(selectedImages);
  //   // }
  //   // else{}

  //   // var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

  //   // if(pickedImage != null){
  //   //     image = File(pickedImage.path);
  //   // }
  //   // else{}
  // }

  CollectionReference properties = FirebaseFirestore.instance.collection('Properties');

  DocumentReference doc_ref = FirebaseFirestore.instance.collection('Assessor Properties').doc();




  late DocumentSnapshot documentSnapshot;

  

  Future<void> addProperty()async {

      return properties
          .add({
            'Location': FirebaseFirestore.instance.collection('Assessor Properties').doc('Location'), 
            'area': documentSnapshot['area'], 
            'type': documentSnapshot['type'] ,
            'price': documentSnapshot['price'],
            'number of rooms':documentSnapshot['number of rooms'],
            'number of baths': documentSnapshot['number of baths'],
            'Amenties': documentSnapshot['Amenties'],
            'payment type': documentSnapshot['payment type'],
            'down payment': documentSnapshot['down payment'],
            'installment value': documentSnapshot['intsallment value'],
            'description': documentSnapshot['description']
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }


//---------------------------------------------------------------------------------------------------------------------------
  // var isLoading = false;

  // var propertyList = <PropertyModel>[];

  // Future<void> getData()async{

  //   try{
  //     QuerySnapshot properties = await FirebaseFirestore.instance.collection('Properties').get();

  //     propertyList.clear();

  //     for(var property in properties.docs){
  //       propertyList.add(PropertyModel(property.id, property['location'], property['area'], property['type'], property['number of rooms'], property['number of baths'], property['amenties'], property['payment type'], property['down payment'], property['installment value']));
  //     }
  //     isLoading = false;

  //   }catch(e){
  //       Get.snackbar('error', '${e.toString()}');
  //   }
  // }

}