import 'package:field_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  void logOutUser() {
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 120,
            color: const Color.fromARGB(255, 241, 239, 239),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.person),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Yadav Kumar Dhakal",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          ListTile(
              onTap: () {},
              title: const Text("Settings"),
              trailing: const CircleAvatar(
                radius: 12,
                child: Icon(
                  Icons.settings,
                  size: 14,
                ),
              )),
          const Divider(),
          ListTile(
              onTap: logOutUser,
              title: const Text("Log Out"),
              trailing: const CircleAvatar(
                radius: 12,
                child: Icon(
                  Icons.logout,
                  size: 14,
                ),
              )),
          const Divider(),
        ],
      ),
    );
  }
}
