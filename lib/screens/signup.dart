
// import 'package:cyc_e_commerce_app/widgets/changescreen.dart';
// import 'package:cyc_e_commerce_app/widgets/mybutton.dart';

import 'package:cyc_e_commerce_app/widgets/changescreen.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {

  void validation() {
    final FormState? _form = _formkey.currentState;
    if (_form!.validate()) {
      print("회원가입 성공");
    } else {
      print("회원가입 실패");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //키보드가 올라오면서 화면을 밀어내지 않게 해줌
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "회원가입",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20, //회원가입 글씨와 아래 텍스트필드 사이 여백 주기
                ),
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 20), //양쪽 마진 주기
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //간격 일정하게 주기
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 2) {
                            return "이름이 너무 짧습니다.";
                          } else if (value == "") {
                            return "빈칸을 채워주세요.";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "이름",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
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
                          hintText: "이메일",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        obscureText: obserText,
                        validator: (value) {
                          if (value!.length < 8) {
                            return "비밀번호는 8자리 이상으로 설정해주세요.";
                          } else if (value == "") {
                            return "빈칸을 채워주세요.";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "비밀번호",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obserText = !obserText;
                              });
                              FocusScope.of(context)
                                  .unfocus(); //키보드가 화면에 올라왔을 때 다른곳을 누르면 다시 내려가게
                            },
                            child: Icon(
                                obserText == true? Icons.visibility: Icons.visibility_off,
                                color: Colors.black),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 11) {
                            return "전화번호는 11자리여야 합니다.";
                          } else if (value == "") {
                            return "빈칸을 채워주세요.";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "핸드폰 번호",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),

                      //로그인버튼
                      //오류 발생
                      // MyButton(
                      //     onPressed: (){
                      //       validation();
                      //     },
                      //   name: "회원가입",
                      // ),

                      Container(
                        height: 45,
                        width: double.infinity,
                        child: RaisedButton(
                            child: Text("회원 가입"),
                            color: Colors.pinkAccent,
                            onPressed: () {
                              validation();
                            }),
                      ),

                      //회원가입 화면 -> 로그인 화면
                      //오류 발생
                      ChangeScreen(
                          name: "로그인하러가기",
                          onTap: (){
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => Login(),
                              ),
                            );
                          },
                          whichAccount: "계정이 이미 있습니다."
                      ),

                      // Row(
                      //   children: [
                      //     Text("이미 계정이 있습니다."),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     GestureDetector(
                      //       onTap: (){
                      //         Navigator.of(context).pushReplacement(
                      //           MaterialPageRoute(
                      //             builder: (ctx) => Login(),
                      //           ),
                      //         );
                      //       },
                      //       child: Text(
                      //         "로그인",
                      //         style: TextStyle(
                      //             color: Colors.cyan,
                      //             fontSize: 20,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
