import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class Criteriacardwidget extends StatefulWidget {
  @override
  State<Criteriacardwidget> createState() => CriteriacardwidgetState();
}

class CriteriacardwidgetState extends State<Criteriacardwidget> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => {open = !open, refresh()},
          child: Container(
            height: 48,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border:
                    Border.all(color: AppTheme().appTheme.colorScheme.primary)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Icon(open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 28,),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "hello",
                    style: AppTheme().appTheme.textTheme.labelMedium,
                  ),
                ]),
                Text("50%", style: AppTheme().appTheme.textTheme.bodyMedium,)
              ],
            ),
          ),
        ),
        Visibility(
            visible: open,
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppTheme().appTheme.colorScheme.primary)),
                child: Text("hshdaskjds")))
      ],
    );
  }

  refresh() {
    setState(() {});
  }
}
