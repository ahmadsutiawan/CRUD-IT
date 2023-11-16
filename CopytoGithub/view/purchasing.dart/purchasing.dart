import 'package:flutter/material.dart';
import 'package:information_technology_bps/constant.dart';
import 'package:information_technology_bps/view/purchasing.dart/PRdataListViewBuilder.dart';
import 'package:information_technology_bps/view/purchasing.dart/prheaderListview.dart';
import 'package:information_technology_bps/view/purchasing.dart/prTextField.dart';

class Purchase extends StatelessWidget {
  Purchase({
    Key? key,
  }) : super(key: key);
  final List<String> inputPR = [];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(defaultPadding),
            height: 50,
            color: Colors.white,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                width: width * 0.3,
                height: 500,
                color: secondaryColor,
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: PRTextField(),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: defaultPadding),
                  height: 500,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.all(defaultPadding),
            padding: EdgeInsets.all(defaultPadding),
            color: secondaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Header List data
                Container(
                  padding: EdgeInsets.all(defaultPadding),
                  color: Colors.red,
                  height: 50,
                  child: HeaderLIstView(),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Expanded(
                  child: DataListViewBuilder(),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

// Fungsi untuk mengedit data
