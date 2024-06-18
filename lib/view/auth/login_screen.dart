import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projflut/controller/auth_controller.dart';
import 'package:projflut/view/auth/signup_screen.dart';
import 'package:projflut/view/components/custom_textformfeild.dart';
import 'package:projflut/view/components/gesturedetector.dart';

class LoginScreen extends GetWidget<AuthController> {
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
TextEditingController emailCont = TextEditingController();
  //AuthController controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(45),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
               const Text(
                  'LogIn',
                  style: TextStyle(
                    color: Color(0xff446FAF),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  ),
                ),
               const SizedBox(height: 30,),
                Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                            decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'name@email.com' ,hintStyle:TextStyle(fontSize: 10,color: Colors.grey),
                            suffixIcon: Icon(Icons.email,size: 17,color:Color(0xff446FAF),),
                            ), 
                              keyboardType: TextInputType.emailAddress,
                              validator:  (value){
                            if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                                  }
                                 },
                              onSaved:(newValue) {
                                controller.email = newValue!;
                              } ,
                              controller: emailCont,
                            ),
                      // CustomTextformfeild('Email', 'name@email.com', Icons.email, TextInputType.emailAddress,
                      // (value){
                      //   if (value == null || value.isEmpty) {
                      //       return 'Please enter some text';
                      // }
                      // },
                      //  (newvalue){
                      //   controller.email = newvalue;}
                      //   ),
                       const SizedBox(height: 20,),
                      CustomTextformfeild('password', '********', Icons.password, TextInputType.text,
                       (value){
                        if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                      }
                       },
                       (newvalue){
                        controller.password = newvalue;
                       }
                       ),
                    ]
                    ),
                ),
               const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 20,),
                    GestureDetector(
                      onTap: () async{
                        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailCont.text);
                      },
                      child:Text('Forgot Password?',
                       style: TextStyle(
                        color:Color(0xff446FAF),
                        fontWeight: FontWeight.bold
                         ),
                        ) ,
                        ),
                  ],
                ),
                const SizedBox(height: 50,),
                CustomGestureDetector('LogIn',
                 (){
                  _formkey.currentState!.save();
                  if(_formkey.currentState!.validate()){
                    controller.signInWithEmailAndPasswordMethod();
                  }
                  //Get.to(WelcomePage());
                  }
                  ),
                 const SizedBox(height: 20,),
                 CustomGestureDetector('LogIn with google', (){
                  AuthController().googleSignInMethod();
                 }),
                 const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const Text('do not have an accont?'),
                      GestureDetector(child:const Text(
                        'SignUp', 
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff446FAF), fontWeight: FontWeight.bold),
                          ),
                          onTap: (){Get.to(SignupScreen());}
                            )
                    ],
                  ),
                  const SizedBox(height: 30,),
                  
              ],
              )
              ),
        )
          ),
    );
  }
}