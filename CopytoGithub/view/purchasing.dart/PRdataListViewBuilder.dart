import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:information_technology_bps/constant.dart';

class DataListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('PR').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                int itemNumber = index + 1;
                // Timestamp createdAtTimestamp = document[index]['cretedAt'];
                // DateTime createdAt = createdAtTimestamp.toDate();
                Color itemColor = index % 2 == 0
                    ? Color.fromARGB(255, 85, 81, 81)
                    : const Color.fromARGB(255, 99, 97, 97);
                return Container(
                  padding: EdgeInsets.all(defaultPadding),
                  color: itemColor,
                  width: double.infinity,
                  height: 70,
                  child: Row(
                    children: [
                      SizedBox(width: 30, child: Text('$itemNumber.')),
                      SizedBox(width: 100, child: Text(document['kodeBarang'])),
                      SizedBox(width: 200, child: Text(document['namaBarang'])),
                      SizedBox(width: 100, child: Text(document['dept'])),
                      // SizedBox(
                      //     width: 50, child: Text(document['qty'.toString()])),
                      SizedBox(
                          width: 50,
                          child: Text(document['qty']?.toString() ?? '')),
                      SizedBox(width: 50, child: Text(document['unt'])),
                      SizedBox(width: 220, child: Text(document['ket'])),
                    
                      
                      // SizedBox(width: 100, child: Text('$createdAt')),
                      IconButton(
                        icon: Icon(Icons.edit_document),
                        onPressed: () {
                          _editData(context, document);
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('PR')
                                .doc(document.id)
                                .delete();
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  // Fungsi untuk mengedit data
  void _editData(BuildContext context, DocumentSnapshot document) {
    // Di sini, Anda dapat menampilkan dialog atau navigasi ke layar pengeditan
    // dengan data yang diperoleh dari document.
    // Contoh menggunakan showDialog untuk menampilkan dialog pengeditan:
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController _kbController =
            TextEditingController(text: document['kodeBarang']);
        TextEditingController _nbController =
            TextEditingController(text: document['namaBarang']);
        TextEditingController _deptController =
            TextEditingController(text: document['dept']);
        TextEditingController _qtyController =
            TextEditingController(text: document['qty'].toString());
        TextEditingController _untController =
            TextEditingController(text: document['unt']);
        TextEditingController _ketController =
            TextEditingController(text: document['ket']);

        return AlertDialog(
          title: Text(
            'Edit Data',
            style: TextStyle(color: primaryColor),
          ),
          content: Container(
            height: 600,
            width: 400,
            child: Column(
              children: [
                TextField(
                  controller: _kbController,
                  decoration: InputDecoration(labelText: 'Kode Barang'),
                ),
                TextField(
                  controller: _nbController,
                  decoration: InputDecoration(labelText: 'Nama Barang'),
                ),
                TextField(
                  controller: _deptController,
                  decoration: InputDecoration(labelText: 'Department'),
                ),
                TextField(
                  controller: _qtyController,
                  decoration: InputDecoration(labelText: 'Quantity'),
                ),
                TextField(
                  controller: _untController,
                  decoration: InputDecoration(labelText: 'Unit'),
                ),
                TextField(
                  controller: _ketController,
                  decoration: InputDecoration(labelText: 'Keterangan'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await FirebaseFirestore.instance
                      .collection('PR')
                      .doc(document.id)
                      .update({
                    'kodeBarang': _kbController.text,
                    'namaBarang': _nbController.text,
                    'dept': _deptController.text,
                    'qty': int.parse(_qtyController.text),
                    'unt': _untController.text,
                    'ket': _ketController.text,
                  
                  });

                  Navigator.pop(context); // Tutup dialog
                } catch (e) {
                  print('Error updating document: $e');
                  // Tampilkan pesan kesalahan jika perlu
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
