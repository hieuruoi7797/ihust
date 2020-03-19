import 'dart:convert';

class Class {
  int id;
  String classId;
  String courseId;
  String name;
  int departmentId;
  int programId;
  int teachingType;
  String courseName;
  String classType;
  String info;
  String semesterType;
  String classUrl;
  String calendarInfo;
  String semester;
  int scholarYear;
  int status;
  int notification;
  int studentNum;
  int rootId;
  String studentNumRange;
  String creditInfo;
  int createdDate;
  int lastUpdate;
  List<int> teacherIds;
  Class(
      {this.calendarInfo,
      this.classId,
      this.classType,
      this.classUrl,
      this.courseId,
      this.courseName,
      this.createdDate,
      this.creditInfo,
      this.departmentId,
      this.id,
      this.info,
      this.lastUpdate,
      this.name,
      this.notification,
      this.programId,
      this.rootId,
      this.scholarYear,
      this.semester,
      this.semesterType,
      this.status,
      this.studentNum,
      this.studentNumRange,
      this.teacherIds,
      this.teachingType});
  Class.fromJS(Map<String, dynamic> map) {
    // print(map);
    this.calendarInfo = map['calendarInfo'];

    this.classId = map['classId'];
    this.classType = map['classType'];

    this.classUrl = map['classUrl'];
    this.courseId = map['courseId'];

    this.courseName = map['courseName'];
    this.createdDate = map['createdDate'];
    this.creditInfo = map['creditInfo'];
    this.departmentId = map['departmentId'];

    this.id = map['id'];
    this.info = map['info'];
    this.lastUpdate = map['lastUpdate'];
    this.name = map['name'];
    this.notification = map['notification'];
    this.programId = map['programId'];
    this.rootId = map['rootId'];

    this.scholarYear = map['scholarYear'];
    this.semester = map['semester'];
    this.semesterType = map['semesterType'];
    this.status = map['status'];
    this.studentNum = map['studentNum'];
    this.studentNumRange = map['studentNumRange'];
    // this.teacherIds = json.decode(map['teacherIds']).cast<int>();
    this.teachingType = map['teachingType'];
  }
}
