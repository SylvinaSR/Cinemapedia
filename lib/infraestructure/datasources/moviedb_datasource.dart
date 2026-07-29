import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

//Datasource que obtiene datos de la API the moviedb
//Cliente de peticiones HTTP

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieApiKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    final movieDbResponse = MoviesDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
        .where(
          (e) => e.posterPath != 'no-poster',
        ) //Si una pelicula tiene 'no-poster' entonces no entra en el listado de pelis a mostrar
        .map((e) => MovieMapper.movieDbToEntity(e))
        .toList();

    return movies;
  }
}
