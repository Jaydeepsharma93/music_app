import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_app/screens/settingScreen/themeprovider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("General"),
            Container(

              width: double.infinity,
              child: ListTile(
                title: Text('Dark mode',style: TextStyle(fontSize: 20),),
                subtitle: Text((Provider.of<ThemeProvider>(context).isDark)?'dark':'light'),
                trailing: CupertinoSwitch(value: Provider.of<ThemeProvider>(context).isDark, onChanged: (value) {
                  Provider.of<ThemeProvider>(context,listen: false).onChange(value);
                },),
              ),
            )
          ],
        ),
      ),
    );
  }
}
