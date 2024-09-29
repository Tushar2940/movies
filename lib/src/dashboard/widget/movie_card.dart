import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/extension/string_date_extension.dart';
import 'package:movies/core/res/media/movie_media.dart';
import 'package:movies/src/dashboard/model/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback onTap;

  const MovieCard({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: AspectRatio(
              aspectRatio: 0.7,
              child: CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                placeholder: (context, url) => Container(
                  color: Colors.grey[300],
                ),
                errorWidget: (context, url, error) => Image.asset(
                  MovieMedia.noPoster,
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            movie.title ?? '',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle().copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            movie.releaseDate!.toFormattedDate(),
            style: const TextStyle().copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}