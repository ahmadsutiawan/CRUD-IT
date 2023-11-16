
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneralTextfield extends StatefulWidget {
  const GeneralTextfield({Key? key}) : super(key: key);

  @override
  State<GeneralTextfield> createState() => _GeneralTextfieldState();
}

class _GeneralTextfieldState extends State<GeneralTextfield> {
  final TextEditingController _kbController = TextEditingController();
  final TextEditingController _nbController = TextEditingController();
  final TextEditingController _deptController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _untController = TextEditingController();
  final TextEditingController _ketController = TextEditingController();

//Fungsi mengirim data ke firestore

  // void saveDataToFirestore(String kodeBarang, String namaBarang, String dept,
  //     int qty, String unt, String ket) {
  //   FirebaseFirestore.instance.collection('PR').doc().update({
  //     'namaBarang': namaBarang,
  //     'kodeBarang': kodeBarang,
  //     'dept': dept,
  //     'qty': qty,
  //     'unt': unt,
  //     'ket': ket,
  //     'createdAt': FieldValue.serverTimestamp(),
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      TextField(
        controller: _kbController,
        decoration: InputDecoration(
          labelText: 'Kode Barang',
          hintText: 'masukan kode barang',
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 10, color: Colors.white)),
        ),
        inputFormatters: [
          // FilteringTextInputFormatter.digitsOnly
          // FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
          FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]'))
        ],
      ),
      TextField(
        controller: _nbController,
        decoration: InputDecoration(
          labelText: 'Nama Barang',
          hintText: 'masukan nama barang',
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 10, color: Colors.white)),
        ),
        // inputFormatters: [
        //   FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]'))
        // ],
      ),
      TextField(
        controller: _deptController,
        decoration: InputDecoration(
          labelText: 'Department',
          hintText: 'masukan department',
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 10, color: Colors.white)),
        ),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[A-Z]'))],
      ),
      TextField(
        controller: _qtyController,
        decoration: InputDecoration(
          labelText: 'Kuantiti',
          hintText: 'masukan kuantiti',
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 10, color: Colors.white)),
        ),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      ),
      TextField(
        controller: _untController,
        decoration: InputDecoration(
          labelText: 'Unit',
          hintText: 'masukan unit',
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 10, color: Colors.white)),
        ),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[A-Z]'))],
      ),
      TextField(
        controller: _ketController,
        decoration: InputDecoration(
          labelText: 'Keterangan',
          hintText: 'masukan keterangan',
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 10, color: Colors.white)),
        ),
        // inputFormatters: [
        //   FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]'))
        // ],
      ),
    ]);
  }
}
