import 'package:equatable/equatable.dart';

abstract class ProjectsEvent extends Equatable {
  const ProjectsEvent();
}

class LoadProjectBySessionId extends ProjectsEvent {

  LoadProjectBySessionId();
  @override
  List<Object> get props => [];
  @override
  String toString(){
    return "LoadProjectBySessionId: ";
  }
}
