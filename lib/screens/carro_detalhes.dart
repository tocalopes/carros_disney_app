import 'package:carros_rm81523/models/carro_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarroDetalhesScrenn extends StatelessWidget{
  
  String defineNivel(double x){
    String nivel;
    int y = x.toInt();
    switch (y) {
    case (1): 
      nivel = "Personagem Inutil";
      break;
    case (2): 
      nivel = "Figurante";
      break;
    case (3): 
      nivel = "Personagem significativo";
      break;
    case (4): 
      nivel = "Personagem melhor que o principal";
      break;
    case (5): 
      nivel = "Protagonista";
      break;
    }
    return nivel;
  }
  
  CarroModel carro;
  String nivel;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    carro = ModalRoute.of(context).settings.arguments;
    nivel = defineNivel(carro.pesoParaTrama);
   
    final levelIndicator = Container(
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: carro.pesoParaTrama,
            valueColor: AlwaysStoppedAnimation(Colors.green),
          )
        ),
      ),
    );

    /*final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          carro.nome,
          style: TextStyle(
            color: Colors.white,
            fontSize: 45.0,
          ),
        ),
      ],
    );
    */
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 220.0),
        Text(
            carro.nome,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
       
        SizedBox(height: 14.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            
            Expanded(
              flex: 1,
              child: levelIndicator,
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  nivel,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.0),
        Text(
            "Apelido:     ${carro.apelido}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
      ],
    );

    final bottomContentText = Text(
      "${carro.descricao} \n\n\n Ocupação:${carro.ocupacao} \n\n Marca:Ocupação:${carro.marca}",
      style: TextStyle(fontSize: 18.0,color: Colors.white),
      textAlign: TextAlign.justify,
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("${carro.imgCaminho}.gif"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(carro.r, carro.g, carro.b, .5)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      decoration: BoxDecoration(
        color:Color.fromRGBO(carro.r, carro.g, carro.b, 1), 
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText,
          ],
        ),
      ),
    );
    
    return Scaffold(
      body: Container(
      //width: MediaQuery.of(context).size.width,
      //padding: EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          color:Color.fromRGBO(carro.r, carro.g, carro.b, 1),
        ),
        child: Column(
          children: <Widget>[
            topContent,
            bottomContent
          ],
        ),
      ),
      );
     
  }


}