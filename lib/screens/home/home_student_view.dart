part of 'home_screen.dart';

class HomeViewStudent extends StatefulWidget {
  final Student user;
  HomeViewStudent({this.user});
  @override
  _HomeViewStudentState createState() => _HomeViewStudentState();
}

class _HomeViewStudentState extends State<HomeViewStudent> {
  Student get user => widget.user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://storage.googleapis.com/hust-files/images/hust-banner-01_1.2m.png",
                    fit: BoxFit.fill,
                  )),
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            Card(
              elevation: 0,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child:
                          Text('Họ tên: ${user.fullName} - ${user.studentId}'),
                    ),
                    Container(
                      child: Text(
                          'Khoá : ${user.studentYear} - ${user.scholarYear} '),
                    ),
                    Container(
                      child: Text('Lớp: ${user.className}'),
                    ),
                    // Container(
                    //   child: Text('SDT: ${user.phoneNumber} - ${user.email}'),
                    // ),
                    Container(
                      child: Text(
                          'Trạng thái học : Đang học - Trình độ tiếng anh: ${user.englishInfo} '),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 440,
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return buildHomeItem(index: index, itemClicked: _gotoScreen);
                },
              ),
            ),
            Card(
              elevation: 0,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                          'HỆ THỐNG DO TRƯỜNG ĐẠI HỌC BÁCH KHOA HÀ NỘI THIẾT KẾ & PHÁT TRIỂN.'),
                    ),
                    Container(
                      child: Text(
                          'Để hỗ trợ vui lòng gửi mail đến hung.nguyenthanh2@hust.edu.vn'),
                    ),
                    Container(
                      child: Text('Hotline: 09.77.86.33.11'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _gotoScreen(int index) {
    switch (index) {
      case 3:
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => ClassesListScreen(userId: user.studentId)));
        break;
      case 2:
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return RichAlertDialog(
                alertTitle: richTitle("BUG CỦA THẦY!"),
                alertSubtitle: richSubtitle("API sai nên chưa làm thầy ạ"),
                alertType: RichAlertType.ERROR,
                actions: <Widget>[
                  FlatButton(
                    color: Colors.blueAccent,
                    child: Text("Đã nhớ :D"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
        break;
      default:
       showDialog(
            context: context,
            builder: (BuildContext context) {
              return RichAlertDialog(
                alertTitle: richTitle("Features comming soon!"),
                alertSubtitle: richSubtitle("E đang nghĩ !"),
                alertType: RichAlertType.WARNING,
                actions: <Widget>[
                  FlatButton(
                    color: Colors.blueAccent,
                    child: Text("Đã nhớ :D"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
            break;
    }
  }

  Widget buildHomeItem({int index, Function itemClicked}) {
    String title = "";
    IconData icon;
    switch (index) {
      case 0:
        title = "Tin tức, thông báo";
        icon = Icons.new_releases;
        break;
      case 1:
        title = "Thông tin cá nhân";
        icon = Icons.account_balance;
        break;
      case 2:
        title = "Đồ án";
        icon = Icons.gradient;

        break;
      case 3:
        title = "Lịch học";
        icon = Icons.schedule;

        break;
      default:
        title = "xx";
        icon = Icons.ac_unit;
        break;
    }
    return GestureDetector(
      child: Card(
        elevation: 5.0,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 30,
              ),
              Text(title),
            ],
          ),
        ),
      ),
      onTap: () {
        itemClicked(index);
      },
    );
  }
}
