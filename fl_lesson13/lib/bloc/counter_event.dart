part of 'counter_bloc.dart';

@freezed
class CounterEvent with _$CounterEvent {
  const factory CounterEvent.started() = _Started;
  const factory CounterEvent.finished() = _Finished;
}
