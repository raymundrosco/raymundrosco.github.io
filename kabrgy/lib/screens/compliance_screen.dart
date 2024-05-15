// ignore_for_file: prefer_const_constructors

/* Authored by: Ashley Jan Cantor
Company: kabrgy
Project: kabrgy
Feature: [KBY-005] SK NAU Screen
Description: Screen providing the full content of the announcement card in the Home Screen.
 */

import 'package:flutter/material.dart';
import 'package:kabrgy/features/criteriacardwidget.dart';
import 'package:kabrgy/features/submissionwidget.dart';
import 'package:kabrgy/themes/themes.dart';

class ComplianceScreen extends StatefulWidget {
  const ComplianceScreen({super.key});

  @override
  State<ComplianceScreen> createState() => _ComplianceScreenState();
}

class _ComplianceScreenState extends State<ComplianceScreen> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme().appTheme.appBarTheme.backgroundColor,
        title: IconButton(
          onPressed: () => {Navigator.pop(context, true)},
          icon: Icon(Icons.arrow_back),
          color: AppTheme().appTheme.colorScheme.secondary,
        ),
      ),
      body: Container(
        color: AppTheme().appTheme.colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Requirement',
                  style: AppTheme().appTheme.textTheme.headlineLarge),
              const SizedBox(height: 8),
              Text('Due on March 31, 2024',
                  style: AppTheme().appTheme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text('Requirement description',
                  style: AppTheme().appTheme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Divider(),
              Text(
                'CRITERIA:',
                style: AppTheme().appTheme.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, index) {
                  return Criteriacardwidget();
                }),
              )
            ],
          ),
        ),
      ),
    bottomNavigationBar: SubmissionWidget(open: true,),
    );
  }
}
