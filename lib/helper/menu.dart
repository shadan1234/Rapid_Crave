import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rapidcrave/utils/food_map_icon.dart';



import '../models/order_tile_model.dart';
import '../services/provider_orders.dart';
import '../utils/custom_icons_icons.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<Order> menuItems = [
    Order(orderQuantity: 0, orderItem: 'Pizza', restaurantName: 'Dominos'),
    Order(orderQuantity: 0, orderItem: 'Burger', restaurantName: 'Dominos'),
    Order(orderQuantity: 0, orderItem: 'Chicken', restaurantName: 'Dominos'),
    Order(orderQuantity: 0, orderItem: 'Wine', restaurantName: 'Dominos'),
  ];

  void incrementOrder(int index) {
    setState(() {
      menuItems[index].orderQuantity++;
    });
  }

  void decrementOrder(int index) {
    if (menuItems[index].orderQuantity > 0) {
      setState(() {
        menuItems[index].orderQuantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderItems = context.watch<MenuState>().orderItems;
    if(orderItems!=null)
      {
        for(int i=0;i<orderItems.length;i++)
          {
            if(orderItems[i].orderItem=='Pizza' && orderItems[i].restaurantName==menuItems[0].restaurantName)
              {
                menuItems[0]=orderItems[i];
              }
            if(orderItems[i].orderItem=='Burger' && orderItems[i].restaurantName==menuItems[0].restaurantName)
            {
              menuItems[1]=orderItems[i];
            }
            if(orderItems[i].orderItem=='Chicken' && orderItems[i].restaurantName==menuItems[0].restaurantName)
            {
              menuItems[2]=orderItems[i];
            }
            if(orderItems[i].orderItem=='Wine' && orderItems[i].restaurantName==menuItems[0].restaurantName)
            {
              menuItems[3]=orderItems[i];
            }
          }
      }


    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: 10,
          top: 28,
        ),
        child: Column(
          children: [
            Row(

              children: [
              IconButton(onPressed: () { Navigator.pop(context); },
              icon:  Icon(Icons.arrow_back_ios_new_outlined),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Text(
                  'Dominos',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
              ),

            ],),


            Divider(),
            Expanded(
              flex: 8,
              child: ListView(
                // shrinkWrap: true,
                children: [

                  for (int i = 0; i < menuItems.length; i++)
                    ListTile(
                      leading: Icon(foodToIconMapping[menuItems[i].orderItem]),
                      title: Text('${menuItems[i].orderItem}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => incrementOrder(i),
                          ),
                          Text(
                            menuItems[i].orderQuantity.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => decrementOrder(i),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12, bottom: 12),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        // fixedSize: Size(50, 20),
                      ),
                      onPressed: () {
                        final List<Order> selectedItems = menuItems
                            .where((item) => item.orderQuantity > 0)
                            .toList();

                        // Pass the list of selected items to the addToOrder method
                        context.read<MenuState>().addToOrder(selectedItems);
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text(
                        'PlaceOrder',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
