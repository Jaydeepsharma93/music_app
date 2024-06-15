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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              child: Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(width: 10),
                  Text("Music Setting",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Text(
                "General",
                style:
                TextStyle(fontSize: 17, color: Colors.grey.shade700),
              ),
            ),
            Container(
              height: 85,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: ListTile(
                  title: Text('Dark mode',style: TextStyle(fontSize: 20),),
                  subtitle: Text((Provider.of<ThemeProvider>(context).isDark)?'Theme dark':'Theme light'),
                  trailing: CupertinoSwitch(value: Provider.of<ThemeProvider>(context).isDark, onChanged: (value) {
                    Provider.of<ThemeProvider>(context,listen: false).onChange(value);
                  },),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}