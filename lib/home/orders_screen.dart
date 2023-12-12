import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidcrave/services/provider_history.dart';

import '../services/provider_orders.dart';
import '../utils/item_map_photo.dart';

class Orders_Screen extends StatelessWidget {
  const Orders_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderItems = context.watch<MenuState>().orderItems;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: ListView.builder(
                itemCount: orderItems.length,
                itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: foodToPhotoMapping[orderItems[index].orderItem],
                  title: Text('${orderItems[index].orderQuantity}  ${orderItems[index].orderItem}'),

                  subtitle: Text('${orderItems[index].restaurantName}'),
                );
                },



              ),
            ),
            Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                                onPressed: (){
                                  context.read<HistoryState>().addToOrder(orderItems);
                                  // Clear orderItems in MenuState
                                  context.read<MenuState>().emptyTheList();
                                },
                                child: Text('Place Order'),
                              ),
                )

            )
          ],
        ),
      ),
    );
  }
}
