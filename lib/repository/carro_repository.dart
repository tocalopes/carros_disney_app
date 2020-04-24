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
          nome: 'Montegomery McQueen',
          apelido: 'Relampago Marquinhos',
          descricao: 'Popurlamente conhecido no Brasil como Relâmpago Marquinhos, é o protragonista' +
          'da história, começa como um babacão enjoado e mimado, mas talentoso no Stock Car.' +
          'Depois de se ferrar bastante fica legal e ganha tudo(quase, perde de propósito pra um carro veio' +
          'poder encerrar a carreira no auge',
          pesoParaTrama: 5,
          marca: "Mazda RX8",
          imgCaminho: "mcqueen",
          r:139,
          g:0,
          b:0,
          o:1,
          ocupacao: "Carro de corrida"
        ),
      );
      carros.add(
        new CarroModel(
          id:2,
          nome: 'Tom Mate',
          apelido: 'Carro do meu pai',
          descricao: 'É o alivio comico do filme. Caipirão meio burro mas de bom coração, ajuda o' +
          'relâmpago marquinhos a se tornar uma pessoa(carro) melhor \n'+
          'NOTA: Os dubladores brasileiros foram geniais no trocadilho',
          pesoParaTrama: 4,
          marca: "Não possui, de tão velho",
          imgCaminho: "mate",
          r:139,
          g:69,
          b:19,
          o:1,
          ocupacao: "Reboque"
        ),
      );
       carros.add(
        new CarroModel(
          id:3,
          nome: 'Fillmore',
          apelido: 'Kombi 4H20',
          descricao: 'Faz uso pesado de narcóricos e entorpecentes. É vegano, vegetariano, naturalista'+
          ',provavelmente toca ukulele e bebe starbucks',
          pesoParaTrama: 2,
          marca: "Volkswagen Komb",
          imgCaminho: "fillmore",
          r:0,
          g:128,
          b:128,
          o:1,
          ocupacao: 'Comerciante de narcóticos'
        ),
      );
      carros.add(
        new CarroModel(
          id:3,
          nome: 'Sally',
          apelido: 'Porshete',
          descricao: 'Par romântico do marquinhos e é muita areia pro caminhãozinho dela, faz traseira doce'+
          'o filme inteiro.',
          pesoParaTrama: 3,
          marca: "Porsche 911 Carrera",
          imgCaminho: "sally",
          r:70,
          g:130,
          b:180,
          o:1,
          ocupacao: "Dona do Motel Cozy Cone(cone confortável para os leigos)"
        ),
      );
      carros.add(
        new CarroModel(
          id:4,
          nome: 'Doc Hudson',
          apelido: 'Documento de world',
          descricao: 'Era um ótimo corredor no seu tempo, até que bateu e fico inútil.'+
          'Serve como modelo paterno para o marquinho e o ensina a dar drift melhor que o japa do velozes'+
          'e Furiozos Desafio em Tokyo.',
          pesoParaTrama: 3,
          marca: "Hudson Hornet 1951",
          imgCaminho: "hudson",
          r:75,
          g:0,
          b:130,
          o:1,
          ocupacao:"Prefeito de Radiator Springs"
        ),
      );
      carros.add(
        new CarroModel(
          id:5,
          nome: 'Luigi',
          apelido: 'Italiano Anão',
          descricao: 'Tem sotaque italiano, vende pneus e muito provavelmente seja anão no universo'+
          'em que o filme se passa.Seu irmão se chama mario',          
          pesoParaTrama: 1,
          marca: "Fiat 500 19459",
          imgCaminho: "luigi",
          r:0,
          g:128,
          b:0,
          o:1,
          ocupacao:"Vendedor de Pneus"
        ),
      );
    

    }

    return new Future.value(carros);
  }


}