import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/failure/server_failures.dart';
import 'package:movies_project/core/services/web_services.dart';
import 'package:movies_project/data/data_source/popular_data_source/popular_data_source.dart';
import 'package:movies_project/data/data_source/popular_data_source/popular_data_source_imp.dart';
import 'package:movies_project/data/repository_imp/popular_repository_imp.dart';
import 'package:movies_project/domain/repository/popular_repository.dart';
import 'package:movies_project/domain/use_cases/popular_use_case.dart';
import 'package:movies_project/presentation/home_screen/pages/popular_movies/view_model/states.dart';

class PopularViewModel extends Cubit<PopularStates> {
  PopularViewModel() : super(LoadingPopularState());

  late GetPopularUseCase popularUseCase;
  late PopularRepository popularRepository;
  late PopularDataSource popularDataSource;
  final WebService _service = WebService();

  Future<bool> getPopularMovies() async {
    emit(LoadingPopularState());
    popularDataSource = PopularDataSourceImp(_service.freeDio);
    popularRepository = PopularRepositoryImp(popularDataSource);
    popularUseCase = GetPopularUseCase(popularRepository);
    final result = await popularUseCase.execute();
    return result.fold((fail) {
      var error = fail as ServerFailure;
      emit(ErrorPopularState());
      return Future.value(false);
    }, (data) {
      emit(SuccessPopularState(data));
      return Future.value(true);
    });
  }
}
