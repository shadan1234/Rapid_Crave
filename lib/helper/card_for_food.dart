import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/custom_icons_icons.dart';

// import 'package:wow/utils/my_flutter_app_icons.dart';


class Card_For_Food extends StatelessWidget {
  const Card_For_Food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Card(

        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            // Food Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  child: Image.asset(
                    'assets/pizza.jpeg',
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),

                // Wishlist Button
                Positioned(
                  top: 10.0,
                  right: 6.0,
                  child: IconButton(
                    icon: Icon(CustomIcons.heart, size: 20,color: Colors.red,),
                    onPressed: () {
                      // Handle wishlist button tap
                    },
                  ),
                ),
              ],
            ),

            // Food Name and Rating
            Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dominos',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      _buildStarIcon(),
                      _buildStarIcon(),
                      _buildStarIcon(),
                      _buildStarIcon(),
                      _buildStarHalfIcon(),
                      // SizedBox(width: 4),
                      Text(
                        '4.7', // Replace with the actual rating
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Reduced Vertical Space
            SizedBox(height: 4),

            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pizza',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Text(
                    '\$34',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarIcon() {
    return Icon(
      Icons.star,
      color: Colors.orange,
      size: 16,
    );
  }

  Widget _buildStarHalfIcon() {
    return Icon(
      Icons.star_half,
      color: Colors.orange,
      size: 16,
    );
  }
}
