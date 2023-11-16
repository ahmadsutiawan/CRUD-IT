import 'package:flutter/material.dart';
import 'package:information_technology_bps/models/listTile.dart';
import 'package:information_technology_bps/view/dashboard/dashboard.dart';
import 'package:information_technology_bps/view/purchasing.dart/purchasing.dart';
import 'package:information_technology_bps/view/receipt/receipt.dart';

class Dekstop extends StatefulWidget {
  const Dekstop({Key? key}) : super(key: key);

  @override
  State<Dekstop> createState() => _DekstopState();
}

class _DekstopState extends State<Dekstop> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerHeader(
                    child: Icon(
                      Icons.dashboard_customize_outlined,
                      size: 70,
                    ),
                  ),
                  GenListTile(
                      icon: Icons.book,
                      title: 'Purchase',
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      }),
                  GenListTile(
                      icon: Icons.receipt,
                      title: 'Receipt',
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      }),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: IndexedStack(
            index: _currentIndex,
            children: [
              Purchase(),
              Dashboard(),
              Receipt(),
            ],
          ),
        ),
      ],
    );
  }
}
