import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rapidcrave/utils/item_map_photo.dart';

class History_Card extends StatefulWidget {
  String restaurantName;
  String itemName;
  int itemQuantity;
  History_Card({
    required this.restaurantName,required this.itemName,required this.itemQuantity
});

  @override
  State<History_Card> createState() => _History_CardState();
}

class _History_CardState extends State<History_Card> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                      Container(child: foodToPhotoMapping[widget.itemName],) ,
                // SizedBox(width: 60,),
                Text(
                  widget.restaurantName,
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.itemQuantity}* ${widget.itemName}',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18),
                ),
                Column(
                  children: [
                    Text(
                      'Ordered on: 23-03-2003',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    // SizedBox(height: 8),
                    Text(
                      'Total Price: \$12.5}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
