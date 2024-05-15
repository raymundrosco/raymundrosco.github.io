/* Authored by: Ashley Jan Cantor and Raymund Joseph M. Rosco
Company: kabrgy
Project: kabrgy
Feature: [KBY-004] Home Screen
Description: Used to view announcements, which can be expounded.
 */

import 'package:flutter/material.dart';
import 'package:kabrgy/features/appbarwidget.dart';
import 'package:kabrgy/features/navdrawerwidget.dart';
import 'package:kabrgy/themes/themes.dart';

List<String> statusList = <String>['Todo', 'Missing', 'Done'];

class ComplianceList extends StatefulWidget {
  const ComplianceList({super.key});

  @override
  State<ComplianceList> createState() => _ComplianceListState();
}

class _ComplianceListState extends State<ComplianceList> {
  get itemBuilder => null;

  String statusController = "Todo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Work well!',
              style: AppTheme().appTheme.textTheme.displaySmall,
            ),
            Text('You can do it! Para sa kabataan!',
                style: AppTheme().appTheme.textTheme.headlineMedium),
            const SizedBox(
              height: 8,
            ),
            Column(
              children: [
                DropdownMenu<String>(
                  expandedInsets: EdgeInsets.zero,
                  initialSelection: statusController,
                  inputDecorationTheme: InputDecorationTheme(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    constraints:
                        BoxConstraints.tight(const Size.fromHeight(52)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                  onSelected: (String? value) {
                    statusController = value!;
                  },
                  dropdownMenuEntries:
                      statusList.map<DropdownMenuEntry<String>>((String value) {
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
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/compliance');
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppTheme()
                                    .appTheme
                                    .colorScheme
                                    .onSecondary),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Requirement 1',
                                  style:
                                      AppTheme().appTheme.textTheme.titleLarge),
                              Text(
                                'Due on March 21, 2024',
                                style: AppTheme().appTheme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: const NavDrawerWidget(),
    );
  }
}
