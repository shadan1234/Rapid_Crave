import 'package:flutter/cupertino.dart';

class Category_template extends StatelessWidget {
  const Category_template({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(


      child:Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all( Radius.circular(15.0)),
            child: Image.asset(
              'assets/pizza.jpeg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),

          Text('Pizza'),
        ],
      )
    );
  }
}
