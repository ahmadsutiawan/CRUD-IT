
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showEditDialog(
  BuildContext context,
  final String kodeBarang,
  final String namaBarang,
  final String dept,
  final String qty,
  final String unt,
  final String ket,
) async {
  final TextEditingController _kbController = TextEditingController();
  final TextEditingController _nbController = TextEditingController();
  final TextEditingController _deptController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _untController = TextEditingController();
  final TextEditingController _ketController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Container(
          height: 500,
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: _kbController,
                decoration: InputDecoration(
                  labelText: kodeBarang,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10, color: Colors.white)),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]'))
                ],
              ),
              TextField(
                controller: _nbController,
                decoration: InputDecoration(
                  labelText: namaBarang,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10, color: Colors.white)),
                ),
              ),
              TextField(
                controller: _deptController,
                decoration: InputDecoration(
                  labelText: dept,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10, color: Colors.white)),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[A-Z]'))
                ],
              ),
              TextField(
                controller: _qtyController,
                decoration: InputDecoration(
                  labelText: qty,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10, color: Colors.white)),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
              ),
              TextField(
                controller: _untController,
                decoration: InputDecoration(
                  labelText: unt,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10, color: Colors.white)),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[A-Z]'))
                ],
              ),
              TextField(
                controller: _ketController,
                decoration: InputDecoration(
                  labelText: ket,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

