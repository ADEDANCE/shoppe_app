import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/screens/common_widgets/product_card.dart';
import 'package:shoppe/screens/user_side/home/product_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  String searchText = ""; //to Stores the current search text.
  List<Map<String, dynamic>> searchResults = [];
  List<String> searchHistory = [];
  bool issearch = false;
  final String historyKey = "search_history"; // storage key

  final List<String> suggestions = ["Trending", "New arrivals", "Hoodies"];

  Future<void> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      searchHistory = prefs.getStringList(historyKey) ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  Future<void> saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(historyKey, searchHistory);
  }

  Stream<QuerySnapshot> searchStream() {
    if (searchText.isEmpty) {
      return FirebaseFirestore.instance.collection("products").snapshots();
    }

    return FirebaseFirestore.instance
        .collection("products")
        .where("keywords", arrayContains: searchText)
        .snapshots();
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      searchHistory.clear();
    });

    await prefs.remove(historyKey);
  }

  Widget searchResult() {
    return StreamBuilder<QuerySnapshot>(
      stream: searchStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;

        if (docs.isEmpty) {
          return Center(child: Text("No results found"));
        }
        return Column(
          children: List.generate((docs.length / 2).ceil(), (rowIndex) {
            final firstIndex = rowIndex * 2;
            final secondIndex = firstIndex + 1;

            final firstData = docs[firstIndex].data() as Map<String, dynamic>;

            Map<String, dynamic>? secondData;
            if (secondIndex < docs.length) {
              secondData = docs[secondIndex].data() as Map<String, dynamic>;
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProducrCard(
                    width: 150,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProductDetails(productId: docs[firstIndex].id),
                        ),
                      );
                    },
                    imagepath: firstData["image"].toString(),
                    name: firstData["name"].toString(),
                    price: "\$${firstData["price"]}",
                  ),

                  if (secondData != null)
                    ProducrCard(
                      width: 150.w,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetails(productId: docs[firstIndex].id),
                          ),
                        );
                      },
                      imagepath: secondData["image"].toString(),
                      name: secondData["name"].toString(),
                      price: "\$${secondData["price"]}",
                    ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  Widget buildHistoryAndSuggestions() {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recent searches",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: clearHistory,
                child: const Text("Clear all"),
              ),
            ],
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
                          searchStream();
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
                            searchStream();
                          },
                        ),
                      ),
                  ],
                ),
              );
            }),
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
                setState(() {});
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
          onSubmitted: (value) {
            issearch = true;
            final text = value.trim().toLowerCase();

            if (text.isEmpty) return;

            setState(() {
              searchText = text;

              // remove duplicate
              searchHistory.remove(text);

              // add newest
              searchHistory.add(text);

              // keep only last 6
              if (searchHistory.length > 6) {
                searchHistory.removeAt(0);
              }
            });

            saveHistory();
          },

          decoration: InputDecoration(
            hintText: "Search products",
            border: InputBorder.none,
          ),
        ),
      ),
      body: Column(
        children: [issearch ? searchResult() : buildHistoryAndSuggestions()],
      ),
    );
  }
}
