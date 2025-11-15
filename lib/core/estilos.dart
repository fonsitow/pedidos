import 'package:flutter/material.dart';



class Styles{
  final TextStyle primary = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w500,
    color: const Color.fromARGB(176, 0, 0, 0)
  );
}

class Navegacion {

  paginas(Widget page, context){
  Navigator.push(
    context, MaterialPageRoute(builder: (context) => page)
  );
} 


}