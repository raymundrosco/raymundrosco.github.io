/* Authored by: Raymund Joseph M. Rosco
Company: kabrgy
Project: kabrgy
Feature: [KBY-002] Login Screen
Description: Used to log-in to the user account or navigate to the registration page.
 */

import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

const List<String> userList = <String>[
  'Sangguniang Kabataan Official',
  'Local Youth Development Officer',
  'Katipunan ng Kabataan Member'
];
const List<String> positionList = <String>[
  'Chairperson',
  'Secretary',
  'Treasurer',
  'Councilor'
];
const List<String> brgyList = <String>[
  'Sto. Domingo',
  'San Jose',
  'San Antonio',
  'San Isidro'
];
const List<String> municipalityList = <String>['Bombon'];

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _RegisterKey = GlobalKey<FormState>();

  FocusNode myFocusNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String municipalityController = "";
  String brgyController = "";
  String posController = "";
  String userController = "";

  bool sk = true;
  bool lydo = false;
  bool kk = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _RegisterKey,
      child: Material(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: AppTheme().appTheme.colorScheme.background,
          child: Column(children: <Widget>[
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: Text('Register as:',
                        style: AppTheme().appTheme.textTheme.titleMedium),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    child: DropdownMenu<String>(
                      initialSelection: userList[0],
                      expandedInsets: EdgeInsets.zero,
                      hintText: "User",
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      textStyle: const TextStyle(fontSize: 16),
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
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: usernameController,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
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
                  Visibility(
                    visible: sk || kk,
                    child: Column(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: DropdownMenu<String>(
                              expandedInsets: EdgeInsets.zero,
                              hintText: "Barangay",
                              textStyle: const TextStyle(fontSize: 16),
                              onSelected: (String? value) {
                                brgyController = value!;
                              },
                              dropdownMenuEntries: brgyList
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                  value: value,
                                  label: value,
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: DropdownMenu<String>(
                              expandedInsets: EdgeInsets.zero,
                              hintText: "Municipality",
                              onSelected: (String? value) {
                                municipalityController = value!;
                              },
                              dropdownMenuEntries: brgyList
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                  value: value,
                                  label: value,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ]),
                  ),
                  Visibility(
                    visible: sk,
                    child: Column(
                      children: [
                        DropdownMenu<String>(
                          expandedInsets: EdgeInsets.zero,
                          hintText: "Position",
                          inputDecorationTheme: InputDecorationTheme(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          textStyle: const TextStyle(fontSize: 16),
                          onSelected: (String? value) {
                            brgyController = value!;
                          },
                          dropdownMenuEntries: brgyList
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: value,
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: lydo,
                    child: Column(
                      children: [
                        DropdownMenu<String>(
                          expandedInsets: EdgeInsets.zero,
                          hintText: "Municipality",
                          inputDecorationTheme: InputDecorationTheme(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            constraints:
                                BoxConstraints.tight(const Size.fromHeight(52)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          textStyle: const TextStyle(fontSize: 16),
                          onSelected: (String? value) {
                            municipalityController = value!;
                          },
                          dropdownMenuEntries: brgyList
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: value,
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 8,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: TextButton(
                        onPressed: () {
                          if (_RegisterKey.currentState!.validate()) {
                            if (usernameController.text == "test" &&
                                passwordController.text == "123") {
                              Navigator.of(context).pushNamed('/home');
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill input')),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppTheme().appTheme.colorScheme.primary),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                          ),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Divider(),
                    SizedBox(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        style: const ButtonStyle(
                            alignment: Alignment.centerLeft,
                            padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Have an account?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppTheme()
                                      .appTheme
                                      .colorScheme
                                      .onSecondary,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Click me to Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      AppTheme().appTheme.colorScheme.primary,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ]),
            ),
          ]),
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
