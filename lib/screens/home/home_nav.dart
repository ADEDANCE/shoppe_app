import 'package:flutter/material.dart';
import 'package:shoppe/screens/home/cart_screen.dart';
import 'package:shoppe/screens/home/home_screen.dart';
import 'package:shoppe/screens/home/profile_screen.dart';
import 'package:shoppe/screens/home/wishlist_screen.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.home),
                _currentIndex == 0
                    ? Container(width: 20, height: 2, color: Colors.blue)
                    : SizedBox.shrink(),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.favorite_outline),
                _currentIndex == 1
                    ? Container(width: 20, height: 2, color: Colors.blue)
                    : SizedBox.shrink(),
              ],
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.shopping_cart),
                _currentIndex == 2
                    ? Container(width: 20, height: 2, color: Colors.blue)
                    : SizedBox.shrink(),
              ],
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.person),
                _currentIndex == 3
                    ? Container(width: 20, height: 2, color: Colors.blue)
                    : SizedBox.shrink(),
              ],
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
