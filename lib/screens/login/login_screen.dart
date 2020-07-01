import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ihust/blocs/authorize/authorize_bloc.dart';
import 'package:ihust/models/Student.dart';
import 'package:ihust/screens/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthorizeBloc authorizeBloc;
  TextEditingController _accountContr = new TextEditingController();
  TextEditingController _passContr = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    authorizeBloc = BlocProvider.of<AuthorizeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: BlocListener<AuthorizeBloc, AuthorizeState>(
        bloc: authorizeBloc,
        listener: (context, state) {
          if (state.error != null) {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Container(
              child: Text(state.error.description?.toString()),
            )));
          } else {
            if (state.user is Student) {
              Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(builder: (context) => HomeScreen()));
            }
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: SizedBox(),
                    ),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: _formKey,
                      child: _emailPasswordWidget(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: (authorizeBloc.state.isLoading)
                          ? null
                          : () {
                              if (!_formKey.currentState.validate()) {
                                // if (accountCheck == null) {
                                //   // _flushbar = ClientUtils().createToast(
                                //   //   type: ToastType.error,
                                //   //   title: "Lỗi",
                                //   //   message: "Tài khoản không đúng định dạng!",
                                //   //   duration: Duration(seconds: 5));
                                // // _flushbar.show(context);
                                // }
                              } else {
                                String userName = _accountContr.value.text
                                    .trim()
                                    .toLowerCase()
                                    .toString();
                                String password = _passContr.value.text
                                    .trim()
                                    .toLowerCase()
                                    .toString();

                                authorizeBloc.add(
                                    LoginWithUserNameAndPasswordEvent(
                                        userName: userName,
                                        password: password));
                              }
                            },
                      child: _submitButton(),
                    ),
//                    Container(
//                      padding: EdgeInsets.symmetric(vertical: 10),
//                      alignment: Alignment.centerRight,
//                      child: Text('Forgot Password ?',
//                          style: TextStyle(
//                              fontSize: 14, fontWeight: FontWeight.w500)),
//                    ),
                    _divider(),
                    // _facebookButton(),
                    Expanded(
                      flex: 2,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: null,
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'i',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'Hu',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'st',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Account", controller: _accountContr),
        _entryField("Password", isPassword: true, controller: _passContr),
      ],
    );
  }

  Widget _entryField(String title,
      {bool isPassword = false, TextEditingController controller}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return !isPassword
                      ? 'Tài khoản không được để trống'
                      : "Mật khẩu trống";
                } else if (!isPassword && value.length != 8) {
                  return "Tài khoản không đúng";
                }
                return null;
              },
              maxLength: !isPassword ? 8 : null,
              controller: controller ?? new TextEditingController(),
              keyboardType:
                  !isPassword ? TextInputType.number : TextInputType.text,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: BlocBuilder<AuthorizeBloc, AuthorizeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Container(
                height: 25,
                width: 25,
                // margin: EdgeInsets.all(5),
                child: CircularProgressIndicator(
                  strokeWidth: 0.7,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            }
            return Text(
              'Login',
              style: TextStyle(fontSize: 20, color: Colors.white),
            );
          },
        ));
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
