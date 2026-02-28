import 'package:equatable/equatable.dart';

sealed class FakeLoaderEvent extends Equatable {
  const FakeLoaderEvent();

  @override
  List<Object?> get props => [];
}

class StartFakeLoadingEvent extends FakeLoaderEvent {
  const StartFakeLoadingEvent({
    this.durationSeconds = 2, // Default duration for the fake loading
  });

  final int durationSeconds; // Duration for the fake loading in seconds
}
