import 'package:flutter/material.dart';
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

  final List<String> suggestions = ["Trending", "New arrivals", "Hoodies"];

  void performSearch(String value) {
    setState(() {
      query = value;

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
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final product = searchResults[index];

        return ListTile(
          leading: Image.asset(product["image"], width: 50),
          title: Text(product["name"]),
          subtitle: Text("\$${product["price"]}"),
        );
      },
    );
  }

  Widget buildHistoryAndSuggestions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent searches",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        ...searchHistory.map(
          (item) => ListTile(
            leading: const Icon(Icons.history),
            title: Text(item),
            onTap: () {
              _controller.text = item;
              performSearch(item);
            },
          ),
        ),

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
    );
  }

  @override
  Widget build(BuildContext context) {
    // final searchHistory = ["Shoes", "Bags"];
    // final suggestions = ["Trending", "New arrivals", "Best sellers"];

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: TextField(
          autofocus: true,
          controller: _controller,
          onChanged: performSearch,
          decoration: InputDecoration(
            hintText: "Search products",
            border: InputBorder.none,
          ),
        ),
      ),
      body: query.isEmpty
          ? buildHistoryAndSuggestions()
          : searchResults.isEmpty
          ? buildNoResult()
          : buildSearchResults(),
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
