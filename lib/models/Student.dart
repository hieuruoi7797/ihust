import 'package:ihust/config.dart';
import 'package:ihust/models/Class.dart';

class Student {
  int id;
  //  int teacherId = Config.NULL_ID;
  String studentId = Config.TEXT_EMPTY;
  int birthday = Config.NULL_ID;
  String studentYear = Config.TEXT_EMPTY;
  int gender = 1;
  String phoneNumber = Config.TEXT_EMPTY;
  String englishInfo = Config.TEXT_EMPTY;
  int cpa = Config.NULL_ID;
  String email = Config.TEXT_EMPTY;
  String cvUrl = Config.TEXT_EMPTY;
  String className = Config.TEXT_EMPTY;
  int studyMode = 0;
  int classId = Config.NULL_ID; //Mã lớp
  String relatedClassId = Config.NULL_TXT; //Mã lớp kèm
  String courseId = Config.NULL_TXT; //Mã HP
  String fullName = Config.NULL_TXT;
  int departmentId = Config.NULL_ID; //0: CNPM, 1: HTTT, 2: KHMT
  String departmentName = Config.NULL_TXT; //0: CNPM, 1: HTTT, 2: KHMT
  //  int teacherDepartmentId = Config.NULL_ID;			//0: CNPM, 1: HTTT, 2: KHMT
  //  String teacherDepartmentName = Config.NULL_TXT;					//0: CNPM, 1: HTTT, 2: KHMT
  int programId = Config.NULL_ID; //4 is id of DHCQ
  String teacherName = Config.NULL_TXT;
  int majorId = Config.NULL_ID;
  int needTN = -1;
  int gdType = -1;
  String courseName = Config.NULL_TXT;
  String classType = Config.NULL_TXT; //LT+BT, TN, ...
  String notes = Config.NULL_TXT;
  String teacherNotes = Config.NULL_TXT;
  String info = Config.NULL_TXT; //K58, KSTN, ...
  String semesterType = "AB"; //A, B, AB
  String calendarInfo = Config.NULL_TXT; //Raw calendar Info
  List<String> calendars = new List<String>();
  List<String> updateNotes = new List<String>();
  String semester = Config.NULL_TXT; //20151, 20152, 20153
  int scholarYear = 0; //2015, 2016, 2017
  int paymentType = Config.PAYMENT_TYPE_1A; //A, B
  int status = Config.STATUS_UNDEFINED; //0: waiting, 1: suggested, 2: confirmed
  int notification = Config.NOTIFY_NOT_YET;
  int beginDate = Config.NULL_ID;
  int finishDate = Config.NULL_ID;
  int studentNum = 0;
  int rootId = Config.NULL_ID;
  int tmpState = -1;
  String studentNumRange = Config.NULL_TXT;
  String creditInfo = Config.NULL_TXT;
  String gdCreditInfo = Config.NULL_TXT;
  double kHd = 0;
  String language = Config.NULL_TXT;
  String roomSize = Config.NULL_TXT;
  int createdDate = Config.NULL_ID;
  int lastUpdate = Config.NULL_ID;
  List<int> teacherIds = new List<int>();
  int privacy = Config.PRIVACY_PUBLIC;
  List<String> relatedClassIds = new List<String>();
  List<int> lastUpdateUserId = new List<int>();

  // List<TeacherCourse> teacherCourses = new List<TeacherCourse>();
  // List<ExamInfo> examInfos = new List<ExamInfo>();
  // List<ClassInfo> timePlaces = new List<ClassInfo>();
  int posIndex = 0;
  bool isSelected = false;
  List<Class> issueClasses = new List<Class>();
  List<int> removedTeacherIds = new List<int>();
  // ActivityLog activityLog = null;
  // EducationUnit rootUnit = null;
  // Course course = null;
  // List<CourseMember> members = null;
  Student(
      {this.id,
      this.studentId,
      this.birthday,
      this.className,
      this.email,
      this.englishInfo,
      this.phoneNumber,
      this.scholarYear,
      this.cpa,
      this.beginDate,
      this.calendarInfo,
      this.calendars,
      this.classId,
      this.classType,
      this.courseId,
      this.courseName,
      this.createdDate,
      this.creditInfo,
      this.departmentId,
      this.departmentName,
      this.finishDate,
      this.gdCreditInfo,
      this.gdType,
      this.info,
      this.isSelected,
      this.issueClasses,
      this.kHd,
      this.language,
      this.lastUpdate,
      this.lastUpdateUserId,
      this.majorId,
      this.fullName,
      this.needTN,
      this.notes,
      this.notification,
      this.paymentType,
      this.posIndex,
      this.privacy,
      this.programId,
      this.relatedClassId,
      this.relatedClassIds,
      this.removedTeacherIds,
      this.roomSize,
      this.rootId,
      this.semester,
      this.semesterType,
      this.status,
      this.studentNum,
      this.studentNumRange,
      this.teacherIds,
      this.teacherName,
      this.teacherNotes,
      this.tmpState,
      this.updateNotes});
  Student.fromJson(Map<String, dynamic> mapStudent) {
    print(mapStudent);
    this.id = mapStudent['id'];
    this.fullName = mapStudent['fullName'];
    this.studentId = mapStudent['studentId'];
    this.birthday = mapStudent['birthdate'];
    this.scholarYear = mapStudent['year'];
    this.email = mapStudent['email'];
    this.phoneNumber = mapStudent['phoneNumber'];
    this.studentYear = mapStudent['studentYear'];
    this.englishInfo = mapStudent['englishInfo'];
    this.classId = mapStudent['classId'];
    this.className = mapStudent['className'];
//    this.cpa = mapStudent['cpa'];
     this.cvUrl = mapStudent['cvUrl'];
    print("xxx");
  }
}
