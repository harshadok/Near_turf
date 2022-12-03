import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:second_project/modules/sign_in/view_model/signin_controller.dart';
import 'package:second_project/utils/res/colors.dart';
import 'package:second_project/utils/res/sizedbox.dart';
import 'package:second_project/utils/res/text.dart';
import 'package:second_project/modules/sign_up/view/register_screen/register_screen.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signinViewModel = context.watch<SigninScreenController>();

    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: hight * 0.40,
                width: width * 0.6,
                child: Lottie.network(
                  'https://assets8.lottiefiles.com/packages/lf20_hzgq1iov.json',
                  repeat: true,
                  reverse: true,
                  animate: true,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: hight * 0.54,
                    width: width * 0.85,
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 20, top: 10, right: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "LOGIN",
                              style:
                                  commonHeddingtextStyle.copyWith(fontSize: 25),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: TextFormField(
                                  controller: signinViewModel.emailController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your email  ",
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontFamily: commontextStyle.fontFamily,
                                      letterSpacing: 1.0,
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.redAccent),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter email";
                                    } else {
                                      return null;
                                    }
                                  },
                                )),
                            ksizedBox,
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: TextFormField(
                                  obscureText: signinViewModel.isObscure,
                                  controller:
                                      signinViewModel.passwordController,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        signinViewModel.isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        signinViewModel.passwordHIde();
                                      },
                                    ),
                                    hintText: "Enter your password  ",
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontFamily: commontextStyle.fontFamily,
                                      letterSpacing: 1.0,
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.redAccent),
                                    ),
                                  ),
                                  validator: ((value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter password";
                                    }
                                    return null;
                                  }),
                                )),
                            ksizedBox,
                            Center(
                              child: SizedBox(
                                width: width * .75,
                                height: hight * 0.052,
                                child: signinViewModel.isloading == true
                                    ? const CupertinoActivityIndicator()
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                        onPressed: (() {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            signinViewModel.lodingfunction();
                                          }
                                          //   }
                                        }),
                                        child: Text("Sign Up",
                                            style: TextStyle(
                                                fontFamily:
                                                    commontextStyle.fontFamily,
                                                color: Colors.white))),
                              ),
                            ),
                            ksizedBox,
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 5, left: 5),
                                    child: const Divider(
                                      thickness: 2,
                                    ),
                                  ),
                                ),
                                Text(
                                  "OR",
                                  style: TextStyle(
                                      fontFamily: commontextStyle.fontFamily),
                                ),
                                Expanded(
                                  child: Builder(builder: (context) {
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          right: 5, left: 5),
                                      child: const Divider(
                                        thickness: 2,
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                            ksizedBox,
                            loginPageButton(width, hight, "Connect via google",
                                FontAwesomeIcons.google),
                            ksizedBox,
                            ksizedBox,
                            Container(
                              margin: const EdgeInsets.only(left: 50),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterScreen()),
                                  );
                                },
                                child: RichText(
                                  text: TextSpan(
                                      text: "Don't have an account?",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontFamily: commontextStyle.fontFamily,
                                        letterSpacing: 1.0,
                                      ),
                                      children: const [
                                        TextSpan(
                                          text: " Create",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }

  Center loginPageButton(double width, hight, String text, icon) {
    return Center(
      child: SizedBox(
        width: width * .75,
        height: hight * 0.052,
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            onPressed: () {},
            icon: FaIcon(icon, color: Colors.white),
            label: Text(text,
                style: TextStyle(
                    fontFamily: commontextStyle.fontFamily,
                    color: Colors.white))),
      ),
    );
  }
}
