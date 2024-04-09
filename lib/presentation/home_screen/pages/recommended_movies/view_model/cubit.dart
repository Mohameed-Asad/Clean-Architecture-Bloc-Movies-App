import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/services/web_services.dart';
import 'package:movies_project/data/data_source/recommended_data_source/recommended_data_source.dart';
import 'package:movies_project/data/data_source/recommended_data_source/recommended_data_source_imp.dart';
import 'package:movies_project/data/repository_imp/recommended_repository_imp.dart';
import 'package:movies_project/domain/repository/recommended_repository.dart';
import 'package:movies_project/domain/use_cases/recommended_use_case.dart';
import 'package:movies_project/presentation/home_screen/pages/recommended_movies/view_model/states.dart';

import '../../../../../core/failure/server_failures.dart';

class RecommendedViewModel extends Cubit<RecommendedStates> {
  RecommendedViewModel() : super(LoadingRecommendedState());

  late RecommendedUseCase useCase;
  late RecommendedRepository repository;
  late RecommendedDataSource dataSource;
  final WebService _service = WebService();

  Future<bool> getRecommendedMovies() async {
    emit(LoadingRecommendedState());
    dataSource = RecommendedDataSourceImp(_service.freeDio);
    repository = RecommendedRepositoryImp(dataSource);
    useCase = RecommendedUseCase(repository);
    final result = await useCase.execute();
    return result.fold((fail) {
      var error = fail as ServerFailure;
      emit(ErrorRecommendedState());
      return Future.value(false);
    }, (data) {
      emit(SuccessRecommendedState(data));
      return Future.value(true);
    });
  }
}
