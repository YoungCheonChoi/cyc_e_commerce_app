
import 'package:cyc_e_commerce_app/widgets/changescreen.dart';
import '../widgets/mybutton.dart';
import 'package:cyc_e_commerce_app/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

void validation() {
  final FormState? _form = _formkey.currentState;
  if (_form!.validate()) {
    print("로그인 성공");
  } else {
    print("로그인 실패");
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "로그인",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 10) {
                          return "이메일이 너무 짧습니다.";
                        } else if (value == "") {
                          return "빈칸을 채워주세요.";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "이메일",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value) {
                        if (value == "") {
                          return "빈칸을 채워주세요.";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "비밀번호",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            obserText = !obserText;
                          },
                          child: Icon(
                              obserText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),

                    //로그인버튼
                    //오류 발생
                    // MyButton(
                    //     onPressed: (){
                    //       validation();
                    //     },
                    //   name: "로그인",
                    // ),

                    //MyButton 폴더에서 관리
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: RaisedButton(
                          child: Text("로그인"),
                          color: Colors.pinkAccent,
                          onPressed: () {
                            validation();
                          }),
                    ),

                    //로그인 화면 -> 회원가입 화면
                    //오류 발생
                    ChangeScreen(
                        name: "회원가입하러가기",
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => SignUp(),
                            ),
                          );
                        },
                        whichAccount: "현재 계정이 존재하지 않습니다."
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
