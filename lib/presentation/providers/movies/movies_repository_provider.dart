import 'package:cinemapedia/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_respository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Provider de solo lectura
final movieRepositoryProvider = Provider((ref) {
  return MovieRespositoryImpl(datasource: MoviedbDatasource());
});
