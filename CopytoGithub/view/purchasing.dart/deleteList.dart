
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
Future<void> deleteDocument(String collectionName, String documentId) async {
    try {
      // Gantilah 'PR' dengan nama koleksi Anda di Firestore
      await FirebaseFirestore.instance.collection(collectionName).doc(documentId).delete();

      print('Dokumen berhasil dihapus');
    } catch (e) {
      print('Error: $e');
      // Tampilkan pesan error jika terjadi kesalahan
      var context;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Terjadi kesalahan saat menghapus dokumen di Firebase.'),
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
