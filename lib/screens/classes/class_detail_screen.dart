

part of 'classes.dart';
class ClassDetailScreen extends StatefulWidget {
  final Class userClass;
  ClassDetailScreen({this.userClass});
  @override
  _ClassDetailScreenState createState() => _ClassDetailScreenState();
}

class _ClassDetailScreenState extends State<ClassDetailScreen> {
  Class get userClass => widget.userClass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userClass.courseId),
      ),
    );
  }
}