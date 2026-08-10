import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final color = Theme.of(context).colorScheme;
    final titleStlye = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: color.primary),
              const SizedBox(width: 5),
              Text('Cinemapedia', style: titleStlye),
              const Spacer(),
              IconButton(
                onPressed: () {
                  final movieRepository = ref.read(movieRepositoryProvider);
                  final searchQuery = ref.read(searchQueryProvider);
                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                      searchMovieCallback: (query) {
                        ref
                            .read(searchQueryProvider.notifier)
                            .update((state) => query);
                        return movieRepository.searchMovies(query);
                      },
                    ),
                  ).then((movie) {
                    if (movie == null) return;
                    if (context.mounted) {
                      context.push('/movie/${movie.id}');
                    }
                  });
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
