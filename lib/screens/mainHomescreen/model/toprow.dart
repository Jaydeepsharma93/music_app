import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../settingScreen/setting.dart';

Row buildRow(double width, double height, context) {
  return Row(
    children: [
      SizedBox(width: width * 0.03),
      Text(
        'Music',
        style: TextStyle(
            fontSize: height * 0.029,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600),
      ),
      Spacer(),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search_rounded, size: height * 0.03),
      ),
      PopupMenuButton(
        onSelected: (value) {
          if (value == 'Settings') {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SettingScreen(),
            ));
          }
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
