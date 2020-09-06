import 'package:equatable/equatable.dart';
import 'package:ihust/models/Project.dart';
import 'package:ihust/models/Student.dart';
import 'package:ihust/models/Teacher.dart';
import 'package:ihust/utils/services.dart';

class ProjectState {
  final List<Project> projects;
  final bool isLoading;
  final APIError error;
  ProjectState({this.projects, this.error, this.isLoading});

  factory ProjectState.init() {
    return ProjectState(
        projects: new List<Project>(), isLoading: false, error: null);
  }

  ProjectState update(
      {List<Project> projects,
      APIError error,
      bool isLoading,
     }) {
    return copyWith(this,
        projects: projects, error: error, isLoading: isLoading);
  }

  ProjectState copyWith(ProjectState oldState,
      {List<Project> projects, APIError error, bool isLoading}) {
    return ProjectState(
        projects: projects ?? oldState.projects,
        error: error,
        isLoading: isLoading,
    );
  }
}
