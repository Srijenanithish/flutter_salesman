import 'dart:convert';
import 'dart:io'; //InternetAddress utility
import 'dart:async'; //For StreamController/Stream
import 'LoginForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_salesman/Sub_pages/runrate.dart';
import 'package:flutter_salesman/pages/LoginForm.dart';
import 'package:flutter_salesman/pages/Territory.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_salesman/main.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';
import '../Sub_pages/drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 7),
        () => Container(
            color: Colors.white,
            child: Image.asset("assets/login/screen.gif")));
  }

  //For GPS
  Position _currentPosition = Position();
  String _currentAddress = '';
  String Address = '';

  Map Mapresponse = {};
  Map dataResponse = {};
  Map Mapresponse_ = {};
  Map dataResponse_ = {};
  //For button color change
  bool _hasBeenPressed = true;
  bool hasBeenPressed = true;
  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String Api_key = routes['Api_key'];
    String Api_Secret = routes['Api_secret'];
    String Username = routes['Username'];

    var child;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Salesman App",
        ),
        //backgroundColor: Colors.transparent,
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
        child: Stack(children: <Widget>[
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
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
                  child: runrate(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 280, 0, 0),
                  child: Center(
                    child: Container(
                      width: 120,
                      child: RaisedButton(
                        onPressed: () async {
                          Position position = await _getGeoLocationPosition();
                          await _getCurrentLocation();
                          await GetAddressFromLatLong(position);
                          await fetchLocation(_currentPosition.latitude,
                              _currentPosition.longitude, Username);
                          _hasBeenPressed
                              ? showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildPopupDialog(context),
                                )
                              : showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _build_Popup_Dialog(context),
                                );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        textColor: Colors.white,
                        child: Ink(
                          decoration: _hasBeenPressed
                              ? BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFF9520),
                                      Color(0xFFFF6F00)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0))
                              : BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlue,
                                      Colors.lightGreen
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 120.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: _hasBeenPressed
                                ? Text(
                                    "Check In",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )
                                : Text(
                                    "Checked In",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 280, 0, 0),
                  child: Center(
                    child: Container(
                      width: 120,
                      child: RaisedButton(
                        onPressed: () async {
                          await fetchparty(Api_key, Api_Secret, Username);
                          setState(() {
                            hasBeenPressed = false;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        textColor: Colors.white,
                        child: Ink(
                          decoration: hasBeenPressed
                              ? BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFF9520),
                                      Color(0xFFFF6F00)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0))
                              : BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlue,
                                      Colors.lightGreen
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 120.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: hasBeenPressed
                                ? Text(
                                    "Get Territory",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )
                                : Text(
                                    "Get Territory",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 350, 0, 0),
                child: Center(
                  child: Container(
                      width: 300,
                      child: _hasBeenPressed ? getForm() : getForm()),
                ),
              ),

              //if (_currentAddress != null) Text(_currentAddress),
              if (Address != null) Text(Address),
              if (_currentPosition != 'Hello')
                Text(
                    "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
            ],
          ),
        ]),
      ),
      drawer: drawer(),
    );
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  //Function for Geolocation latitude and longitude
  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  //Function for Geolocation address
  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];
    setState(() {
      Address =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    });
  }

  fetchparty(x, y, z) async {
    var headers = {
      'Authorization': 'token ' + x + ':' + y,
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            'http://test-sfa.aerele.in/api/method/salesman.api.store_info'));
    request.body = json.encode({"username": z});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("Got Territories");

      var res = await response.stream.bytesToString();
      Mapresponse = await json.decode(res);
      print(Mapresponse);
    } else {
      print(response.reasonPhrase);
    }
  }

  fetchLocation(lat, lon, user) async {
    var headers = {'Content-Type': 'application/json', 'Cookie': 'sid=Guest'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://test-sfa.aerele.in/api/method/salesman.api.check_in?lat=11.116612727201764&lon=77.37256945162726'));
    request.body = json.encode({"lat": lat, "lon": lon, "username": user});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var Respon = await response.stream.bytesToString();
      Mapresponse_ = await json.decode(Respon);
    } else {
      print(response.reasonPhrase);
    }
  }

  getForm() {
    if (Mapresponse['territory_name'] == null) {
      return Container(
          child: Image.asset("assets/login/Safe_Ride.png",
              height: 250, width: 250));
    } else {
      List dataSet = Mapresponse['territory_name'];
      List storeset = Mapresponse['store_details'];

      List<Widget> fieldList = [];
      for (var i = 0; i < dataSet.length; i++) {
        fieldList.add(getButton(dataSet[i], storeset[i]));
      }

      return Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
                color: Colors.blueGrey.shade100, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          children: fieldList,
        ),
      );
    }
  }
  // fieldMapper(data) {
  //   String type = data['Territory_name'].toString();
  //   if (type == 'Dat || type == 'Float') {
  //     return getButton();
  //   }
  // }

  Widget getButton(name, list0) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Territory.routeName, arguments: {
            "Store_details": list0,
            "Territory_Name": name,
            "lat": _currentPosition.latitude,
            "lon": _currentPosition.longitude
          }).then((result) {
            print(result);
          });
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.cyan.shade100],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 10, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.streetview_outlined,
                    color: Colors.black54,
                  ),
                  Text(
                    name,
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
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: Center(child: const Text('Confirm to give an Attendance')),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: EdgeInsets.only(top: 10.0),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child: Text("By Clicking Yes")),
        ],
      ),
      actions: <Widget>[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 8, 0),
              child: Center(
                child: new FlatButton(
                  color: Colors.cyan.shade50,
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = false;
                    });
                    Navigator.of(context).pop(context);
                  },
                  textColor: Theme.of(context).primaryColor,
                  child: const Text('Yes', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: new FlatButton(
                  color: Colors.cyan.shade50,
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = true;
                    });
                    Navigator.of(context).pop();
                  },
                  textColor: Theme.of(context).primaryColor,
                  child: const Text('No', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _build_Popup_Dialog(BuildContext context) {
    return new AlertDialog(
      title: Center(child: const Text('You have Already Checked In')),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: EdgeInsets.only(top: 10.0),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      actions: <Widget>[
        Center(
          child: new FlatButton(
            color: Colors.cyan.shade50,
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Okay', style: TextStyle(fontSize: 18)),
          ),
        ),
      ],
    );
  }
}
