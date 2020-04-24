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
                backgroundColor: Color.fromRGBO(0,0,0,0.9),
                title: Text("Selecione seu carro favorito!"),
                centerTitle: true,
                
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
          Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(40.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color.fromRGBO(78, 86, 106, .6)),
              child: Center(
                child: ListView.builder(
                        itemCount: carros == null ? 0 : carros.length,                    
                        itemBuilder: (BuildContext context, int index){
                          return cardCarro(carros[index]);
                        },
                ),
              ),
          )]
        );
}

Card cardCarro(CarroModel carro){
  return Card(
    color: Color.fromRGBO(carro.r,carro.g,carro.b,.3 ),
    clipBehavior: Clip.antiAlias,
    shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      
    ),
    elevation: 12.0,
    
    child: Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        ListTile(  
          leading:  Image.asset(
                          "${carro.imgCaminho}.png",
                          width: 100.0,
                          height: 100.0,
                        ),   
          title: Text(
                  carro.nome,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  
          onTap: (){
              Navigator.pushNamed(
                context,
              "/carro_detalhes",
                arguments: carro);
            },
        ),
         SizedBox(height: 20.0),
      ],
    ),
   
    
     
       /*Container(
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
    ),*/
  );

  }
}