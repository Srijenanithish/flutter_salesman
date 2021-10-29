import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_salesman/main.dart';

import 'package:swipebuttonflutter/swipebuttonflutter.dart';
import 'drawer.dart';

class runrate extends StatelessWidget {
  const runrate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Current Run rate"),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: CircularPercentIndicator(
                      radius: 70,
                      lineWidth: 8,
                      backgroundColor: Colors.black54,
                      percent: 0.4,
                      progressColor: Colors.amber,
                      circularStrokeCap: CircularStrokeCap.round,
                      animation: true,
                      center: Text(
                        "40%",
                        style: TextStyle(
                            color: Colors.amber.shade900, fontSize: 20),
                      )),
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Required Run rate"),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: CircularPercentIndicator(
                      radius: 70,
                      lineWidth: 8,
                      backgroundColor: Colors.black54,
                      percent: 0.6,
                      progressColor: Colors.amber,
                      circularStrokeCap: CircularStrokeCap.round,
                      animation: true,
                      center: Text(
                        "60%",
                        style: TextStyle(
                            color: Colors.amber.shade900, fontSize: 20),
                      )),
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Target"),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: CircularPercentIndicator(
                      radius: 70,
                      lineWidth: 8,
                      backgroundColor: Colors.black54,
                      percent: 0.95,
                      progressColor: Colors.amber,
                      circularStrokeCap: CircularStrokeCap.round,
                      animation: true,
                      center: Text(
                        "100%",
                        style: TextStyle(
                            color: Colors.amber.shade900, fontSize: 20),
                      )),
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
