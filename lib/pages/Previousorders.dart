import 'package:flutter/material.dart';
import 'package:flutter_salesman/pages/itemdetails.dart';

class Previousorders extends StatefulWidget {
  static const String routeName = "/Previousorders";
  MyPreviousorders createState() => MyPreviousorders();
}

class MyPreviousorders extends State<Previousorders> {
  List<String> PartyList = [
    '2m Cloth',
    'velvet pant',
    'green sweater',
    'jacket',
    'woolen coat',
    'new Kurthis',
    'jaipur materials'
  ];

  List<String> Location = [
    'Palayakad',
    'VNR Street',
    'Dharapuram',
    'Udumalpet',
    'Palladam',
    'Kurichi',
    'Pollachi'
  ];
  List<String>? PartyListSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: Text('Previous Orders'),
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
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: PartyList.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(itemdetails.routeName)
                            .then((result) {
                          print(result);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.cyan.shade50,
                                Colors.cyan.shade50
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(Icons.cases_rounded),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      PartyList[index],
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.done_all,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 150, 0),
                                  child: Text(
                                    Location[index],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
