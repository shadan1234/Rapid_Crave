import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'history_screen.dart';
import 'home_screen.dart';
import 'orders_screen.dart';

class Restaurant_Main_Screen extends StatefulWidget {
  @override
  State<Restaurant_Main_Screen> createState() => _Restaurant_Main_ScreenState();
}

class _Restaurant_Main_ScreenState extends State<Restaurant_Main_Screen> {
  int _currentIndex = 0;
  final List<Widget> screens = [
    Home_Screen(),
    Orders_Screen(),
    History_Screen()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final history = ModalRoute.of(context)?.settings.name;
    if (history == '/menu_screen') {
      // Came from MenuScreen, set the initial index to 1 (Orders_Screen)
      setState(() {
        _currentIndex = 1;
      });

    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
         currentIndex: _currentIndex,
        onTap: (item) {
          setState(() {
            _currentIndex = item;

          });
        },
        items: [
          BottomNavigationBarItem(

            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.shopping_cart),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.history_edu),
            label: 'History',
          )
        ],
      ),
      appBar: AppBar(
        leading: Icon(Iconsax.menu4),
        title: Text(
          'Rapid Crave',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [

          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
             radius: 25,
              backgroundImage: AssetImage('assets/eren.jpeg'),
            ),

          )
        ],
      ),
      body: IndexedStack(index: _currentIndex,children: screens,)
    );
  }
}
