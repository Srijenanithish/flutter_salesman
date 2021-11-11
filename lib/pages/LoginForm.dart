//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_salesman/utils/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'HomePage.dart';
import 'dart:async';

import 'dart:convert';

enum ErrorAnimationProp { offset }

//https://flutter.dev/docs/cookbook/navigation/passing-data
class LoginForm extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _LoginFormValidationState createState() => _LoginFormValidationState();
}

class _LoginFormValidationState extends State<LoginForm> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  get prefixIcon => null;

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 4) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  var controller = TextEditingController();
  String stringResponse = '0';
  Map Mapresponse = {};
  Map dataResponse = {};

  // @override
  // void initState() {
  //   super.initState();
  //   fetchdata(username, password);
  // }
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // By defaut, Scaffold background is white
        // Set its value to transparent
        backgroundColor: Color(0xfff2f3f7),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: SingleChildScrollView(
                      child: Card(
                        elevation: 20,
                        margin: EdgeInsets.fromLTRB(25, 160, 25, 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Form(
                          autovalidate: true,
                          key: formkey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 1.0),
                                child: Center(
                                  child: Container(
                                      width: 200,
                                      height: 150,
                                      child: Image.asset(
                                          "assets/login/login2.png")),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                    controller: username,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            prefixIcon ?? Icon(Icons.person),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        filled: true,
                                        contentPadding: EdgeInsets.all(16),
                                        isDense: true,
                                        fillColor: Colors.black12,
                                        labelText: 'Username',
                                        hintText: 'Enter your Username'),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "* Required"),
                                      MinLengthValidator(4,
                                          errorText:
                                              "Username should be atleast 6 characters"),
                                    ])),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    top: 15,
                                    bottom: 0),
                                child: TextFormField(
                                    controller: password,
                                    // obscureText: true,
                                    obscureText: !_passwordVisible,
                                    decoration: InputDecoration(
                                        prefixIcon: prefixIcon ??
                                            Icon(Icons.password_sharp),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _passwordVisible =
                                                  !_passwordVisible;
                                            });
                                          },
                                          child: Icon(_passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                        ),
                                        filled: true,
                                        contentPadding: EdgeInsets.all(16),
                                        fillColor: Colors.black12,
                                        labelText: 'Password',
                                        hintText: 'Enter secure password'),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "* Required"),
                                      MinLengthValidator(4,
                                          errorText:
                                              "Password should be atleast 6 characters"),
                                      MaxLengthValidator(15,
                                          errorText:
                                              "Password should not be greater than 15 characters")
                                    ])),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50.0,
                                child: RaisedButton(
                                  onPressed: () {
                                    // ignore: unnecessary_statements

                                    Constants.prefs!.setBool("LoggedIn", true);
                                    if (formkey.currentState!.validate()) {
                                      // Navigator.of(context)
                                      //     .pushNamed(HomePage.routeName)
                                      //     .then((result) async {
                                      //   print(result);
                                      // });

                                      String _user =
                                          username.text.toString().trim();
                                      String _pass =
                                          password.text.toString().trim();
                                      fetchdata(_user, _pass);

                                      print("Validated");
                                    } else {
                                      print("Not Validated");
                                    }
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
                                          maxWidth: 100.0, minHeight: 50.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Login",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchdata(x, y) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };

    var request = http.Request('POST',
        Uri.parse('http://192.168.0.109:8000/api/method/salesman.api.login'));
    request.body = json.encode({"username": x, "password": y});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.headers);
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Mapresponse = await json.decode(res);
      dataResponse = Mapresponse['login'];
      var data = dataResponse['api_key'];

      // print(await response.stream.bytesToString());

      // Another API call

      // Ends
      Navigator.of(context).pushNamed(HomePage.routeName, arguments: {
        "Api_key": dataResponse['api_key'],
        "Api_secret": dataResponse['api_secret'],
        "Username": x
      }).then((result) async {
        print(result);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black26,
        content: Text(
          "Please Enter the valid data",
          style: TextStyle(color: Colors.white),
        ),
      ));
      print(response.reasonPhrase);
    }

    // print("hello");
    // http.Response response;
    // int _x = int.parse(x);
    // int _y = int.parse(y);
    // response = await http.get(Uri.parse(
    //     'http://192.168.0.109:8000/api/method/salesman.api.login?username=${_x}&password=${_y}',
    //     _x,
    //     _y));

    // if (response.statusCode == 200) {
    //   print("hello..");
    // Navigator.of(context).pushNamed(HomePage.routeName).then((result) {
    //   print(result);
    // });
    // setState(() {
    //   print("No");

    //   Mapresponse = json.decode(response.body);
    //   dataResponse = Mapresponse['login'];
    //   //stringResponse = response.body;
    // });
  }

  fetchparty(x, y) async {
    var headers = {
      'Authorization': 'token' + x + ':' + y,
      'Content-Type': 'application/json',
      'Cookie':
          'full_name=Guest; sid=Guest; system_user=no; user_id=Guest; user_image='
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            'http://192.168.0.109:8000/api/method/salesman.api.store_info'));
    request.body = json.encode({"username": x, "password": y});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("happy");
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
