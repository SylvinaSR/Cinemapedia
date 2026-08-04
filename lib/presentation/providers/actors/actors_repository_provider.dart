import 'package:cinemapedia/infraestructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/actors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Provider de solo lectura
final actorsRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl(datasource: ActorMoviedbDatasource());
});
