import 'package:flutter/material.dart';
import 'package:spices_island_tea/const/colors.dart';
import 'package:spices_island_tea/screens/checkout_screen.dart';
import 'package:spices_island_tea/screens/feedbackScreen.dart';
import '../screens/profile_Screen.dart';
import '../screens/map_Screen.dart';
import '../screens/spices_Screen.dart';
import '../screens/tea_Screen.dart';



class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class UserDetails {
  String userName = '';
  String userEmail = '';
  String userAddress = '';
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  UserDetails userDetails = UserDetails();

  // Initialize _screens in the initState method
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _initializeScreens();
  }

  void _initializeScreens() {
    _screens = [
      TeaScreen(),
      SpicesScreen(),
      MapScreen(),
      ProfileScreen(
        userName: userDetails.userName,
        userEmail: userDetails.userEmail,
        userAddress: userDetails.userAddress,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                      Text(
                           "Spice Island Tea",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                      IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                       Navigator.pushNamed(context, CheckoutScreen.routeName);
                      },
                    ),
                       IconButton(
                      icon: Icon(Icons.feedback_outlined),
                     onPressed: () {
                       Navigator.pushNamed(context, FeedbackScreen.routeName);
                      },
                    ),
  ],
),
              ),
              SizedBox(
                height: 20,
              ),
              if (_screens.isNotEmpty) _screens[_currentIndex],
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: AppColor.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_food_beverage),
            label: 'Tea',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_nature),
            label: 'Spices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}



