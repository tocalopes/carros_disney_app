import 'package:carros_rm81523/models/carro_model.dart';

import 'database.dart';

class CarroRepository{

  Future<List<CarroModel>> findAll() async {
    var db = DataBase();
    await db.createDatabase();

    List<CarroModel> carros = new List<CarroModel>();


    if(db.created){
      carros = new List<CarroModel>();
      carros.add(
        new CarroModel(
          id:1,
          nome: 'Relampago Mcqueen',
          descricao: 'Protagonista da história, carro enjoado e mimado, talentoso competidor de stock car.' +
          'depois de se ferrar bastante fica legal e ganha tudo(quase, perde de propósito pra um carro veio' +
          'poder encerrar a carreira',
          pesoParaTrama: 5,
          marca: "Vou ver",
          imgCaminho: "undefined",
        ),
      );
    

    }

    return new Future.value(carros);
  }


}