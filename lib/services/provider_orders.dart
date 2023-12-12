import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/order_tile_model.dart';

class MenuState extends ChangeNotifier {
  List<Order> orderItems = [];
  List<Order> historyItems = [];

  void addToOrder(List<Order>items) {
    int f=0,i,j;
    for(i=0;i<items.length;i++)
      {
        f=0;
        for( j=0;j<orderItems.length;j++)
          {
            if(items[i].restaurantName==orderItems[j].restaurantName && items[i].orderItem==orderItems[j].orderItem)
              {
                f++;
                break;
              }
          }
        if(f>0)
          {
            orderItems[j].orderQuantity=items[i].orderQuantity;
          }
        else
          {
            orderItems.add(items[i]);
          }
      }

    notifyListeners();
  }
  void emptyTheList(){
    if (orderItems.isNotEmpty) {
      historyItems = List.from(orderItems);
      orderItems.clear();}
    notifyListeners();
  }
}
