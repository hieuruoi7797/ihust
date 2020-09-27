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
                  body: showProjects(state.projects));
            } else if (state.isLoading) {
              return Scaffold(
                  appBar: AppBar(
                    title: Text('Thông tin đồ án'),
                  ),
                  body: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: .7,
                    ),
                  ));
            } else {
              return Center(child: Text("Error"));
            }
          },
        ));
  }
}

Widget showProjects(List<Project> projects) {
  return Wrap(spacing: 8.0, runSpacing: 4.0, children: <Widget>[
//    ListView.builder(
//      itemBuilder: (BuildContext context, int index) {
    Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 32,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(8),
                child: Text(projects[0].projectName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                    )),
              ),
              new Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  height: 32,
                  child: Text("GV Hướng dẫn: " + projects[0].teacherName)),
              new Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  height: 32,
                  child: Text("Tên đồ án: " + projects[0].projectTitle)),
              new Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  height: 32,
                  child: Text("Kì học: " + projects[0].semester)),
              new Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  height: 32,
                  child: Text("Mô tả: " + projects[0].projectDescription)),
              new Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  height: 32,
                  child: Text("Mã lớp: " + projects[0].classId)),
              new Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  height: 32,
                  child: Text("Mã môn học: " + projects[0].courseId)),
            ]))
  ]);
//      },
//      padding: EdgeInsets.all(8),
//      itemCount: projects.length,
}
