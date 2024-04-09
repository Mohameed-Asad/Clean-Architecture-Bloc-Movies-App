import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/services/web_services.dart';
import 'package:movies_project/data/data_source/search/search_data_source.dart';
import 'package:movies_project/data/data_source/search/search_data_source_imp.dart';
import 'package:movies_project/data/repository_imp/search_repository_imp.dart';
import 'package:movies_project/domain/repository/search_repository.dart';
import 'package:movies_project/domain/use_cases/search_use_case.dart';
import 'package:movies_project/presentation/search_screen/view_model/states.dart';

import '../../../core/failure/server_failures.dart';

class SearchViewModel extends Cubit<SearchStates> {
  SearchViewModel() : super(LoadingSearchState());

  late SearchUseCase useCase;
  late SearchRepository repository;
  late SearchDataSource dataSource;
  final WebService _service = WebService();

  Future<bool> getSearchList(String query) async {
    emit(LoadingSearchState());
    dataSource = SearchDataSourceImp(_service.freeDio);
    repository = SearchRepositoryImp(dataSource);
    useCase = SearchUseCase(repository);
    final result = await useCase.execute(query);
    return result.fold((fail) {
      var error = fail as ServerFailure;
      emit(ErrorSearchState());
      return Future.value(false);
    }, (data) {
      emit(SuccessSearchState(data));
      return Future.value(true);
    });
  }
}
