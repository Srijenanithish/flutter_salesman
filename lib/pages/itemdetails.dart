import 'package:flutter/material.dart';
import 'package:flutter_salesman/pages/Orders.dart';
import 'package:flutter_salesman/pages/Orders1.dart';

class itemdetails extends StatefulWidget {
  static const String routeName = "/itemdetails";
  myitemdetails createState() => myitemdetails();
}

class myitemdetails extends State<itemdetails> {
  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List lis = routes['name'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: Text('Item Details'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.cyanAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.cyan, Colors.cyanAccent],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Card(
                            elevation: 40,
                            margin: EdgeInsets.all(25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  Container(
                                      width: 200,
                                      height: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 0, 0, 0),
                                        child: Text(lis[0]['salespoint_name'],
                                            style: TextStyle(fontSize: 22)),
                                      )),
                                  Row(
                                    children: [
                                      Text("Item Name : ",
                                          style: TextStyle(fontSize: 19)),
                                      Text(lis[0]['salespoint_name'],
                                          style: TextStyle(fontSize: 19))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text("Item Number : ",
                                          style: TextStyle(fontSize: 19)),
                                      Text(lis[0]['name'],
                                          style: TextStyle(fontSize: 19))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text("Ordered Date : ",
                                          style: TextStyle(fontSize: 19)),
                                      Text(lis[0]['date'],
                                          style: TextStyle(fontSize: 19))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text("Payment Due Date : ",
                                          style: TextStyle(fontSize: 19)),
                                      Text(lis[0]['payment_due_date'],
                                          style: TextStyle(fontSize: 19))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text("Total Amount : ",
                                          style: TextStyle(fontSize: 19)),
                                      Text("\₹" + lis[0]['total'].toString(),
                                          style: TextStyle(fontSize: 19))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text("Outstanding : ",
                                          style: TextStyle(fontSize: 19)),
                                      Text(
                                          "\₹" +
                                              lis[0]['outstanding'].toString(),
                                          style: TextStyle(fontSize: 19))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
