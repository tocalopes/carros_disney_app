import 'package:carros_rm81523/models/carro_model.dart';
import 'package:carros_rm81523/repository/carro_repository.dart';
import 'package:flutter/material.dart';

class CarrosScreen extends StatefulWidget {
  @override
  _CarrosScreenState createState() => _CarrosScreenState();
}

class _CarrosScreenState extends State<CarrosScreen> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image(image: AssetImage("logo.png")),
      ),
      body: FutureBuilder<List<CarroModel>>(
        future: CarroRepository().findAll(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return buildListView(snapshot.data);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


ListView buildListView(List<CarroModel> carros){
  return ListView.builder(
    itemCount: carros == null ? 0 : carros.length,
    itemBuilder: (BuildContext context, int index){
      return cardCarro(carros[index]);
    }
  );
}

Card cardCarro(CarroModel carro){
  return Card(
    clipBehavior: Clip.antiAlias,
    shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)
    ),
    elevation: 12.0,
    margin:new EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 6.0,
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0
        ),
        leading: Container(
          padding: EdgeInsets.only(right:20.0),
          decoration: new BoxDecoration(
            border: new Border(
              right: new BorderSide(
                width: 1.0,
                color: Colors.white,
              ) 
            ),
          )
        ),
      ),
      
    ),
  );

}