import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDB movieDb) => Movie(
    adult: movieDb.adult,
    backdropPath: movieDb.backdropPath != ''
        ? 'https://image.tmdb.org/t/p/w500/${movieDb.backdropPath}'
        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8PgItrmj9SWhclDBAmjlyFsC4w9tEKTcvDTbc2puQtQ&s',
    genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
    id: movieDb.id,
    originalLanguage: movieDb.originalLanguage,
    originalTitle: movieDb.originalTitle,
    overview: movieDb.overview,
    popularity: movieDb.popularity,
    posterPath: movieDb.posterPath != ''
        ? 'https://image.tmdb.org/t/p/w500/${movieDb.posterPath}'
        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8PgItrmj9SWhclDBAmjlyFsC4w9tEKTcvDTbc2puQtQ&s',
    releaseDate: movieDb.releaseDate != null ? movieDb.releaseDate! : DateTime.now(),
    title: movieDb.title,
    video: movieDb.video,
    voteAverage: movieDb.voteAverage,
    voteCount: movieDb.voteCount,
  );

  static Movie movieDetailDbToEntity(MovieDetails movieDetail) => Movie(
    adult: movieDetail.adult,
    backdropPath: movieDetail.backdropPath != ''
        ? 'https://image.tmdb.org/t/p/w500/${movieDetail.backdropPath}'
        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8PgItrmj9SWhclDBAmjlyFsC4w9tEKTcvDTbc2puQtQ&s',
    genreIds: movieDetail.genres.map((e) => e.name).toList(),
    id: movieDetail.id,
    originalLanguage: movieDetail.originalLanguage,
    originalTitle: movieDetail.originalTitle,
    overview: movieDetail.overview,
    popularity: movieDetail.popularity,
    posterPath: movieDetail.posterPath != ''
        ? 'https://image.tmdb.org/t/p/w500/${movieDetail.posterPath}'
        : 'no-poster',
    releaseDate: movieDetail.releaseDate,
    title: movieDetail.title,
    video: movieDetail.video,
    voteAverage: movieDetail.voteAverage,
    voteCount: movieDetail.voteCount,
  );
}
