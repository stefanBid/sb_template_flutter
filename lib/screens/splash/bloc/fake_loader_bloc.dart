import 'package:flutter_bloc/flutter_bloc.dart';
import 'fake_loader_event.dart';
import 'fake_loader_state.dart';

class FakeLoaderBloc extends Bloc<FakeLoaderEvent, FakeLoaderState> {
  FakeLoaderBloc() : super(const FakeLoaderInitialState()) {
    on<StartFakeLoadingEvent>(_onStartFakeLoading);
  }

  Future<void> _onStartFakeLoading(
    StartFakeLoadingEvent event,
    Emitter<FakeLoaderState> emit,
  ) async {
    emit(const FakeLoaderLoadingState());
    await Future.delayed(
      Duration(seconds: event.durationSeconds),
    ); // Simulate loading delay
    emit(const FakeLoaderCompletedState());
  }
}
