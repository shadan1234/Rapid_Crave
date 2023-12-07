import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wow/authenticate/authenticate.dart';
import 'package:wow/authenticate/register.dart';

import 'authenticate/sign_in.dart';
import 'home/main_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user == null)
      return Authenticate();
    else
      return Restaurant_Main_Screen();
  }
}
