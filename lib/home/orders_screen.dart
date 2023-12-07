import 'package:flutter/material.dart';

class Orders_Screen extends StatelessWidget {
  const Orders_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('Order 1'),
            subtitle: Text('Details about Order 1'),
          ),
          ListTile(
            title: Text('Order 2'),
            subtitle: Text('Details about Order 2'),
          ),
          // Add more list items as needed
        ],
      ),
    );
  }
}
