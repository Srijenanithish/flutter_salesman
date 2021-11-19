import 'package:flutter/material.dart';
import 'package:flutter_salesman/pages/Takeorder.dart';

class Orders1 extends StatefulWidget {
  static const String routeName = "/Orders1";
  MyOrders1 createState() => MyOrders1();
}

class MyOrders1 extends State<Orders1> {
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
    List<String> PartyList = [];
    List<String> Location = [];

    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List items = routes['Items'];
    for (var i = 0; i < items.length; i++) {
      PartyList.add(items[i][0]['item_name']);
      Location.add(items[i][0]['price_rate']);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: Text('Orders'),
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
                    hintText: 'Search Items',
                    contentPadding: EdgeInsets.all(20)),
                onChanged: (value) {
                  setState(() {
                    PartyListSearch = PartyList.where((element) =>
                            element.toLowerCase().contains(value.toLowerCase()))
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
                        Navigator.of(context).pushNamed(Takeorder.routeName,
                            arguments: {
                              'Item_name': PartyList[index],
                              'Rupees': Location[index]
                            }).then((result) {
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
                                    child: Icon(Icons.cases_rounded),
                                  ),
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
                                padding: EdgeInsets.fromLTRB(0, 0, 180, 0),
                                child: Text('Rupees : ' + Location[index],
                                    style: TextStyle(fontSize: 17)),
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
