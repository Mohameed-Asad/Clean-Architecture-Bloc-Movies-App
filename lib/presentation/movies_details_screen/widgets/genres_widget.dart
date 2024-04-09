import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/domain/entities/genres_model.dart';

class GenresWidget extends StatelessWidget {
  final GenresModel genres;

  const GenresWidget({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFF514F4F), width: 2)),
      padding: const EdgeInsets.all(4),
      child: Text(
        genres.name,
        style: Constants.theme.textTheme.displaySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
