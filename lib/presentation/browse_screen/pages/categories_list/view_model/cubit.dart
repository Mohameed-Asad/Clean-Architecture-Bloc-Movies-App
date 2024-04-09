import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/services/web_services.dart';
import 'package:movies_project/data/data_source/categorylist_data_source/categorylist_data_source.dart';
import 'package:movies_project/data/data_source/categorylist_data_source/categorylist_data_source_imp.dart';
import 'package:movies_project/data/repository_imp/categorylist_repository_imp.dart';
import 'package:movies_project/domain/repository/categorylist_repository.dart';
import 'package:movies_project/domain/use_cases/categorylist_use_case.dart';
import 'package:movies_project/presentation/browse_screen/pages/categories_list/view_model/states.dart';

import '../../../../../core/failure/server_failures.dart';

class CategoryListViewModel extends Cubit<CategoryListStates> {
  CategoryListViewModel() : super(LoadingCategoryListState());

  late CategoryListUseCase useCase;
  late CategoryListRepository repository;
  late CategoryListDataSource dataSource;
  final WebService _service = WebService();

  Future<bool> getCategoryList() async {
    emit(LoadingCategoryListState());
    dataSource = CategoryListDataSourceImp(_service.freeDio);
    repository = CategoryListRepositoryImp(dataSource);
    useCase = CategoryListUseCase(repository);
    final result = await useCase.execute();
    return result.fold((fail) {
      var error = fail as ServerFailure;
      emit(ErrorCategoryListState());
      return Future.value(false);
    }, (data) {
      emit(SuccessCategoryListState(data));
      return Future.value(true);
    });
  }
}
