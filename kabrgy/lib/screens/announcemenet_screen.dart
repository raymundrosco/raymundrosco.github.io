/* Authored by: Ashley Jan Cantor
Company: kabrgy
Project: kabrgy
Feature: [KBY-005] SK NAU Screen
Description: Screen providing the full content of the announcement card in the Home Screen.
 */

import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme().appTheme.appBarTheme.backgroundColor,
        title: IconButton(
          onPressed: () => {
            Navigator.pop(context, true)
          },
          icon: Icon(Icons.arrow_back),
          color: AppTheme().appTheme.colorScheme.secondary,
        ),
      ),
      body: 
      Container(
        color: AppTheme().appTheme.colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Announcement Heading',
                  style: AppTheme().appTheme.textTheme.headlineLarge),
              const SizedBox(height: 8),
              Text('by NYC',
                  style: AppTheme().appTheme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text('Announcement details...',
                  style: AppTheme().appTheme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
