import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidcrave/services/provider_history.dart';

import '../helper/history_card.dart';
import '../services/provider_orders.dart';

class History_Screen extends StatelessWidget {
  const History_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final historyItems = context.watch<MenuState>().historyItems;
    // print(historyItems);

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: historyItems.length,
          itemBuilder: (BuildContext context, int index) {
            print(historyItems[index].orderItem);
            print(historyItems[index].orderQuantity);
            print(historyItems[index].restaurantName);
            return History_Card(

                restaurantName: historyItems[index].restaurantName,
                itemName: historyItems[index].orderItem,
                itemQuantity: historyItems[index].orderQuantity);
          },
        ),
      ),
    );
  }
}
