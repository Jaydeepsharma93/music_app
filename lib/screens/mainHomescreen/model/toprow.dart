import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Row buildRow(double width, double height) {
  return Row(
    children: [
      SizedBox(width: width * 0.03),
      Text(
        'Music',
        style: TextStyle(
            fontSize: height * 0.029,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700),
      ),
      Spacer(),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search_rounded,
            size: height * 0.03, color: Colors.black),
      ),
      PopupMenuButton(
        onSelected: (value) {
          if (value == 'Settings') {}
        },
        itemBuilder: (context) => <PopupMenuEntry>[
          PopupMenuItem(value: '', child: Text('Edit')),
          PopupMenuItem(value: '', child: Text('Sound quality and effects')),
          PopupMenuItem(value: 'Settings', child: Text('Settings')),
        ],
      )
    ],
  );
}
