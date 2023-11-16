import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldDialogPR extends StatefulWidget {
  const TextFieldDialogPR({Key? key}) : super(key: key);

  @override
  State<TextFieldDialogPR> createState() => _TextFieldDialogPRState();
}

class _TextFieldDialogPRState extends State<TextFieldDialogPR> {
  final TextEditingController _kbController = TextEditingController();
  final TextEditingController _nbController = TextEditingController();
  final TextEditingController _deptController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _untController = TextEditingController();
  final TextEditingController _ketController = TextEditingController();

  late final String kodeBarang;
  late final String namaBarang;
  late final String dept;
  late final String qty;
  late final String unt;
  late final String ket;

//Fungsi mengirim data ke firestore

  @override
  Widget build(BuildContext context) {
    return FieldInputPR(
        kbController: _kbController,
        kodeBarang: kodeBarang,
        nbController: _nbController,
        namaBarang: namaBarang,
        deptController: _deptController,
        dept: dept,
        qtyController: _qtyController,
        qty: qty,
        untController: _untController,
        unt: unt,
        ketController: _ketController,
        ket: ket);
  }
}

class FieldInputPR extends StatelessWidget {
  const FieldInputPR({
    super.key,
    required TextEditingController kbController,
    required this.kodeBarang,
    required TextEditingController nbController,
    required this.namaBarang,
    required TextEditingController deptController,
    required this.dept,
    required TextEditingController qtyController,
    required this.qty,
    required TextEditingController untController,
    required this.unt,
    required TextEditingController ketController,
    required this.ket,
  })  : _kbController = kbController,
        _nbController = nbController,
        _deptController = deptController,
        _qtyController = qtyController,
        _untController = untController,
        _ketController = ketController;

  final TextEditingController _kbController;
  final String kodeBarang;
  final TextEditingController _nbController;
  final String namaBarang;
  final TextEditingController _deptController;
  final String dept;
  final TextEditingController _qtyController;
  final String qty;
  final TextEditingController _untController;
  final String unt;
  final TextEditingController _ketController;
  final String ket;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[A-Z]'))],
      ),
      TextField(
        controller: _qtyController,
        decoration: InputDecoration(
          labelText: qty,
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 10, color: Colors.white)),
        ),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      ),
      TextField(
        controller: _untController,
        decoration: InputDecoration(
          labelText: unt,
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 10, color: Colors.white)),
        ),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[A-Z]'))],
      ),
      TextField(
        controller: _ketController,
        decoration: InputDecoration(
          labelText: ket,
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 10, color: Colors.white)),
        ),
      ),
    ]);
  }
}
