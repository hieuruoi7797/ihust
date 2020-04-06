import 'package:equatable/equatable.dart';

abstract class InformationEvent extends Equatable {
  const InformationEvent();
}

class LoadInforBySessionId extends InformationEvent {
  final String sessionId;
  LoadInforBySessionId({this.sessionId});
  @override
  List<Object> get props => [sessionId];
  @override
  String toString(){
    return "LoadInforBySessionId: $sessionId";
  }
}
