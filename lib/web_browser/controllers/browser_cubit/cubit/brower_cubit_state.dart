part of 'brower_cubit_cubit.dart';

abstract class BroswerCubitState extends Equatable {
  const BroswerCubitState();

  @override
  List<Object> get props => [];
}

class BroswerCubitLoadingState extends BroswerCubitState {}

class BroswerCubitSuccessState extends BroswerCubitState {}

class BroswerCubitFailedState extends BroswerCubitState {}
