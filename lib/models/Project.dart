import '../config.dart';

class Project {
  int id;
  String teacherName = Config.NULL_TXT;
  String courseId = Config.NULL_TXT;
  String semester = Config.NULL_TXT;
  String classId = Config.NULL_TXT;
  String projectName = Config.NULL_TXT;
  String projectTitle = Config.NULL_TXT;
  String projectDescription = Config.NULL_TXT;

  Project(this.id, this.teacherName, this.courseId, this.classId, this.semester,
      this.projectName, this.projectTitle, this.projectDescription);

  Project.fromJson(Map<String, dynamic> mapProject) {
    print(mapProject);
    this.id = mapProject['id'];
    this.teacherName = mapProject['teacherName'];
    this.courseId = mapProject['courseId'];
    this.classId = mapProject['classId'];
    this.semester = mapProject['semester'];
    this.projectName = mapProject['projectName'];
    this.projectTitle = mapProject['projectTitle'];
    this.projectDescription = mapProject['projectDescription'];
  }
}
