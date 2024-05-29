import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'brower_cubit_state.dart';

class BroswerCubitCubit extends Cubit<BroswerCubitState> {
  BroswerCubitCubit()
      : super(
          BroswerCubitSuccessState(),
        );

  void setLoadingState() => emit(BroswerCubitLoadingState());
  void setSuccessState() => emit(BroswerCubitSuccessState());
  void setFailedState() => emit(BroswerCubitFailedState());
}
