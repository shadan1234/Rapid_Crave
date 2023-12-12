import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/card_for_food.dart';
import '../helper/category_food_template.dart';
import '../helper/menu.dart';
import '../helper/restaurent_template.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  List<String> allItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  List<String> searchSuggestions = [];
  void updateSuggestions(String query) {
    // Perform a search based on the query
    print(query);
    searchSuggestions = allItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Update the UI to reflect the new suggestions

  }

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(

        children: [

          SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  elevation: MaterialStateProperty.resolveWith((states) => 2),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  controller: controller,
                  hintText: 'Search...',
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (String val) {
                    print(val);

                    setState(() {
                      updateSuggestions(val);
                    });

                  },
                  onSubmitted: (String val){
                    print(val);
                    controller.closeView(val);
                  },
                  leading: const Icon(Icons.search),
                  trailing: <Widget>[
                    Tooltip(
                      message: 'Change brightness mode',
                      child: IconButton(

                        onPressed: () {

                        },
                        icon: Icon(Icons.keyboard_voice),

                      ),
                    )
                  ],
                );
              }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(allItems.length, (int index) {             //TODO need to be searchsuggestion but not some error
              final String item = allItems[index];
              return ListTile(
                title: Text(item),
                onTap: () {

                },
              );
            });
          }),
      SizedBox(height: 8,),
          // SearchAnchor(  builder: (BuildContext context, SearchController controller) {  }, suggestionsBuilder: (BuildContext context, SearchController controller) {  },),
          buildSectionTitle('Featured Items'),
          Container(
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:[ Card_For_Food(),
            SizedBox(height: 20,),
            Card_For_Food(),
            SizedBox(height: 20,),
            Card_For_Food(),
            SizedBox(height: 20,),
            Card_For_Food(),
            SizedBox(height: 20,),
            Card_For_Food(),


          ],


          )),


          // Categories

          buildSectionTitle('Categories'),
          SizedBox(height: 10,),
          Container(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Category_template(),
                SizedBox(width: 10,),
                Category_template(),
                SizedBox(width: 10,),

                Category_template(),
                SizedBox(width: 10,),
                Category_template(),
                SizedBox(width: 10,),
                Category_template(),
                SizedBox(width: 10,),
                Category_template(),
                SizedBox(width: 10,),
                Category_template(),
                SizedBox(width: 10,),
                Category_template(),
                SizedBox(width: 10,),


              ],
            ),
          ),


          // Specials
          SizedBox(height: 20,),

          Text('Restaurents', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
      InkWell(
        onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Menu()));},
          child: Restaurent_template()),
          SizedBox(height: 8,),
          Restaurent_template(),
          SizedBox(height: 8,),
          Restaurent_template(),
          SizedBox(height: 8,),
          Restaurent_template(),
          SizedBox(height: 8,),

        ],
      ),
    );
  }
}

Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15,20,0,0),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildFeaturedItems() {
  // Implement your featured items UI here
  return Container(
    height: 150,
    // Add your UI components for featured items
  );
}

Widget buildCategories() {
  // Implement your categories UI here
  return Container(
    height: 100,
    // Add your UI components for categories
  );
}

Widget buildSpecials() {
  // Implement your specials UI here
  return Container(
    height: 200,
    // Add your UI components for specials
  );
}
// see nothing is suggesting to me like not a single ListTile appears