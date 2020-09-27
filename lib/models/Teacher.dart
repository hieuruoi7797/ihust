import 'package:ihust/config.dart';
import 'package:ihust/models/Class.dart';
import 'package:ihust/models/Project.dart';

class Teacher {
  int id;
  // @FieldDescription("Tên tài khoản")
  String userName = Config.NULL_TXT;
  String password = Config.NULL_TXT;
  // @FieldDescription("Tên đầy đủ")
  String fullName = Config.NULL_TXT;
  // @FieldDescription("Tên")
  String firstName = Config.NULL_TXT;
  // @FieldDescription("Họ")
  String lastName = Config.NULL_TXT;
  String teacherId = Config.NULL_TXT;
  // @FieldDescription("Giới tính")
  int gender = Config.GENDER_MALE;
  int title = Config.NULL_ID;
  int degree = Config.NULL_ID;
  int jobType = Config.NULL_ID;
  int position = Config.NULL_ID; //Position
  int departmentId = Config.NULL_ID; //0: CNPM, 1: HTTT, 2: KHMT
  int rootId = Config.NULL_ID;
  int uniId = Config.NULL_ID;
  int contractType = Config.NULL_ID;
  String semester = Config.NULL_TXT;
  int workMonth = 0;
  String taxNumber = Config.NULL_TXT;
  String notes = Config.NULL_TXT;
  String idNumber = Config.NULL_TXT;
  String idNumberPlace = Config.NULL_TXT;
  int idNumberDate = Config.NULL_ID;
  String assuranceNumber = Config.TEXT_EMPTY;
  int assuranceDate = Config.NULL_ID;
  int hiredDate = Config.NULL_ID;
  String nickName = Config.NULL_TXT;

  String staffCode = Config.NULL_TXT;
  String bankAccount = Config.NULL_TXT;
  String bankInfo = Config.NULL_TXT;
  String website = Config.NULL_TXT;
  // @FieldDescription("Ngày sinh")
  int birthDate = null; //new Date();
  // @FieldDescription("Nơi sinh")
  String birthPlace = Config.NULL_TXT;
  String workEmail = Config.NULL_TXT;
  String personalEmail = Config.NULL_TXT;
  String workPhoneNumber = Config.NULL_TXT;
  String cellPhoneNumber = Config.NULL_TXT;
  List<String> otherEmails = new List<String>();
  List<String> otherPhoneNumbers = new List<String>();
  String workAddress = Config.NULL_TXT;
  String homeAddress = Config.NULL_TXT;
  String residentAddress = Config.NULL_TXT;
  String homeTownAddress = Config.NULL_TXT;
  int partyDate = Config.NULL_ID;
  int marriedStatus = Config.STATUS_FAMILY_UNDEFINED;
  String info = Config.NULL_TXT;
  String facebookToken = Config.NULL_TXT;
  String facebookId = Config.NULL_TXT;
  String facebookName = Config.NULL_TXT;
  String relatedEmail = Config.NULL_TXT;
  int lastLoggedIn = Config.NULL_ID;
  String avatarUrl = Config.NULL_TXT;
  int projectStatus = Config.STATUS_OPENNED;
  List<int> courseIds = new List<int>();
  int activated = 0;
  int status = Config.STAFF_STATUS_NORMAL;
  int lastUpdate = Config.NULL_ID;
  int currentRoleId = -1;
  double pv = 4.0;
  double pvExternal = 0;
  double nc = 8.0;
  double GD = 0.0;
  double kNc = 0.0;
  double kVt = 0.0;
  List<int> roleIds = new List<int>();
  String nation = Config.NULL_TXT;
  String religion = Config.NULL_TXT;
  List<String> docUrls = new List<String>();

  //  List<Role> roles = new List<Role>();
  String sessionId = Config.NULL_TXT;
  List<int> itemIdList = new List<int>();
  List<String> courseList = new List<String>();
  // List<ProjectTopic> projectTopics = new List<ProjectTopic>();
  //  List<ProjectRequest> projectRequests = new List<ProjectRequest>();
  //  List<TeacherQuotas> quotas = new List<TeacherQuotas>();
  //  Map<String, TeacherQuotas> quotasMap = new HashMap<String, TeacherQuotas>();
  //  Role currentRole = null;
  //  EducationUnit rootUnit = null;
  //  EducationUnit parentUnit = null;
  //  List<StaffPosition> staffPositions = new List<StaffPosition>();
  //  List<StaffAward> staffAwards = new List<StaffAward>();
  //  List<SalaryLevel> salaryLevels = new List<SalaryLevel>();
  //  List<Person> relatives = new List<Person>();
  //  List<Training> trainings = new List<Training>();
  //  List<Publication> publications = new List<Publication>();
  List<Class> classes = new List<Class>();
  List<Project> projects = new List<Project>();
  //  EmployeeTitle titleItem = null;
  //  ContractType contractTypeItem = null;
  //  EmployeeTitle degreeItem = null;
  //  EmployeeTitle jobTypeItem = null;
  //  Salary salary = null;
  //  List<ProjectTopic> projectTopics = new List<ProjectTopic>();
  Teacher(
      {this.activated,
      this.assuranceDate,
      this.assuranceNumber,
      this.avatarUrl,
      this.bankAccount,
      this.bankInfo,
      this.birthDate,
      this.birthPlace,
      this.cellPhoneNumber,
      this.classes,
      this.contractType,
      this.courseIds,
      this.courseList,
      this.currentRoleId,
      this.degree,
      this.departmentId,
      this.docUrls,
      this.facebookId,
      this.facebookName,
      this.facebookToken,
      this.firstName,
      this.fullName,
      this.GD,
      this.gender,
      this.hiredDate,
      this.homeAddress,
      this.homeTownAddress,
      this.id,
      this.idNumber,
      this.idNumberDate,
      this.idNumberPlace,
      this.info,
      this.itemIdList,
      this.jobType,
      this.kNc,
      this.kVt,
      this.lastLoggedIn,
      this.lastName,
      this.lastUpdate,
      this.marriedStatus,
      this.nation,
      this.nc,
      this.nickName,
      this.notes,
      this.otherEmails,
      this.otherPhoneNumbers,
      this.partyDate,
      this.password,
      this.personalEmail,
      this.position,
      this.projects,
      this.projectStatus,
      this.pv,
      this.pvExternal,
      this.relatedEmail,
      this.religion,
      this.residentAddress,
      this.roleIds,
      this.rootId,
      this.semester,
      this.sessionId,
      this.staffCode,
      this.status,
      this.taxNumber,
      this.teacherId,
      this.title,
      this.uniId,
      this.userName,
      this.website,
      this.workAddress,
      this.workEmail,
      this.workMonth,
      this.workPhoneNumber});
}
