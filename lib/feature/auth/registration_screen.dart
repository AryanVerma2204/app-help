import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mental_health_app/feature/auth/login_screen.dart';
import 'package:mental_health_app/feature/navigator/view/navigator_view.dart';
import 'package:mental_health_app/utils/colors.dart';
import 'package:mental_health_app/widgets/large_btn_view.dart';
import 'package:mental_health_app/widgets/text_field_container.dart';
import 'package:mental_health_app/widgets/textfield_style.dart';
import 'package:mental_health_app/widgets/textstyles.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController mobNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: _main(),
      )),
    );
  }

  Widget _main() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
            backgroundColor: ColorPalettes.arrowColor,
            child: Icon(
              Icons.arrow_back,
              color: ColorPalettes.whiteColor,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Text(
          "Create Account",
          style: Textstyles.w60026,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Text(
          "Enter your information below or continue\nwith social media account",
          style: Textstyles.w40014,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        textField(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        LargeBtnView(
          btnName: "Create Account",
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const NavigatorView()));
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Align(
          alignment: Alignment.center,
          child: RichText(
            textScaler: TextScaler.noScaling,
            text: TextSpan(
                text: "Already have an account? ",
                style: Textstyles.w40012,
                children: [
                  TextSpan(
                    text: "Login Now",
                    style: Textstyles.w40012
                        .copyWith(color: ColorPalettes.darkOrangeColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                  )
                ]),
          ),
        ),
      ],
    );
  }

  Widget textField() {
    return Column(
      children: [
        TextFieldContainer(
            color: ColorPalettes.arrowColor,
            child: TextField(
              cursorColor: ColorPalettes.arrowColor,
              autofocus: true,
              cursorHeight: 20,
              controller: mobNoController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.left,
              textInputAction: TextInputAction.next,
              decoration: InputStyleCustom.textFieldStyle(context,
                  mandatory: false, labelTxt: "Enter Email id"),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        TextFieldContainer(
            color: ColorPalettes.arrowColor,
            child: TextField(
              cursorColor: ColorPalettes.arrowColor,
              cursorHeight: 20,
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {},
              textInputAction: TextInputAction.next,
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.left,
              decoration: InputStyleCustom.textFieldStyle(context,
                  mandatory: false, labelTxt: "Enter Password"),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        TextFieldContainer(
            color: ColorPalettes.arrowColor,
            child: TextField(
              cursorColor: ColorPalettes.arrowColor,
              cursorHeight: 20,
              controller: confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {},
              textInputAction: TextInputAction.done,
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.left,
              decoration: InputStyleCustom.textFieldStyle(context,
                  mandatory: false, labelTxt: "Confirm Password"),
            )),
      ],
    );
  }
}
