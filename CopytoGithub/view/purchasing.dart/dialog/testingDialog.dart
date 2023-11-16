import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestDIalog extends StatefulWidget {
  @override
  _TestDIalogState createState() => _TestDIalogState();
}

class _TestDIalogState extends State<TestDIalog> {
  final TextEditingController _kbController = TextEditingController();
  final TextEditingController _nbController = TextEditingController();
  final TextEditingController _deptController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _untController = TextEditingController();
  final TextEditingController _ketController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Demo'),
      ),
      body: Center(
        child: Container(height: 500,width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Panggil fungsi untuk mengambil data dari Firebase saat tombol ditekan
                  getDataFromFirebase();
                },
                child: Text('Ambil Data dari Firebase'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _kbController,
                decoration: InputDecoration(
                  labelText: 'kodeBarang',
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
                  labelText: 'namaBarang',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10, color: Colors.white)),
                ),
              ),
              TextField(
                controller: _deptController,
                decoration: InputDecoration(
                  labelText: 'dept',
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
                  labelText: 'qty',
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
                  labelText: 'unt',
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
                  labelText: 'ket',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getDataFromFirebase() async {
    try {
      // Gantilah 'collection_name' dengan nama koleksi Anda di Firestore
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('PR').get();

      // Ambil data pertama dari hasil query
      if (querySnapshot.docs.isNotEmpty) {
        var value = querySnapshot.docs[0];
        // Set nilai dalam TextField dengan data dari Firebase
        _kbController.text = value['kodeBarang'];
        _nbController.text = value['namaBarang'];
        _deptController.text = value['dept'];
        _qtyController.text = value['qty'];
        _untController.text = value['unt'];
        _ketController.text = value['ket'];
      } else {
        // Kosongkan TextField jika tidak ada data
        _kbController.text = '';
        _nbController.text = '';
        _deptController.text = '';
        _qtyController.text = '';
        _untController.text = '';
        _ketController.text = '';
      }
    } catch (e) {
      print('Error: $e');
      // Tampilkan pesan error jika terjadi kesalahan
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content:
                Text('Terjadi kesalahan saat mengambil data dari Firebase.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tutup'),
              ),
            ],
          );
        },
      );
    }
  }
}
