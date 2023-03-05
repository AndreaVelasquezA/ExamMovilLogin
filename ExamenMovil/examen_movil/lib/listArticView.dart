import 'package:examen_movil/products.dart';
import 'package:flutter/material.dart';


class ListArticView extends StatelessWidget {
  const ListArticView({Key? key}) : super(key: key);


    @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 224, 224),
     
      body: Products(),
        

    );
  }
}