import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/services/web_services.dart';
import 'package:movies_project/data/data_source/similar_data_source/similar_data_source.dart';
import 'package:movies_project/data/data_source/similar_data_source/similar_data_source_imp.dart';
import 'package:movies_project/data/repository_imp/similar_repository_imp.dart';
import 'package:movies_project/domain/repository/similar_repository.dart';
import 'package:movies_project/domain/use_cases/similar_use_case.dart';
import 'package:movies_project/presentation/movies_details_screen/view_model/view_model_similar/states_similar.dart';

import '../../../../core/failure/server_failures.dart';

class SimilarViewModel extends Cubit<SimilarStates> {
  SimilarViewModel() : super(LoadingSimilarState());

  late SimilarUseCase useCase;
  late SimilarRepository repository;
  late SimilarDataSource dataSource;
  final WebService _service = WebService();

  Future<bool> getSimilarMovies(int movieId) async {
    emit(LoadingSimilarState());
    dataSource = SimilarDataSourceImp(_service.freeDio);
    repository = SimilarRepositoryImp(dataSource);
    useCase = SimilarUseCase(repository);
    final result = await useCase.execute(movieId);
    return result.fold((fail) {
      var error = fail as ServerFailure;
      emit(ErrorSimilarState());
      return Future.value(false);
    }, (data) {
      emit(SuccessSimilarState(data));
      return Future.value(true);
    });
  }
}
