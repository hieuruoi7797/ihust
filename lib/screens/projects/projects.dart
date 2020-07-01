import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihust/blocs/projects/projects_bloc.dart';
import 'package:ihust/blocs/projects/projects_event.dart';
import 'package:ihust/blocs/projects/projects_state.dart';
import 'package:ihust/blocs/table_time/tabletime_bloc.dart';
import 'package:ihust/models/Project.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<ProjectsScreen> {
  ProjectBloc projectBloc;

  @override
  void initState() {
    projectBloc = BlocProvider.of<ProjectBloc>(context);
    projectBloc.add(LoadProjectBySessionId());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectBloc, ProjectState>(
        bloc: projectBloc,
        listener: (context, state) {},
        child: BlocBuilder<ProjectBloc, ProjectState>(
          bloc: projectBloc,
          builder: (context, state) {
            if (state.projects.isNotEmpty) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Thông tin đồ án"),
                ),
                  body: showProjects(state.projects)
              );
            } else if (state.isLoading) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Thông tin đồ án'),
                ),
                body: CircularProgressIndicator(
                  strokeWidth: .7,
                ),
              );
            } else {
              return Center(child: Text("Error"));
            }
          },
        ));
  }

}
Container showProjects(List<Project> projects) {}
