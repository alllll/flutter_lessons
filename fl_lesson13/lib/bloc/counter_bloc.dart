import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';
part 'counter_bloc.g.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(_Initial()) {
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
