import 'package:flutter/material.dart';
import 'package:flutter_salesman/pages/HomePage.dart';
import 'package:flutter_salesman/pages/Party1.dart';

class Territory1 extends StatefulWidget {
  static const String routeName = "/Territory1";
  MyTerritory1 createState() => MyTerritory1();
}

class MyTerritory1 extends State<Territory1> {
  List<String> Partystatus = [
    'Order Taken',
    'Missing',
    'Order Taken',
    'Missing',
    'Missing',
    'Order Taken',
    'Missing'
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
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();

  get prefixIcon => null;

  void dispose() {
    _textFocusNode.dispose();
    _textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    //print(routes['Store_details']);
    List l = routes['Store_details'];
    print(l[0]);
    //Pist = routes['Store_details'];
    List<String> PartyList = [];
    for (var i = 0; i < l.length; i++) {
      PartyList.add(l[i]['customer_name']);
    }
    List<String> Location = [];
    for (var i = 0; i < l.length; i++) {
      Location.add(l[i]['territory']);
    }

    // List<String> PartyList = [
    //   'xyz garments',
    //   'silver electronics',
    //   'abc garments',
    //   'jp paradise',
    //   'hr stores',
    //   'gee digitals',
    //   'p party'
    // ];
    //print(routes['Store_details'][0]);
    // print(Pist);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: Text('Territory 1'),
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
              Navigator.of(context).pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
                decoration: InputDecoration(
                    prefixIcon: prefixIcon ?? Icon(Icons.search),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Search Parties',
                    contentPadding: EdgeInsets.all(20)),
                onChanged: (value) {
                  setState(() {
                    PartyListSearch = PartyList.where(
                            (element) => element.contains(value.toLowerCase()))
                        .toList();
                    if (PartyList.isNotEmpty && PartyListSearch?.length == 0) {
                      print('Partylist length ${PartyListSearch?.length}');
                    }
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _textEditingController!.text.isNotEmpty
                      ? PartyListSearch!.length
                      : PartyList.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(Party1.routeName)
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
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                      child: Icon(Icons.business_outlined)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    _textEditingController!.text.isNotEmpty
                                        ? PartyListSearch![index]
                                        : PartyList[index],
                                    style: TextStyle(fontSize: 19),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 150, 0),
                                child: Text(
                                  Location[index],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 210, 0),
                                child: Text(
                                  Partystatus[index],
                                  style: TextStyle(
                                      color: Partystatus[index] == 'Missing'
                                          ? Colors.red
                                          : Colors.green),
                                ),
                              ),
                            ],
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
