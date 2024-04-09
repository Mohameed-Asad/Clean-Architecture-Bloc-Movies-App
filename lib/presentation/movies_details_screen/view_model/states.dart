import 'package:movies_project/domain/entities/details_model.dart';

sealed class DetailsStates {}

class LoadingDetailsStates extends DetailsStates {}

class SuccessDetailsStates extends DetailsStates {
  final DetailsModel detailsModel;

  SuccessDetailsStates(this.detailsModel);
}

class ErrorDetailsStates extends DetailsStates {}
