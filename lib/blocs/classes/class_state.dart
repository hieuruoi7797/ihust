part of 'class_bloc.dart';

class ClassState {
  final bool isLoading;
  final APIError error;
  final List<Class> classes;
  final Map<int,List<Class>> mapScholarYear;
  ClassState({this.classes, this.error, this.isLoading, this.mapScholarYear});
  factory ClassState.init() {
    return ClassState(
        isLoading: false, error: null, classes: new List<Class>(), mapScholarYear: new Map());
  }
  ClassState update({bool isLoading, APIError error, List<Class> classes , Map<int,List<Class>> mapScholarYear}) {
    return copyWith(this, isLoading: isLoading, error: error, classes: classes, mapScholarYear: mapScholarYear);
  }

  ClassState copyWith(ClassState source,
      {bool isLoading, APIError error, List<Class> classes, Map<int,List<Class>> mapScholarYear}) {
        return ClassState(
          error: error,
          isLoading: isLoading,
          classes: classes ?? source.classes,
          mapScholarYear : mapScholarYear ?? source.mapScholarYear
        );
      }
}
