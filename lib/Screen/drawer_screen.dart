import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: Column(
        children: [
          Stack(children: []),
          ListTile(
            title: Text('mohamed abouassi'),
            subtitle: Text('Tanta'),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: const Text(
              "Home",
              style: TextStyle(
                color: Color(0xff800000),
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
// Handle your onTap event here
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: const Text(
              "Settings",
              style: TextStyle(
                color: Color(0xff800000),
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
// Handle your onTap event here
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
