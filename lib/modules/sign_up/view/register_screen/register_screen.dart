import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_project/utils/res/colors.dart';
import 'package:second_project/utils/res/sizedbox.dart';
import 'package:second_project/utils/res/text.dart';

import '../../view_model/signup_viewmodel.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signupViewmodel = context.read<SignUpViewModel>();
    double width = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          height: hight * .85,
          width: width * .86,
          child: Column(
            children: [
              Column(
                children: [
                  ksizedBoxregistraion,
                  SizedBox(
                    height: hight * 0.03,
                  ),
                  Text("Sign Up", style: commonHeddingtextStyle),
                  ksizedBoxregistraion,
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                        offset: const Offset(1, 1),
                                        color: Colors.grey.withOpacity(0.5))
                                  ]),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter your name";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Your First Name",
                                  prefixIcon: const Icon(
                                      Icons.account_box_rounded,
                                      color: primaryColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            ksizedBoxregistraion,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                        offset: const Offset(1, 1),
                                        color: Colors.grey.withOpacity(0.5))
                                  ]),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter your name";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Your Second Name ",
                                  prefixIcon: const Icon(
                                      Icons.account_box_rounded,
                                      color: primaryColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            ksizedBoxregistraion,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                        offset: const Offset(1, 1),
                                        color: Colors.grey.withOpacity(0.5))
                                  ]),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Your Email";
                                  }
                                  return null;
                                },
                                controller: signupViewmodel.emailController,
                                decoration: InputDecoration(
                                  hintText: "Your Email",
                                  prefixIcon: const Icon(Icons.email,
                                      color: primaryColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            ksizedBoxregistraion,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                        offset: const Offset(1, 1),
                                        color: Colors.grey.withOpacity(0.5))
                                  ]),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Your Password";
                                  }
                                  return null;
                                },
                                controller: signupViewmodel.passwordController,
                                decoration: InputDecoration(
                                  hintText: "Your password",
                                  prefixIcon: const Icon(Icons.lock_sharp,
                                      color: primaryColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            ksizedBox,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                        offset: const Offset(1, 1),
                                        color: Colors.grey.withOpacity(0.5))
                                  ]),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Your Password";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Confrom password",
                                  prefixIcon: const Icon(Icons.lock_sharp,
                                      color: primaryColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ksizedBox,
                  Center(
                    child: SizedBox(
                      width: width * .75,
                      height: hight * 0.050,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          onPressed: (() {
                            if (_formKey.currentState!.validate()) {
                              signupViewmodel.signUp(context);
                            }
                            //   }
                          }),
                          child: Text("Sign UP",
                              style: TextStyle(
                                  fontFamily: commontextStyle.fontFamily,
                                  color: Colors.white))),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: RichText(
                      text: TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontFamily: commontextStyle.fontFamily,
                          ),
                          children: const [
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
