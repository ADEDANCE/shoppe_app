import 'package:flutter/material.dart';
import 'package:shoppe/screens/common_widgets/product_card.dart';
import 'package:shoppe/screens/home/product_details.dart';
import 'package:shoppe/screens/mock_product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  String query = ""; //to Stores the current search text.
  List<Map<String, dynamic>> searchResults = [];
  final List<String> searchHistory = ["Shoes", "Bags", "Nike"];
  //List<String> searchHistory = [];

  final List<String> suggestions = ["Trending", "New arrivals", "Hoodies"];

  void performSearch(String value) {
    setState(() {
      query = value;
      // If history already has 4 items, remove the oldest
      if (searchHistory.length == 4) {
        searchHistory.removeAt(0);
      }

      // Add new search to the end (most recent)
      searchHistory.add(value);

      searchResults = products.where((product) {
        //Filters mock product list.
        final name = product["name"].toString().toLowerCase();
        final category = product["categoryId"].toString().toLowerCase();
        final input = value.toLowerCase();

        return name.contains(input) || category.contains(input);
      }).toList();
    });
  }

  Widget buildNoResult() {
    return const Center(
      child: Text("No matching product", style: TextStyle(fontSize: 18)),
    );
  }

  Widget buildSearchResults() {
    return Column(
      children: List.generate((searchResults.length / 2).ceil(), (rowIndex) {
        final firstIndex = rowIndex * 2;
        final secondIndex = firstIndex + 1;
        return Padding(
          padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // First card
              ProducrCard(
                width: 150,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductDetails(product: searchResults[firstIndex]),
                    ),
                  );
                },
                imagepath: searchResults[firstIndex]["image"].toString(),
                name: searchResults[firstIndex]["name"].toString(),
                price: "\$${searchResults[firstIndex]["price"]}",
              ),
              // Second card (check if exists)
              if (secondIndex < searchResults.length)
                ProducrCard(
                  width: 150,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ProductDetails(product: searchResults[secondIndex]),
                      ),
                    );
                  },
                  imagepath: searchResults[secondIndex]["image"].toString(),
                  name: searchResults[secondIndex]["name"].toString(),
                  price: "\$${searchResults[secondIndex]["price"]}",
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildHistoryAndSuggestions() {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent searches",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate((searchHistory.length / 2).ceil(), (
              rowIndex,
            ) {
              final firstIndex = rowIndex * 2;
              final secondIndex = firstIndex + 1;
              return Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    // First history item
                    Expanded(
                      child: ListTile(
                        leading: const Icon(Icons.history),
                        title: Text(searchHistory[firstIndex]),
                        onTap: () {
                          _controller.text = searchHistory[firstIndex];
                          performSearch(searchHistory[firstIndex]);
                        },
                      ),
                    ),

                    // Second history item (if exists)
                    if (secondIndex < searchHistory.length)
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Icons.history),
                          title: Text(searchHistory[secondIndex]),
                          onTap: () {
                            _controller.text = searchHistory[secondIndex];
                            performSearch(searchHistory[secondIndex]);
                          },
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),

          // ...searchHistory.map(
          //   (item) => ListTile(
          //     leading: const Icon(Icons.history),
          //     title: Text(item),
          //     onTap: () {
          //       _controller.text = item;
          //       performSearch(item);
          //     },
          //   ),
          // ),
          const SizedBox(height: 20),

          const Text(
            "Suggestions",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          ...suggestions.map(
            (item) => ListTile(
              leading: const Icon(Icons.trending_up),
              title: Text(item),
              onTap: () {
                _controller.text = item;
                performSearch(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(),
        title: TextField(
          autofocus: true,
          controller: _controller,
          onChanged: (value) {
            query = value;
          },
          onSubmitted: (value) {
            performSearch(value);
          },
          decoration: InputDecoration(
            hintText: "Search products",
            border: InputBorder.none,
          ),
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: query.isEmpty
              ? buildHistoryAndSuggestions()
              : searchResults.isEmpty
              ? buildNoResult()
              : buildSearchResults(),
        ),
      ),

      //  SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         const Text(
      //           "Recent searches",
      //           style: TextStyle(fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(height: 10),

      //         ...searchHistory.map(
      //           (item) =>
      //               ListTile(leading: Icon(Icons.history), title: Text(item)),
      //         ),

      //         const SizedBox(height: 20),

      //         const Text(
      //           "Suggestions",
      //           style: TextStyle(fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(height: 10),
      //         ...suggestions.map(
      //           (item) => ListTile(
      //             leading: const Icon(Icons.trending_up),
      //             title: Text(item),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
