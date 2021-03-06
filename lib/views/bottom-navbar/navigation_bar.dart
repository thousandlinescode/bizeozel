import 'package:bizeozel/core/components/colors/colors.dart';
import 'package:bizeozel/views/ActivityPages/view/activity_dashboard.dart';
import 'package:bizeozel/views/Dashboard/view/main_dashboard.dart';
import 'package:bizeozel/views/ProfilePages/view/user_profile.dart';
import 'package:bizeozel/views/PublicEducationPages/view/Location.dart';
import 'package:bizeozel/views/WorkOffersPages/view/work_offers_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'nav_bar_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  TabController tabController;

  @override
  void initState() {
    _pageController.addListener(() {
      var currentIndex = _pageController.page.round();
      if (currentIndex != bottomNavBarSelectedIndex) {
        bottomNavBarSelectedIndex = currentIndex;
      }
      setState(() {});
    });
    super.initState();
  }

  void handleIndexChanged(int value) {
    if (value != bottomNavBarSelectedIndex) {
      setState(() {
        bottomNavBarSelectedIndex = value;
      });
    }
  }

  final List<Widget> _widgetOptions = <Widget>[
    MainDashboard(),
    AcitivityDashboard(),
    Location(),
    WorkOffersDashboard(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: bottomNavBarSelectedIndex,
        onTap: handleIndexChanged,
        items: [
          /// Main Dashboard
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Dashboard'),
            selectedColor: ColorPallette.color4,
          ),

          /// Activity Dashboard
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.solidHeart,
              size: 20,
            ),
            title: Text('Events'),
            selectedColor: Colors.red,
          ),

          /// Halk Eğitim
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.school, size: 20),
            title: Text('Courses'),
            selectedColor: Colors.orange,
          ),

          /// Work Offers
          SalomonBottomBarItem(
            icon: Icon(Icons.work),
            title: Text('Work Offers'),
            selectedColor: Colors.teal,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            selectedColor: Colors.blueAccent,
          ),
        ],
      ),
      body: _widgetOptions.elementAt(bottomNavBarSelectedIndex),
    );
  }
}
