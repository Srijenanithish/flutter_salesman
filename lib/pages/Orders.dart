import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_salesman/pages/Orders1.dart';
import 'package:flutter_salesman/pages/Previousorders.dart';

class Orders extends StatefulWidget {
  static const String routeName = "/Orders";
  MyOrders createState() => MyOrders();
}

class MyOrders extends State<Orders> {
  late PageController _pageController;
  int _selectedPage = 0;

  List<Widget> pages = [Orders1(), Previousorders()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: PageView(
        onPageChanged: (index) => setState(() {
          _selectedPage = index;
        }),
        controller: _pageController,
        children: [...pages],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: FlashyTabBar(
          selectedIndex: _selectedPage,
          showElevation: false,
          onItemSelected: (index) => _onItemTapped(index),
          items: [
            FlashyTabBarItem(
              icon: Icon(
                Icons.shop_two,
                size: 23,
                color: Colors.cyan,
              ),
              title: Text(
                'Orders',
                style: TextStyle(color: Colors.cyan),
              ),
            ),
            FlashyTabBarItem(
              icon: Icon(
                Icons.outbond_rounded,
                size: 23,
                color: Colors.cyan,
              ),
              title: Text(
                'Previous Orders',
                style: TextStyle(color: Colors.cyan),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
