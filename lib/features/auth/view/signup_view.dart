import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_learning/common/loading_page.dart";
import "package:riverpod_learning/features/auth/controller/auth_controller.dart";
import "package:riverpod_learning/features/auth/view/login_view.dart";
import "package:riverpod_learning/features/auth/widgets/auth_field.dart";
import "../../../common/rounded_smol_buttton.dart";
import "../../../constants/constants.dart";
import "../../../theme/pallete.dart";

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpView());
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbar =
      UIconstants.appBar(); //optimised appbar is not build again and again
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passcontroller.dispose();
  }

  void onsignUp() {
    ref.read(authControllerProvider.notifier).signUp(
        email: emailcontroller.text,
        password: passcontroller.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isloading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isloading? const Loading():Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Authfield(controller: emailcontroller, hint: "Email address"),
              const SizedBox(
                height: 25,
              ),
              Authfield(
                hide: true,
                controller: passcontroller,
                hint: "Password",
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Roundedsmall(
                    onTap: () {
                      onsignUp();
                    },
                    label: "Sign Up",
                    bgcolor: Pallete.whiteColor,
                    txtcolor: Pallete.backgroundColor,
                  )),
              const SizedBox(
                height: 40,
              ),
              RichText(
                  text: TextSpan(
                      text: "Already have an Account?",
                      style: const TextStyle(fontSize: 15),
                      children: [
                    TextSpan(
                        text: " Login ",
                        style: const TextStyle(color: Pallete.blueColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, LoginView.route());
                          })
                  ]))
            ],
          ),
        )),
      ),
    );
  }
}
