import 'package:flutter/material.dart';

class HeaderLIstView extends StatelessWidget {
  const HeaderLIstView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 30,
            child: Text('No',style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis)),
        Container(
            width: 100,
            child: Text('Kode Barang',style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis)),
        Container(
            width: 200,
            child: Text('Nama Barang',style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis)),
        Container(
            width: 100,
            child: Text('Departmen',style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis)),
        Container(
            width: 50,
            child: Text('Qty',style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis)),
        Container(
            width: 50,
            child: Text('Unt',style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis)),
        Container(
          width: 220,
          child: Text('Keterangan',style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis),
        ),
        Expanded(
          child: Text('CreatedAt',style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }
}
