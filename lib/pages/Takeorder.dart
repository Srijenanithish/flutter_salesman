import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_salesman/Sub_pages/matrix.dart';
import 'package:http/http.dart' as http;

class Takeorder extends StatefulWidget {
  static const String routeName = "/Takeorder";
  MyTakeorder createState() => MyTakeorder();
}

TextEditingController Quantity = TextEditingController();
var returnData = {};

class MyTakeorder extends State<Takeorder> {
  @override
  bool _hasBeenPressed = true;
  Widget build(BuildContext context) {
    List<String> PartyList = [];
    List<String> Location = [];

    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List items = routes['Items'];
    for (var i = 0; i < items.length; i++) {
      PartyList.add(items[i][0]['item_name']);
      Location.add(items[i][0]['price_rate']);
    }
    print(PartyList);
    print(returnData);
    // final routes =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // String Item_name = routes['Item_name'];
    String Rupees = routes['Rupees'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: Text('Take Order'),
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
              height: MediaQuery.of(context).size.height * 0.05,
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
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.all(10.0),
                              child: Table(
                                  defaultColumnWidth: FixedColumnWidth(10.0),
                                  border: TableBorder.all(
                                      width: 1.0, color: Colors.white),
                                  textDirection: TextDirection.ltr,
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  columnWidths: {
                                    0: FractionColumnWidth(.2),
                                    1: FractionColumnWidth(.001),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Container(
                                        height: 40.0,
                                        color: Colors.black12,
                                        padding: const EdgeInsets.all(10.5),
                                        child: Text('Item Name',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.pink),
                                            textAlign: TextAlign.center),
                                      ),
                                      TableCell(
                                          verticalAlignment:
                                              TableCellVerticalAlignment.fill,
                                          child: Container(
                                            alignment: Alignment.center,
                                            color: Colors.black12,
                                            child: Text('---->',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.pink),
                                                textAlign: TextAlign.center),
                                          )),
                                      TableCell(
                                          verticalAlignment:
                                              TableCellVerticalAlignment.fill,
                                          child: Container(
                                            alignment: Alignment.center,
                                            color: Colors.white,
                                            child: Text('Quantity',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.pink),
                                                textAlign: TextAlign.center),
                                          )),
                                    ])
                                  ])))),
                  Container(
                    child: Column(
                      children: [
                        //matrix(),
                        //get(PartyList),

                        get(PartyList),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Center(
                              child: Container(
                                width: 160,
                                child: RaisedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          _buildPopupDialog(context),
                                    );
                                    salesorder(returnData);
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
                                          maxWidth: 160.0, minHeight: 50.0),
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(24, 10, 10, 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Confirm Order',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
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

  Future salesorder(returnData) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('localhost:8000/api/method/salesman.api.sales_point_order'));
    request.body = ''' "args" : {$returnData }''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  get(PartyList) {
    List<Widget> fieldList = [];
    for (var i = 0; i < PartyList.length; i++) {
      fieldList.add(Gettable(PartyList[i]));
    }
    return Container(
      child: Column(
        children: fieldList,
      ),
    );
  }

  Gettable(PartyList) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10.0),
                child: Table(
                    defaultColumnWidth: FixedColumnWidth(10.0),
                    border: TableBorder.all(width: 1.0, color: Colors.white),
                    textDirection: TextDirection.ltr,
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {
                      0: FractionColumnWidth(.2),
                      1: FractionColumnWidth(.001),
                    },
                    children: [
                      TableRow(children: [
                        Container(
                          height: 40.0,
                          color: Colors.black12,
                          padding: const EdgeInsets.all(10.5),
                          child: Text(PartyList,
                              style: TextStyle(fontSize: 17),
                              textAlign: TextAlign.center),
                        ),
                        TableCell(
                            verticalAlignment: TableCellVerticalAlignment.fill,
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.black12,
                              child: Text('---->',
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center),
                            )),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: Center(
                                child: TextField(
                              onChanged: (String value) {
                                try {
                                  returnData[PartyList] = value;
                                } catch (e) {
                                  returnData[PartyList] = 0;
                                }
                                print(returnData);
                              },
                              style: TextStyle(color: Colors.pinkAccent),
                              cursorColor: Colors.pink,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            )),
                          ),
                        ),
                      ])
                    ]))));
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Confirm Your Order'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("By Clicking Yes"),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('No', style: TextStyle(fontSize: 18)),
      ),
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop(context);
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Yes', style: TextStyle(fontSize: 18)),
      ),
    ],
  );
}
