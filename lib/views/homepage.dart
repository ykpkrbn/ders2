import 'package:ders2/controllers/user_controller.dart';
import 'package:ders2/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homepage')),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {

            return ListTile(
              title: Text('asd'),
              onTap: () {
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsView(),));
                Get.offAll(()=>SettingsView());
              },
            );
          }),
    );
  }
}
