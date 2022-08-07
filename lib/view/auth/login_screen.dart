
import 'package:flutter/material.dart';
import 'package:flutter_application/res/constant/string_constant.dart';
import 'package:flutter_application/utils/routes/routes_name.dart';
import '../../res/componenets/elevated_grey_button.dart';
import '../../res/componenets/logo_image.dart';
import '../../res/componenets/row_text_widget.dart';
import '../../res/componenets/text_button_red.dart';
import '../../res/componenets/text_sub_widget.dart';
import '../../res/componenets/title_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  TextEditingController emailController =
      TextEditingController();

  TextEditingController passwordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    final width =
        MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: _buildLoginBody(
                height, width, context),
          ),
        ),
      ),
    );
  }

  Column _buildLoginBody(double height,
      double width, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
          CrossAxisAlignment.center,
      children: [
        _buildLoginTop(height),
        _buildLoginForm(height, width),
        _buildLoginBottom(height, context)
        //or cont
      ],
    );
  }

  Column _buildLoginBottom(
      double height, BuildContext context) {
    return Column(
      children: [
        TextSubWidget(
            text: AppString
                .instance.textOrContinue),
        SizedBox(
          height: height * .02,
        ),

        //google button
        ElevatedButtonGrey(onPressed: () {
          Navigator.of(context)
              .pushNamed(RoutesName.home);
        }),

        SizedBox(
          height: height * .02,
        ),
        RowTextWidget(
          onPress: navigateToRegister,
          text: AppString
              .instance.textRegisterTitle,
          clickText:
              AppString.instance.textSignIn,
        )
      ],
    );
  }

  Column _buildLoginTop(double height) {
    return Column(
      children: [
        LogoImage(height: height),
        //title
        TitleWidget(
          titleText:
              AppString.instance.textLoginTitle,
        ),
        SizedBox(
          height: height * .02,
        ),
      ],
    );
  }

  Column _buildLoginForm(
      double height, double width) {
    return Column(
      children: [
        _buildEmail(),
        SizedBox(
          height: height * .02,
        ),
        _buildPassword(),
        SizedBox(
          height: height * .02,
        ),
        _buildRememberMe(),
        SizedBox(
          height: height * .02,
        ),

        //sign in button
        ElevatedButton(
            onPressed: () {},
            child: SizedBox(
              width: width,
              height: height * .07,
              child: Center(
                child: Text(AppString
                    .instance.textSignIn),
              ),
            )),
        SizedBox(
          height: height * .02,
        ),

        //forgot pass button
        _buildForgotPass(),
        SizedBox(
          height: height * .02,
        ),
      ],
    );
  }

  InkWell _buildForgotPass() {
    return InkWell(
      onTap: () {},
      child: TextButtonRed(
          text:
              AppString.instance.textForgotPass),
    );
  }

  Row _buildRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: false, onChanged: (value) {}),
        TextSubWidget(
            text:
                AppString.instance.textRemember),
      ],
    );
  }

  TextField _buildPassword() {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        hintText: AppString.instance.textPassword,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: const Icon(Icons.remove_red_eye),
      ),
    );
  }

  TextField _buildEmail() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        hintText: AppString.instance.textEmail,
        prefixIcon: const Icon(Icons.mail),
      ),
    );
  }

  void navigateToRegister() {
    Navigator.of(context)
        .pushNamed(RoutesName.register);
  }
}
