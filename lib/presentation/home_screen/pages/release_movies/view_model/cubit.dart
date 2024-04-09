import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/failure/server_failures.dart';
import 'package:movies_project/core/services/web_services.dart';
import 'package:movies_project/data/data_source/release_data_source/release_data_source.dart';
import 'package:movies_project/data/data_source/release_data_source/release_data_source_imp.dart';
import 'package:movies_project/data/repository_imp/release_repository_imp.dart';
import 'package:movies_project/domain/repository/release_repository.dart';
import 'package:movies_project/domain/use_cases/release_use_case.dart';
import 'package:movies_project/presentation/home_screen/pages/release_movies/view_model/states.dart';

class ReleaseViewModel extends Cubit<ReleaseStates> {
  ReleaseViewModel() : super(LoadingReleaseStates());

  late GetReleaseUseCase useCase;
  late ReleaseRepository repository;
  late ReleaseDataSource dataSource;
  final WebService _service = WebService();

  Future<bool> getReleaseMovies() async {
    emit(LoadingReleaseStates());
    dataSource = ReleaseDataSourceImp(_service.freeDio);
    repository = ReleaseRepositoryImp(dataSource);
    useCase = GetReleaseUseCase(repository);
    final result = await useCase.execute();
    return result.fold((fail) {
      var error = fail as ServerFailure;
      emit(ErrorReleaseStates());
      return Future.value(false);
    }, (data) {
      emit(SuccessReleaseStates(data));
      return Future.value(true);
    });
  }
}
