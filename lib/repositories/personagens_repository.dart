import 'package:app_rick_and_morty/models/details_personagens.dart';
import 'package:dio/dio.dart';
import 'package:app_rick_and_morty/models/personagens_list.dart';

abstract class PersonagensRepository {
  static final dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'),
  );

  // Chamada de API para obter a lista de personagens
  static Future<PersonagemListModel> getUpcomingPersonagens() async {
    final reponse = await dio.get('/character');
    return PersonagemListModel.fromMap(reponse.data);
  } 

    static Future<DetailsPersonagensModel> getDetalhesPersonagens(characterId) async {
    final reponse = await dio.get('/character/$characterId');
    return DetailsPersonagensModel.fromMap(reponse.data);
  } 
}
