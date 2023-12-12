import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Restaurent_template extends StatelessWidget {
  const Restaurent_template({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 3,
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
                  'assets/eren.jpeg',
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
                  icon: Icon(Iconsax.like4, size: 30),
                  onPressed: () {
                    // Handle wishlist button tap
                  },
                ),
              ),
            ],
          ),
      SizedBox(height: 20,),
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

        ],
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
