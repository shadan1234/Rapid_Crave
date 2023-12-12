

import 'package:flutter/cupertino.dart';

Map<String,ClipRRect>foodToPhotoMapping={
  'Pizza':   ClipRRect(
    child: Image.asset(
      'assets/pizza.jpeg',
      height: 50,
      width: 50,
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  'Burger':   ClipRRect(
    child: Image.asset(
      'assets/burger.jpeg',
      height: 50,
      width: 50,
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  'Chicken':   ClipRRect(
    child: Image.asset(
      'assets/chicken.jpg',
      height: 50,
      width: 50,
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  'Wine':   ClipRRect(
    child: Image.asset(
      'assets/wine.jpeg',
      height: 50,
      width: 50,
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
};