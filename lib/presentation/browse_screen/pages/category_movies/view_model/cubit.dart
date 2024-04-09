import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/services/web_services.dart';
import 'package:movies_project/data/data_source/category_movies_data_source/category_movies_data_source.dart';
import 'package:movies_project/data/data_source/category_movies_data_source/category_movies_data_source_imp.dart';
import 'package:movies_project/data/repository_imp/category_movies_repository_imp.dart';
import 'package:movies_project/domain/repository/category_movies_repository.dart';
import 'package:movies_project/domain/use_cases/category_movies_use_case.dart';
import 'package:movies_project/presentation/browse_screen/pages/category_movies/view_model/states.dart';

import '../../../../../core/failure/server_failures.dart';

class CategoryMoviesViewModel extends Cubit<CategoryMoviesStates> {
  CategoryMoviesViewModel() : super(LoadingMoviesStates());
  late CategoryMoviesUseCase useCase;
  late CategoryMoviesRepository repository;
  late CategoryMoviesDataSource dataSource;
  final WebService _service = WebService();

  Future<bool> getCategoryMovies(String genresId) async {
    emit(LoadingMoviesStates());
    dataSource = CategoryMoviesDataSourceImp(_service.freeDio);
    repository = CategoryMoviesRepositoryImp(dataSource);
    useCase = CategoryMoviesUseCase(repository);
    final result = await useCase.execute(genresId);
    return result.fold((fail) {
      var error = fail as ServerFailure;
      emit(ErrorMoviesStates());
      return Future.value(false);
    }, (data) {
      emit(SuccessMoviesStates(data));
      return Future.value(true);
    });
  }
}
