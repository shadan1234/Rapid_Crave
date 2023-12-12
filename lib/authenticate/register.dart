import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../helper/position_for_stack_in_sign_in_page.dart';
import '../helper/textfield_for_auth_pages.dart';
import '../services/auth.dart';

class Register_Page extends StatefulWidget {
final Function toggleView ;
 Register_Page({required this.toggleView});

  @override
  _Register_PageState createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  int activeIndex = 0;
  String? password;
  String? email;
  String? error="";

  final _formKey = GlobalKey<FormState>();


  void updateEmailFieldValue(String newValue) {
    setState(() {
      email = newValue;
    });
  }

  void updatePasswordFieldValue(String newValue) {
    setState(() {
      password = newValue;
    });
  }

  final AuthService _auth = AuthService();
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          activeIndex++;

          if (activeIndex == 4) activeIndex = 0;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 350,
              child: Stack(children: [
                Positioned_for_Auth_Pages(
                  opacity: (activeIndex == 0) ? 1 : 0,
                  image_for_page:
                      'https://ouch-cdn2.icons8.com/As6ct-Fovab32SIyMatjsqIaIjM9Jg1PblII8YAtBtQ/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNTg4/LzNmMDU5Mzc0LTky/OTQtNDk5MC1hZGY2/LTA2YTkyMDZhNWZl/NC5zdmc.png',
                ),
                Positioned_for_Auth_Pages(
                    opacity: (activeIndex == 1) ? 1 : 0,
                    image_for_page:
                        'https://ouch-cdn2.icons8.com/vSx9H3yP2D4DgVoaFPbE4HVf6M4Phd-8uRjBZBnl83g/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNC84/MzcwMTY5OS1kYmU1/LTQ1ZmEtYmQ1Ny04/NTFmNTNjMTlkNTcu/c3Zn.png'),
                Positioned_for_Auth_Pages(
                    opacity: (activeIndex == 2) ? 1 : 0,
                    image_for_page:
                        'https://ouch-cdn2.icons8.com/fv7W4YUUpGVcNhmKcDGZp6pF1-IDEyCjSjtBB8-Kp_0/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMTUv/ZjUzYTU4NDAtNjBl/Yy00ZWRhLWE1YWIt/ZGM1MWJmYjBiYjI2/LnN2Zw.png'),
                Positioned_for_Auth_Pages(
                    opacity: activeIndex == 3 ? 1 : 0,
                    image_for_page:
                        'https://ouch-cdn2.icons8.com/AVdOMf5ui4B7JJrNzYULVwT1z8NlGmlRYZTtg1F6z9E/rs:fit:784:767/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvOTY5/L2NlMTY1MWM5LTRl/ZjUtNGRmZi05MjQ3/LWYzNGQ1MzhiOTQ0/Mi5zdmc.png'),
              ]),
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextField_for_Auth(
                    labelText: 'Email',
                    hintText: 'Email or Username',
                    iconss: Iconsax.user,
                    onValueChanged: updateEmailFieldValue,
                    validationFunction: (String? val) {
                      if (val==null || val.isEmpty)
                        {
                        return "Enter a valid email";}
                      else
                        {

                          return null;}
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  TextField_for_Auth(
                    labelText: 'Password',
                    hintText: 'Password',
                    iconss: Iconsax.key,
                    onValueChanged: updatePasswordFieldValue,
                    validationFunction: (String? val) {
                      if (val==null || val.length<6)
                       {  return "Password should be of atleast 6 characteres";}
                      else{

                        return null;
                      }

                    },
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$error',style: TextStyle(color: Colors.red[800]),),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () async{

                if(_formKey.currentState?.validate()??false) {

                dynamic result= await _auth.registerUserWithEmailAndPassword(email!, password!);
                if(result==null)
                  {
                    setState(() {
                      error='Invalid Credentials';
                    });
                  }
                }

              },
              height: 45,
              color: Colors.black,
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
