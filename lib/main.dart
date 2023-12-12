
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidcrave/services/auth.dart';
import 'package:rapidcrave/services/provider_history.dart';
import 'package:rapidcrave/services/provider_orders.dart';

import 'helper/menu.dart';
import 'home/main_screen.dart';
import 'home/orders_screen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
    StreamProvider<User?>.value(value: AuthService().user, initialData: null,),
      ChangeNotifierProvider(create: (context)=>MenuState()),
      ChangeNotifierProvider(create: (context)=>HistoryState()),




      ],
        // BlocProvider<SubjectBloc>(
        //   create: (context) => SubjectBloc(),
        //   child: Container(),
        // ),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/' : (context)=>Restaurant_Main_Screen(),
          '/orders_screen':(context)=>Orders_Screen(),
          '/menu_screen':(context)=>Menu(),

        },
        // home: Restaurant_Main_Screen(),
      ),
    );
  }
}
