import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  List<String> allItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  List<String> searchSuggestions = [];
  late TextEditingController searchController;
  void updateSuggestions(String query) {
    // Perform a search based on the query
    print(query);
    setState(() {
      searchSuggestions = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  void showSuggestions(BuildContext context) {
    if (searchSuggestions.isNotEmpty) {
      showMenu(
        context: context,
        position: RelativeRect.fromLTRB(0, 0, 0, 0),
        items: searchSuggestions.map((suggestion) {
          return PopupMenuItem<String>(
            value: suggestion,
            child: Text(suggestion),
          );
        }).toList(),
      ).then((selectedSuggestion) {
        if (selectedSuggestion != null) {
          setState(() {
            searchController.text = selectedSuggestion;
          });
        }
      });
    }
  }
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }
  void clearSearch() {
    setState(() {
      searchController.clear();
      searchSuggestions.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          TextFormField(
            controller: searchController,
            onChanged: (val) {
              updateSuggestions(val);
            },
            onTap: () {
              // Show suggestions when the text field is tapped
              showSuggestions(context);
            },
            decoration: InputDecoration(
              hintText: 'Search...',
              contentPadding: EdgeInsets.all(12.0),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear, color: Colors.grey),
                onPressed: clearSearch,
              ),
            ),
          ),


          // SearchAnchor(  builder: (BuildContext context, SearchController controller) {  }, suggestionsBuilder: (BuildContext context, SearchController controller) {  },),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Featured Items
              buildSectionTitle('Featured Items'),
              buildFeaturedItems(),

              // Categories
              buildSectionTitle('Categories'),
              buildCategories(),

              // Specials
              buildSectionTitle('Specials'),
              buildSpecials(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
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
