import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/services/web_services.dart';
import 'package:movies_project/data/data_source/details_data_source/details_data_source.dart';
import 'package:movies_project/data/data_source/details_data_source/details_data_source_imp.dart';
import 'package:movies_project/data/repository_imp/details_repository_imp.dart';
import 'package:movies_project/domain/repository/details_repository.dart';
import 'package:movies_project/domain/use_cases/details_use_case.dart';
import 'package:movies_project/presentation/movies_details_screen/view_model/states.dart';

import '../../../core/failure/server_failures.dart';

class DetailsViewModel extends Cubit<DetailsStates> {
  DetailsViewModel() : super(LoadingDetailsStates());

  late DetailsUseCase useCase;
  late DetailsRepository repository;
  late DetailsDataSource dataSource;
  final WebService _service = WebService();

  Future<bool> getMovieDetails(int movieId) async {
    emit(LoadingDetailsStates());
    dataSource = DetailsDataSourceImp(_service.freeDio);
    repository = DetailsRepositoryImp(dataSource);
    useCase = DetailsUseCase(repository);
    final result = await useCase.execute(movieId);
    return result.fold((fail) {
      var error = fail as ServerFailure;
      emit(ErrorDetailsStates());
      return Future.value(false);
    }, (data) {
      emit(SuccessDetailsStates(data));
      return Future.value(true);
    });
  }
}
