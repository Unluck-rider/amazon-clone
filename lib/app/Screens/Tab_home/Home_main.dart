import 'package:flutter/material.dart';
import 'package:emptest/app/Screens/Pages/Cart_Page.dart';
import 'package:emptest/app/Screens/Pages/Home_Page.dart';
import 'package:emptest/app/Screens/Pages/Menu_page.dart';
import 'package:emptest/app/Screens/Pages/Profile_page.dart';

class HomePagemain extends StatefulWidget {
  const HomePagemain({Key? key}) : super(key: key);

  @override
  _HomePagemainState createState() => _HomePagemainState();
}

class _HomePagemainState extends State<HomePagemain> {
  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const ProfilePage(),
    const CartPage(),
    const MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth / 4; // Divide screen into 4 equal parts

    return Scaffold(
      body: pages[pageIndex], // Display the selected page
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BottomNavigationBar(
            currentIndex: pageIndex,
            onTap: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrangeAccent, // Active icon color
            unselectedItemColor: Colors.black54, // Inactive icon color
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200), // Smooth animation
            curve: Curves.easeInOut,
            bottom: 5, // Adjust indicator position
            left: (itemWidth * pageIndex) + (itemWidth / 2) - 20, // Center the indicator under the icon
            child: Container(
              width: 40, // Indicator width
              height: 4, // Small tab line height
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent, // Indicator color
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
