/* Authored by: Raymund Joseph M. Rosco
Company: kabrgy
Project: kabrgy
Feature: [KBY-002] Login Screen
Description: Used to log-in to the user account or navigate to the registration page.
 */

import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

const List<String> userList = <String>['Sangguniang Kabataan Official', 'Local Youth Development Officer', 'Katipunan ng Kabataan Member'];

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _LoginKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String userController = "";
  
  bool sk = true;
  bool lydo = false;
  bool kk = false;

  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return 
    Form(
      key: _LoginKey,
      child: Material(
          child: Container(
            padding: const EdgeInsets.all(20),
            color: AppTheme().appTheme.colorScheme.background,
            child: 
            Column(
              children: <Widget> [Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Text('Login as:',
                          style: AppTheme().appTheme.textTheme.titleMedium
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        child: 
                        Expanded(
                          child: DropdownMenu<String>(
                          initialSelection: userList[0],
                          expandedInsets: EdgeInsets.symmetric(horizontal: 0),
                          hintText: "User",
                          onSelected: (String? value) {
                          userController = value!;
                          if (userController == "Sangguniang Kabataan Official") {
                            selectOpt("SK");
                          } else if (userController ==
                              "Local Youth Development Officer") {
                            selectOpt("LYDO");
                          } else {
                            selectOpt("KK");
                          }
                                                },
                                                dropdownMenuEntries: userList
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                            value: value,
                            label: value,
                          );
                                                }).toList(),
                                              ),
                        ),
                  ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: usernameController,
                        style: const TextStyle(fontSize: 16),
                        decoration: 
                          const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                            return null;
                          },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: passwordController,
                        style: const TextStyle(fontSize: 16),
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        validator: (value) {
                            if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                            return null;
                          },
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextButton(
                        onPressed: () {
                          if (_LoginKey.currentState!.validate()) {
                            if (usernameController.text == "test" && passwordController.text == "123") {
                              Navigator.of(context).pushNamed('/home');
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill input')),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppTheme().appTheme.colorScheme.primary),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                          ),
                        ),
                        child:
                          const Text("Login",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white
                            ),
                          )
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Divider(),
                    SizedBox(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                          style: const ButtonStyle(
                            alignment: Alignment.centerLeft,
                            padding: MaterialStatePropertyAll(EdgeInsets.zero)
                          ),
                          child: 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Don’t have an account?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppTheme().appTheme.colorScheme.onSecondary,
                                ),
                              ),
                              SizedBox(width: 4,),
                              Text('Click me to Sign up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppTheme().appTheme.colorScheme.primary,
                                ),
                              ),
                            ]
                          ),
                        ),
                      ),
                  ]),
              ),
              ]
            ),
          ),
        ),
    );
  }

void selectOpt(String opt) {
    setState(() {
      if (opt == "SK") {
        sk = true;
        lydo = kk = false;
      } else if (opt == "LYDO") {
        lydo = true;
        sk = kk = false;
      } else {
        kk = true;
        sk = lydo = false;
      }
    });
  }
}