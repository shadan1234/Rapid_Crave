import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/order_tile_model.dart';

class HistoryState extends ChangeNotifier {
  List<Order> orderItems = [];

  void addToOrder(List<Order>items) {
    orderItems.addAll(items);
    notifyListeners();

  }



}
