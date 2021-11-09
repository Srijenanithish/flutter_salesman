import 'dart:io'; //InternetAddress utility
import 'dart:async'; //For StreamController/Stream

import 'package:flutter/material.dart';
import 'package:flutter_salesman/Sub_pages/runrate.dart';
import 'package:flutter_salesman/pages/LoginForm.dart';
import 'package:flutter_salesman/pages/Territory1.dart';
import 'package:flutter_salesman/pages/Territory2.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_salesman/main.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';
import '../Sub_pages/drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  MyHomePage createState() => MyHomePage();
}

class MyHomePage extends State<HomePage> {
  //For GPS
  Position _currentPosition = Position();
  String _currentAddress = '';
  String Address = '';

  //For button color change
  bool _hasBeenPressed = true;
  @override
  Widget build(BuildContext context) {
    var child;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Salesman App"),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 280, 0, 0),
            child: Center(
              child: Container(
                width: 120,
                child: RaisedButton(
                  onPressed: () async {
                    Position position = await _getGeoLocationPosition();

                    _getCurrentLocation();
                    GetAddressFromLatLong(position);
                    setState(() {
                      _hasBeenPressed = false;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  textColor: Colors.white,
                  child: Ink(
                    decoration: _hasBeenPressed
                        ? BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFFF9520), Color(0xFFFF6F00)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0))
                        : BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.lightBlue, Colors.lightGreen],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 120.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: _hasBeenPressed
                          ? Text(
                              "Check In",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 400, 0, 0),
                child: Center(
                  child: Container(
                    width: 300,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(Territory1.routeName)
                            .then((result) {
                          print(result);
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
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
                          constraints:
                              BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
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
                                  'Territory 1',
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Center(
                  child: Container(
                    width: 300,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(Territory2.routeName)
                            .then((result) {
                          print(result);
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
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
                          constraints:
                              BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
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
                                  'Territory 2',
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
    //print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      Address =
          '${place.thoroughfare},${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    });
  }
}
