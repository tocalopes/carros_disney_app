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
    return Container(
      child:Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child:AppBar(
                backgroundColor: Color.fromRGBO(0,191,255,0.3),
                title: Text("Selecione seu carro favorito!"),
              ),
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
            //backgroundColor: Colors.white,//Color.fromRGBO(211,2s11,211,1),
        ),
      );
  }



Stack buildListView(List<CarroModel> carros){
  return Stack(
        children: <Widget>[
          Image.asset(
            "fundo.jpg",
            width: double.infinity,
            height: double.infinity,
            fit:BoxFit.cover,
            colorBlendMode: BlendMode.darken,
          ),
          ListView.builder(
            itemCount: carros == null ? 0 : carros.length,
            itemBuilder: (BuildContext context, int index){
              return cardCarro(carros[index]);
            },
          )]
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
        color: Color.fromRGBO(carro.r,carro.g,carro.b,carro.o),
        image: DecorationImage(
          image: AssetImage("${carro.imgCaminho}.png"),
          alignment: Alignment.centerLeft,
        )
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0
        ),
        title: Text(
          carro.nome,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
        onTap: (){
          Navigator.pushNamed(
            context,
           "/carro_detalhes",
            arguments: carro);
        },
      ),
    ),
  );

  }
}