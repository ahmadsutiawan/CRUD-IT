import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void showEditDialog(BuildContext context, String documentId, String itemName, int itemQuantity) {
    TextEditingController itemNameController = TextEditingController(text: itemName);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: Column(
            children: [
              TextField(
                controller: itemNameController,
                decoration: InputDecoration(labelText: 'Item Name'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Handle the save button press
                _saveChanges(documentId, itemNameController.text);
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Save Changes'),
            ),
          ],
        );
      },
    );
  }

  // Function to handle the save button press
  void _saveChanges(String documentId, String newItemName) {
    // Update Firestore document using documentId
    FirebaseFirestore.instance.collection('your_collection_name').doc(documentId).update({
      'item_name': newItemName,
    });
  }

