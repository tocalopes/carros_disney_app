import 'package:carros_rm81523/screens/index_listagem_carros.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context ){
    return MaterialApp(
      title: 'Carros App',
      theme: new ThemeData(
        primaryColor: Colors.red,
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes:{
        '/': (context) => CarrosScreen(),
      },
    );
  }

}