import 'package:assignment/constants/app_images.dart';
import 'package:assignment/helpers/form_helper.dart';
import 'package:assignment/pages/components/custom_button.dart';
import 'package:assignment/pages/components/text_input.dart';
import 'package:assignment/pages/login/login_controller.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final c = Get.put(LoginController());

    final Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: size.height * 0.1,
          left: size.width * 0.05,
          right: size.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height * 0.8,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Easy Assignment',
                        style: theme.textTheme.headlineMedium!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    AppImages.login,
                    height: size.height * 0.3,
                  ),
                  Obx(
                    () => Form(
                      key: c.loginFormKey,
                      child: Column(
                        children: [
                          CTextInput(
                            hint: 'Enter Email',
                            value: c.loginData['email'],
                            validator: FormHelper().validateEmail,
                            onSaved: (value) {
                              c.loginData['email'] = value;
                            },
                          ),
                          CTextInput(
                            hint: 'Enter Password',
                            value: c.loginData['password'],
                            obsecure: c.cObsecure.value,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                c.cObsecure.value = !c.cObsecure.value;
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Icon(
                                  c.cObsecure.value
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            validator: FormHelper().validatePassword,
                            onSaved: (value) {
                              c.loginData['password'] = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    color: Colors.black,
                    onTap: c.submitForm,
                    child: Text(
                      'Login',
                      style: theme.textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.offNamed(AppRoutes.register),
                    child: Text(
                      'Opps! I dont have a registered account. \n Register Now',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall!.copyWith(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
