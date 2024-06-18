import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projflut/controller/auth_controller.dart';
import 'package:projflut/view/auth/login_screen.dart';
import 'package:projflut/view/components/custom_textformfeild.dart';

import '../components/gesturedetector.dart';

class SignupScreen extends GetWidget<AuthController> {
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
return Scaffold(
  
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
               const Text(
                  'Sign Up',
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
                      CustomTextformfeild('Name', 'Enter your Name', Icons.abc, TextInputType.text, 
                      (value){
                        if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                      }
                    },
                     (newvalue){
                      controller.name = newvalue;
                     }
                      ),
                     const SizedBox(height: 20,),
                      CustomTextformfeild('Phone', '01234567891', Icons.phone, TextInputType.number,
                       (value){
                        if(value == null || value.isEmpty){
                          return 'please enter some text';
                        }
                       },
                       (newvalue){
                        controller.phone = newvalue;
                       }
                       ),
                     const SizedBox(height: 20,),
                      CustomTextformfeild('Email', 'name@email.com', Icons.email, TextInputType.emailAddress,
                      (value){
                        if(value == null || value.isEmpty){
                          return 'please rnter some text';
                        }
                      }, (newvalue){
                        controller.email = newvalue;
                      }),
                     const SizedBox(height: 20,),
                      CustomTextformfeild('password', '********', Icons.password, TextInputType.text,
                       (value){
                        if(value == null || value.isEmpty){
                          return 'please enter some text';
                        }
                       },
                        (newvalue){
                          controller.password  = newvalue;
                        }
                        ),
                    ]
                    ),
                ),
               const SizedBox(height: 50,),
                
                CustomGestureDetector('SignUp', (){
                  
                  _formkey.currentState!.save();
                  if(_formkey.currentState!.validate()){
                    controller.createAccountWithEmailAndPasswordMethod();
                  }
                }),
                 const SizedBox(height: 20,),
              CustomGestureDetector('SignUp with google', (){}),
                const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const Text('already have an accont?'),
                      GestureDetector(child:const Text(
                        'Login', 
                        style: TextStyle(
                          color: Color(0xff446FAF), fontWeight: FontWeight.bold),
                          ),
                          onTap: (){
                            if(_formkey.currentState!.validate()){
                            try{
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                            }
                            catch(e){
                              print(e);
                            }
                          }
                          }
                          )
                    ],
                  ),
                  
              ],
              )
              ),
        )
          ),
    );
      }
}
//notes
// Get.off(WelcomePage()); //go to welcome page and remove the layer before it
// Get.offAll(WelcomePage()); // go to welcome page and make it the only page(first page)
// Get.back(); // go back 
// GetBuilder -> faster than GetX and take less memory
// GetX -> more reactive(use stream) and does not need update fanction, only need regint x = 0.obs
//Obx -> can work with more than one controller
//controller initiallized one time if there are more than GetBuilders used
//GetBuilder should be used only when something is being changed(as counter example), but GetBuilder does not work when it is with material button only
//HomeController controller = Get.put(HomeController()); //intialization for controller so the buttons that perform functions can not be in the GetBuilder
//HomeController controller = Get.put(HomeController()); //intialized only when needed
//HomeController controller = Get.find(HomeController()); //show error if the controller not initialized(prevent errors in the screens that the controller not initialized in)
//lazyput initialzied only one time , if it cleared(get out of the screen), it will not be initialized again 
//this problem can be solved if we add parameter (fenix = true)
//initialbinding can replace Get.put and should use Get.find with it as the find function aims to find dependencies that is in the binding
//middleware for sharedpreferences