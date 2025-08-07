import 'package:dio/dio.dart';
import 'package:app_rick_and_morty/models/personagens_list.dart';

abstract class PersonagensRepository {
  static final dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'),
  );

  // Chamada de API para obter a lista de personagens
  static Future<PersonagensListModel> getUpcomingPersonagens() async {
    final reponse = await dio.get('/character');
    return PersonagensListModel.fromMap(reponse.data);
  } 

    static Future<PersonagensListModel> getUpcomingDetalhesPersonagens(int characterId) async {
    final reponse = await dio.get('/character/$characterId');
    return PersonagensListModel.fromMap(reponse.data);
  } 
}
