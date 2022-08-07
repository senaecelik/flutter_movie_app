import 'package:flutter/material.dart';
import 'package:flutter_application/res/componenets/row_text_widget.dart';
import 'package:flutter_application/res/componenets/text_sub_widget.dart';
import 'package:flutter_application/res/componenets/title_text_widget.dart';
import 'package:flutter_application/res/constant/string_constant.dart';
import 'package:flutter_application/utils/routes/routes_name.dart';

import '../../res/componenets/elevated_grey_button.dart';
import '../../res/componenets/logo_image.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key})
      : super(key: key);

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {
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
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start,
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: [
                LogoImage(height: height),
                TitleWidget(
                  titleText: AppString
                      .instance.textRegisterTitle,
                ),
                SizedBox(
                  height: height * .02,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: AppString
                        .instance.textEmail,
                    prefixIcon:
                        const Icon(Icons.mail),
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: AppString
                        .instance.textPassword,
                    prefixIcon:
                        const Icon(Icons.lock),
                    suffixIcon: const Icon(
                        Icons.remove_red_eye),
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: false,
                        onChanged: (value) {}),
                    TextSubWidget(
                        text: AppString.instance
                            .textRemember),
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: SizedBox(
                      width: width,
                      height: height * .065,
                      child: Center(
                        child: Text(AppString
                            .instance.textSignUp),
                      ),
                    )),
                SizedBox(
                  height: height * .01,
                ),
                TextSubWidget(
                    text: AppString
                        .instance.textOrContinue),
                SizedBox(
                  height: height * .02,
                ),
                ElevatedButtonGrey(onPressed: () {
                  Navigator.of(context)
                      .pushNamed(RoutesName.home);
                }),
                SizedBox(
                  height: height * .02,
                ),
                RowTextWidget(
                  onPress: navigateToLogin,
                  text: AppString.instance
                      .textAlreadyHaveAnAccount,
                  clickText: AppString
                      .instance.textSignUp,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToLogin() {
    Navigator.of(context)
        .pushNamed(RoutesName.login);
  }
}
