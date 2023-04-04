import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.black26,
      child: Container(
        height: 90,
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      appLogoUrl,
                    )),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
