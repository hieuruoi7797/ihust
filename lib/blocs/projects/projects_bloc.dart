import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:ihust/blocs/projects/projects_state.dart';
import 'package:ihust/models/Project.dart';
import 'package:ihust/models/Student.dart';
import 'package:ihust/utils/services.dart';
import 'package:ihust/utils/utils.dart';

import 'projects_event.dart';

class ProjectBloc extends Bloc<ProjectsEvent,ProjectState> {
  @override
  ProjectState get initialState => ProjectState.init();

  @override
  Stream<ProjectState> mapEventToState(ProjectsEvent event) async* {
    if (event is LoadProjectBySessionId)
      yield* _loadProjectsBySessionId();
  }


  Stream<ProjectState> _loadProjectsBySessionId() async* {
    yield state.update(isLoading: true, error: null);
    APIResult apiResult;
    String sessionId = await ClientUtils.getDeviceDetails();
    AppServices services = new AppServices(
        action: "getprojects&sessionid=$sessionId",
        body: null);
    List<Project> projects = new List();
    try {
      apiResult = await services.get();
      if (apiResult is APISuccess) {
        List<dynamic> res = apiResult.data['data'];
        for (var i = 0; i<res.length; i++){
          Map<String, dynamic> mapProject = res[i];
          Project item = Project.fromJson(mapProject);
          projects.add(item);
        }
        yield state.update(projects: projects);
      } else if (apiResult is APIError) {
        yield state.update(error: apiResult);
      }
    } catch (e) {
      yield state.update(isLoading: false);
    }
  }
}