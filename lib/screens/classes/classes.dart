import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihust/blocs/classes/class_bloc.dart';
import 'package:flutter_tableview/flutter_tableview.dart';
import 'package:ihust/components/custom_dialog.dart';
import 'package:ihust/models/Class.dart';

part 'classes_view.dart';
part 'class_detail_screen.dart';
class ClassesListScreen extends StatefulWidget {
  final String userId;
  ClassesListScreen({Key key, this.userId}) : super(key: key);

  @override
  _ClassesListScreenState createState() => _ClassesListScreenState();
}

class _ClassesListScreenState extends State<ClassesListScreen> {
  ClassBloc classBloc;
  String get userId => widget.userId ?? -1;

  @override
  void initState() {
    classBloc = BlocProvider.of<ClassBloc>(context);
    classBloc.add(LoadClassesByStudentId(userId: userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClassBloc, ClassState>(
      bloc: classBloc,
      listener: (context, state) {
      },
      child: BlocBuilder<ClassBloc, ClassState>(
        bloc: classBloc,
        builder: (context, state) {
          //  print("Vl" + state.toString());
          //   return Container(child: null, color: Colors.red);
          if ( state.classes.isNotEmpty) {

           
            return ClassessView(userId: userId, mapScholarYear: state.mapScholarYear);
          } else if (state.isLoading) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Danh sach lop hoc"),
              ),
              body: CircularProgressIndicator(
                strokeWidth: .7,
              ),
            );
          } else {
            return Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
