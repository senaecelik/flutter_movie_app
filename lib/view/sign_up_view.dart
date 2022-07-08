import 'package:flutter/material.dart';
import 'package:flutter_application/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../res/componenets/round_button.dart';
import '../utils/general_utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final heigh = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.alternate_email)),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    obscuringCharacter: "*",
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock_open_outlined),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined))),
                  );
                }),
            SizedBox(
              height: heigh * .1,
            ),
            RoundButton(
                title: "giriş yap",
                loading: authViewModel.signUpLoading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage("Please enter email", context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Please enter password", context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        "Please enter 6 digit password", context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      "password": _passwordController.text.toString(),
                    };
                    authViewModel.loginApi(data, context);
                    print('api hit');
                  }
                }),
            SizedBox(
              height: heigh * .02,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text("Already have an accıunt? Log in"))
          ],
        ),
      ),
    );
  }
}
