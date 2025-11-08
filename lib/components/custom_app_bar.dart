import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset("assets/images/logodaf.png"),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.blue),
      foregroundColor: Theme.of(context).appBarTheme.backgroundColor,
      backgroundColor: Theme.of(context).appBarTheme.foregroundColor,
      shape: Border(
        bottom: BorderSide(
          width: 5,
          color: Color(0x99FF0000)
        )
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
