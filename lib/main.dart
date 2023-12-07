
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow/Wrapper.dart';
import 'package:wow/services/auth.dart';

import 'home/main_screen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(value: AuthService().user, initialData: null,
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Restaurant_Main_Screen(),
      ),
    );
  }
}
