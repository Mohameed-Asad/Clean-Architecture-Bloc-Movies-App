import 'package:dartz/dartz.dart';
import 'package:movies_project/core/failure/server_failures.dart';
import 'package:movies_project/data/data_source/watchlist_data_source/watchlist_data_source.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';
import 'package:movies_project/domain/repository/watchlist_repository.dart';

import '../../core/failure/failure.dart';

class WatchListRepositoryImp implements WatchListRepository {
  final WatchListDataSource dataSource;

  WatchListRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, List<AllMoviesModel>>> getWatchList() async {
    try {
      var collectionRef = dataSource.getCollectionRef();
      var data = await collectionRef.get();
      return Right(data.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left(
        ServerFailure(error: e.toString()),
      );
    }
  }
}

// Stream Data ( didn't work )
//   @override
//   Future<Either<Failure, List<AllMoviesModel?>>> getWatchList() async {
//     try {
//       var collectionRef = dataSource.getCollectionRef();
//       var data = collectionRef.doc().snapshots();
//       var dd = await data.map((e) => e.data()).toList();
//       return Right(dd);
//     } catch (e) {
//       return Left(
//         ServerFailure(error: e.toString()),
//       );
//     }
//   }
// }
