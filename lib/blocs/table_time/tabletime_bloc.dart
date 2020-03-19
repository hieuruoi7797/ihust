import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabletime_event.dart';
part 'tabletime_state.dart';

class TabletimeBloc extends Bloc<TabletimeEvent, TabletimeState> {
  @override
  TabletimeState get initialState => TabletimeInitial();

  @override
  Stream<TabletimeState> mapEventToState(
    TabletimeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
