import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:second_project/components/button_widget.dart';
import 'package:second_project/utils/res/sizedbox.dart';
import 'package:second_project/utils/res/text.dart';

import '../../../utils/res/colors.dart';
import '../../../utils/res/style.dart';
import '../../sign_up/view_model/signup_viewmodel.dart';
import '../view_model/otp_view_model.dart';

class OtpVerificationView extends StatelessWidget {
  static String id = "otp_view";

  const OtpVerificationView({Key? key, this.newId}) : super(key: key);

  final String? newId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OTP VERIFICATION",
                style: commontextStyle,
              ),
              ksizedBox,
              ksizedBox,
              ksizedBox,
              const Text("We sent your code to  "),
              //height50,
              ksizedBox,
              ksizedBox,
              ksizedBox,
              ksizedBox,
              const OtpForm(),
              // height50,
              ksizedBox,
              ksizedBox,
              const Text(
                "Resend OTP cod",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OtpForm extends StatelessWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OtpViewModel otpViewModel = context.read<OtpViewModel>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: otpViewModel.one,
                autofocus: true,
                obscureText: true,
                //maxLength: 1,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: otpViewModel.two,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: otpViewModel.three,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: otpViewModel.four,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
              ),
            ),
          ],
        ),
        ksizedBox,
        ksizedBox,
        ksizedBox,
        ksizedBox,
        ksizedBox,
        MaterialButtonWidget(
          text: "Continue",
          color: secondryColor,
          textColor: primaryColor,
          onClick: () {
            otpViewModel.verifyOtp(context,
                Provider.of<SignUpViewModel>(context, listen: false).newId!);
          },
        ),
      ],
    );
  }
}
