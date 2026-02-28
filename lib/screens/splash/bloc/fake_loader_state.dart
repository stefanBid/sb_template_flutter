import 'package:equatable/equatable.dart';

sealed class FakeLoaderState extends Equatable {
  const FakeLoaderState();

  @override
  List<Object?> get props => [];
}

class FakeLoaderInitialState extends FakeLoaderState {
  const FakeLoaderInitialState();
}

class FakeLoaderLoadingState extends FakeLoaderState {
  const FakeLoaderLoadingState();
}

class FakeLoaderCompletedState extends FakeLoaderState {
  const FakeLoaderCompletedState();
}
