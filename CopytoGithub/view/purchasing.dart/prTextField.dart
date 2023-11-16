import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:information_technology_bps/constant.dart';

class PRTextField extends StatefulWidget {
  const PRTextField({Key? key}) : super(key: key);

  @override
  State<PRTextField> createState() => _PRTextFieldState();
}

class _PRTextFieldState extends State<PRTextField> {
  final TextEditingController _kbController = TextEditingController();
  final TextEditingController _nbController = TextEditingController();
  final TextEditingController _deptController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _untController = TextEditingController();
  final TextEditingController _ketController = TextEditingController();

//Fungsi mengirim data ke firestore

  void saveDataToFirestore(String kodeBarang, String namaBarang, String dept,
      int qty, String unt, String ket) {
    FirebaseFirestore.instance.collection('PR').add({
      'namaBarang': namaBarang,
      'kodeBarang': kodeBarang,
      'dept': dept,
      'qty': qty,
      'unt': unt,
      'ket': ket,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
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
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[A-Z]'))
          ],
        ),
        TextField(
          controller: _qtyController,
          decoration: InputDecoration(
            labelText: 'Kuantiti',
            hintText: 'masukan kuantiti',
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
            labelText: 'Unit',
            hintText: 'masukan unit',
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
            labelText: 'Keterangan',
            hintText: 'masukan keterangan',
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 10, color: Colors.white)),
          ),
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]'))
          // ],
        ),
        MaterialButton(
          color: primaryColor,
          child: Text('Save Data'),
          onPressed: () {
            //Panggil controller untuk mengirim data
            String kodeBarang = _kbController.text;
            String namaBarang = _nbController.text;
            String dept = _deptController.text;
            int qty = int.parse(_qtyController.text);
            String unt = _untController.text;
            String ket = _ketController.text;
            

            saveDataToFirestore(kodeBarang, namaBarang, dept, qty, unt, ket);
            _kbController.clear();
            _nbController.clear();
            _deptController.clear();
            _qtyController.clear();
            _untController.clear();
            _ketController.clear();
          },
        )
      ],
    );
  }
}
