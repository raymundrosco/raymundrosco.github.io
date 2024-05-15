// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class SubmissionWidgetV2 extends StatefulWidget {
  @override
  State<SubmissionWidgetV2> createState() => SubmissionWidgetV2State();
}

class SubmissionWidgetV2State extends State<SubmissionWidgetV2> {
  bool submitted = false;
  bool reviewed = false;
  bool resubmit = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Column(
          children: [
            Divider(),
            Container(
              color: AppTheme().appTheme.colorScheme.background,
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_copy,
                            size: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Upload files")
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_copy,
                            size: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Upload files")
                        ],
                      ))
                ],
              ),
            ),
          ],
        ));
  }

  refresh() {
    setState(() {});
  }
}
