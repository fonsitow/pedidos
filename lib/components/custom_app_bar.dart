import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(title: );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

// en la programacion POO hay dos tipos de clases, abtractas y concretas, tambian hay interfaces

/*

override es sobreescibir
* las clases abstractas sirven como modelos o moldes para implementar otras clases
* las clases concretas  
*/
