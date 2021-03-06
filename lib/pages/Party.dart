import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_salesman/pages/Orders.dart';
import 'package:flutter_salesman/pages/Orders1.dart';
import 'package:flutter_salesman/pages/Previousorders.dart';
import 'package:flutter_salesman/pages/Takeorder.dart';
import 'package:flutter_salesman/pages/Territory.dart';
import 'package:http/http.dart' as http;

class Party extends StatefulWidget {
  static const String routeName = "/Party";
  myParty createState() => myParty();
}

class myParty extends State<Party> {
  Map Mapresponse = {};
  Map Mapresponse_ = {};

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List lis = routes['Store_detail'];
    String terr = routes['Territory_Name-'];
    double lat = routes['lat'];
    double lon = routes['lon'];
    List Itemset = routes['Itemset'];
    List Territory_details = routes['Territory_details'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: terr == null
            ? SingleChildScrollView(child: Text('Party - on - Territory 1'))
            : SingleChildScrollView(
                child: Text(lis[0]['company_name'] + ' - on - ' + terr)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.cyanAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notes_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop('/home');
            },
          )
        ],
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
              padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
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
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Container(
                                      width: 200,
                                      height: 120,
                                      child: Image.asset(
                                          "assets/login/login2.png")),
                                  Row(
                                    children: [
                                      Text("Party Name : ",
                                          style: TextStyle(fontSize: 19)),
                                      Text(lis[0]['company_name'],
                                          style: TextStyle(fontSize: 19))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text("Party Holder : ",
                                          style: TextStyle(fontSize: 19)),
                                      Text(lis[0]['customer_name'],
                                          style: TextStyle(fontSize: 19))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Text("Address : ",
                                            style: TextStyle(fontSize: 19)),
                                        Text(lis[0]['primary_address'],
                                            style: TextStyle(fontSize: 19))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text("Mobile No : ",
                                          style: TextStyle(fontSize: 19)),
                                      Text(lis[0]['mobile_no'],
                                          style: TextStyle(fontSize: 19))
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Center(
                              child: Container(
                                width: 300,
                                child: RaisedButton(
                                  onPressed: () {
                                    fetchLocation(lat, lon);
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (BuildContext context) =>
                                    //       _buildPopupDialog(context),
                                    // );
                                    Navigator.of(context).pushNamed(
                                        Takeorder.routeName,
                                        arguments: {
                                          "Items": Itemset,
                                          "Customer_name": lis[0]
                                              ['customer_name'],
                                        }).then((result) {
                                      print(result);
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(80.0)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            Colors.cyanAccent
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 300.0, minHeight: 50.0),
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 10, 10, 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.assignment_ind_outlined,
                                              color: Colors.black54,
                                            ),
                                            Text(
                                              'Take Order',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.pink,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: Center(
                              child: Container(
                                width: 300,
                                child: RaisedButton(
                                  onPressed: () {
                                    fetchPreviousOrders(Territory_details);
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (BuildContext context) =>
                                    //       _buildPopupDialog(context),
                                    // );
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(80.0)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            Colors.cyanAccent
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 300.0, minHeight: 50.0),
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 10, 10, 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.assignment_ind_outlined,
                                              color: Colors.black54,
                                            ),
                                            Text(
                                              'Previous Orders',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.pink,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
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

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Please Check You are in the range or not'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("If not it will be notified to your distributor"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close', style: TextStyle(fontSize: 18)),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Orders.routeName).then((result) {
              print(result);
            });
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Okay', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }

  fetchPreviousOrders(Territory_details) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://test-sfa.aerele.in/api/method/salesman.api.previous_sales_point_invoice'));
    request.body = json.encode({"territory": Territory_details});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Mapresponse_ = await json.decode(res);

      Navigator.of(context).pushNamed(Previousorders.routeName, arguments: {
        "Territory_details": Mapresponse_['message'],
      }).then((result) {
        print(result);
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  fetchLocation(lat, lon) async {
    var headers = {'Content-Type': 'application/json', 'Cookie': 'sid=Guest'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://test-sfa.aerele.in/api/method/salesman.api.check_in?lat=11.116612727201764&lon=77.37256945162726'));
    request.body = json.encode({"lat": lat, "lon": lon});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    } else {
      print(response.reasonPhrase);
    }
  }
}
