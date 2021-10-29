import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class matrix extends StatelessWidget {
  const matrix({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10.0),
              child: Table(
                defaultColumnWidth: FixedColumnWidth(10.0),
                border: TableBorder.all(width: 1.0, color: Colors.white54),
                textDirection: TextDirection.ltr,
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: {0: FractionColumnWidth(.2)},
                children: [
                  TableRow(children: [
                    Container(
                      height: 40.0,
                      color: Colors.white,
                    ),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text('Pack',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text('32B',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text('32C',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text('34B',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text('34C',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text('34D',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text('36B',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text('37B',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        ))
                  ]),
                  TableRow(children: [
                    Container(
                      height: 40.0,
                      color: Colors.black12,
                      padding: const EdgeInsets.all(14.5),
                      child: Text('1250-0105-BLACK',
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center),
                    ),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Text('1',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                  ]),
                  TableRow(children: [
                    Container(
                      height: 40.0,
                      color: Colors.white,
                      padding: const EdgeInsets.all(14.5),
                      child: Text('100-800-BLPNK',
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center),
                    ),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text('1',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                  ]),
                  TableRow(children: [
                    Container(
                      height: 40.0,
                      color: Colors.black12,
                      padding: const EdgeInsets.all(14.5),
                      child: Text('120-305-BLUE',
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center),
                    ),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Text('1',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                  ]),
                  TableRow(children: [
                    Container(
                      height: 40.0,
                      color: Colors.white,
                      padding: const EdgeInsets.all(14.5),
                      child: Text('180-1080-WHITE',
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center),
                    ),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text('1',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                  ]),
                  TableRow(children: [
                    Container(
                      height: 40.0,
                      color: Colors.black12,
                      padding: const EdgeInsets.all(14.5),
                      child: Text('1250-0105-CANPI',
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center),
                    ),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Text('1',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                  ]),
                  TableRow(children: [
                    Container(
                      height: 40.0,
                      color: Colors.white,
                      padding: const EdgeInsets.all(14.5),
                      child: Text('1250-0105-PARED',
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center),
                    ),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text('1',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                  ]),
                  TableRow(children: [
                    Container(
                      height: 40.0,
                      color: Colors.black12,
                      padding: const EdgeInsets.all(14.5),
                      child: Text('1250-0105-CANPI',
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center),
                    ),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black12,
                          child: Text('1',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.fill,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Center(
                              child: TextField(
                            style: TextStyle(color: Colors.pinkAccent),
                            cursorColor: Colors.pink,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          )),
                        )),
                  ]),
                ],
              ),
            ),
          )),
    ));
  }
}
