import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/data/data_source/watchlist_data_source/watchlist_data_source.dart';
import 'package:movies_project/data/data_source/watchlist_data_source/watchlist_data_source_imp.dart';
import 'package:movies_project/data/repository_imp/watchlist_repository_imp.dart';
import 'package:movies_project/domain/repository/watchlist_repository.dart';
import 'package:movies_project/domain/use_cases/watchlist_data_use_case.dart';
import 'package:movies_project/presentation/watchlist_screen/view_model/states.dart';

import '../../../core/failure/server_failures.dart';

class WatchListViewModel extends Cubit<WatchListStates> {
  WatchListViewModel() : super(LoadingWatchList());

  late GetWatchListDataUseCase useCase;
  late WatchListRepository repository;
  late WatchListDataSource dataSource;

  Future<bool> getWatchListData() async {
    dataSource = WatchListDataSourceImp();
    repository = WatchListRepositoryImp(dataSource);
    useCase = GetWatchListDataUseCase(repository);
    final watchList = await useCase.execute();
    return watchList.fold((fail) {
      var error = fail as ServerFailure;
      emit(ErrorWatchList());
      return Future.value(false);
    }, (data) {
      emit(SuccessGetWatchList(data));
      return Future.value(true);
    });
  }
}
