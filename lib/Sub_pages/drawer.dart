import 'package:flutter/material.dart';
import 'package:flutter_salesman/pages/Orders.dart';

class drawer extends StatelessWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250.0,
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: ListTile.divideTiles(context: context, tiles: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white10],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(60),
                    bottomRight: const Radius.circular(60),
                  ),
                ),
                accountName: Text("Srijena"),
                currentAccountPicture: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                ),
                accountEmail: Text("Srijenanithish@gmail.com"),
              ),
            ),
            Card(
              color: Colors.white,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              borderOnForeground: true,
              elevation: 0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListTile(
                leading: Icon(Icons.check_box_outlined),
                title: const Text('Attendance'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              color: Colors.cyan.shade50,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              borderOnForeground: true,
              elevation: 0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListTile(
                leading: Icon(Icons.assignment_outlined),
                title: const Text('Beat Plan'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              color: Colors.white,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              borderOnForeground: true,
              elevation: 0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListTile(
                leading: Icon(Icons.money_off_csred_outlined),
                title: const Text('Collections'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              color: Colors.cyan.shade50,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              borderOnForeground: true,
              elevation: 0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListTile(
                leading: Icon(Icons.task_alt),
                title: const Text('Daily Plans'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              color: Colors.white,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              borderOnForeground: true,
              elevation: 0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListTile(
                leading: Icon(Icons.attach_money),
                title: const Text('Expense'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              color: Colors.cyan.shade50,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              borderOnForeground: true,
              elevation: 0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListTile(
                leading: Icon(Icons.assessment_outlined),
                title: const Text('EOD Report'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              color: Colors.white,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              borderOnForeground: true,
              elevation: 0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListTile(
                leading: Icon(Icons.notes_outlined),
                title: const Text('Keep Notes'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              color: Colors.cyan.shade50,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              borderOnForeground: true,
              elevation: 0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListTile(
                leading: Icon(Icons.shop_2_outlined),
                title: const Text('Orders'),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(Orders.routeName)
                      .then((result) {
                    print(result);
                  });
                },
              ),
            ),
            Card(
              color: Colors.white,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              borderOnForeground: true,
              elevation: 0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListTile(
                leading: Icon(Icons.playlist_add_check_sharp),
                title: const Text('Stocks'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              color: Colors.cyan.shade50,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              borderOnForeground: true,
              elevation: 0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: const Text('Visits'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
          ]).toList(),
        ));
  }
}
