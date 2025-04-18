import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mental_health_app/feature/auth/registration_screen.dart';
import 'package:mental_health_app/feature/navigator/view/navigator_view.dart';
import 'package:mental_health_app/utils/colors.dart';
import 'package:mental_health_app/widgets/large_btn_view.dart';
import 'package:mental_health_app/widgets/text_field_container.dart';
import 'package:mental_health_app/widgets/textfield_style.dart';
import 'package:mental_health_app/widgets/textstyles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: _main(),
        ),
      ),
    );
  }

  Widget _main() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        InkWell(
          onTap: () {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
          child: CircleAvatar(
            backgroundColor: ColorPalettes.arrowColor,
            child: Icon(Icons.arrow_back, color: ColorPalettes.whiteColor),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Text("Login", style: Textstyles.w60026),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Text("Welcome back!\nPlease login to continue",
            style: Textstyles.w40014),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        _loginForm(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        LargeBtnView(
          btnName: "Login",
          onTap: _validateAndLogin,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Align(
          alignment: Alignment.center,
          child: RichText(
            textScaler: TextScaler.noScaling,
            text: TextSpan(
              text: "Don’t have an account? ",
              style: Textstyles.w40012,
              children: [
                TextSpan(
                  text: "Create Now",
                  style: Textstyles.w40012
                      .copyWith(color: ColorPalettes.darkOrangeColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()),
                      );
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFieldContainer(
            color: ColorPalettes.arrowColor,
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: ColorPalettes.arrowColor,
              cursorHeight: 20,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.next,
              decoration: InputStyleCustom.textFieldStyle(
                context,
                mandatory: false,
                labelTxt: "Enter Email Id",
              ).copyWith(hintText: "you@example.com"),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Email is required";
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return "Enter a valid email";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          TextFieldContainer(
            color: ColorPalettes.arrowColor,
            child: TextFormField(
              controller: passwordController,
              obscureText: _obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: ColorPalettes.arrowColor,
              cursorHeight: 20,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.done,
              decoration: InputStyleCustom.textFieldStyle(
                context,
                mandatory: false,
                labelTxt: "Enter Password",
              ).copyWith(
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: ColorPalettes.whiteColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Password is required";
                } else if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  void _validateAndLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavigatorView(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields correctly.")),
      );
    }
  }
}
