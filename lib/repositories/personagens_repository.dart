import 'package:app_rick_and_morty/models/personagens_list.dart';
import 'package:dio/dio.dart';

class PersonagensRepository {
  static final dio = Dio(
    BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'),
  );

  // static Future<PersonagensListModel> getUpcomingMovies() async {
  //   final reponse = await dio.get('/movie/upcoming');
  //   return MovieListModel.fromMap(reponse.data);
  // } //esse é do exemplo, preciso mudar para o meu
}
