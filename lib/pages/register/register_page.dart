import 'package:assignment/constants/app_images.dart';
import 'package:assignment/helpers/form_helper.dart';
import 'package:assignment/pages/components/custom_button.dart';
import 'package:assignment/pages/components/text_input.dart';
import 'package:assignment/pages/register/register_controller.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final c = Get.put(RegisterController());

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
            height: size.height * 0.9,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Join Easy Assignment',
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
                    height: size.height * 0.2,
                  ),
                  Obx(
                    () => Form(
                      key: c.registerFormKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                color: c.registerData['role'] == 'student'
                                    ? Colors.grey
                                    : Colors.white,
                                borderColor: Colors.grey,
                                veritcalPadding: 7,
                                onTap: () {
                                  c.registerData['role'] = 'student';
                                },
                                width: size.width * 0.43,
                                child: Text(
                                  'Student',
                                  style:
                                      theme.textTheme.headlineMedium!.copyWith(
                                    color: c.registerData['role'] == 'student'
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              CustomButton(
                                color: c.registerData['role'] == 'lecturer'
                                    ? Colors.grey
                                    : Colors.white,
                                borderColor: Colors.grey,
                                veritcalPadding: 7,
                                onTap: () {
                                  c.registerData['role'] = 'lecturer';
                                },
                                width: size.width * 0.43,
                                child: Text(
                                  'Lecturer',
                                  style:
                                      theme.textTheme.headlineMedium!.copyWith(
                                    color: c.registerData['role'] == 'lecturer'
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CTextInput(
                            hint: 'First name',
                            validator: (value) => FormHelper()
                                .validateUsername('Firstname', value),
                            value: c.registerData['firstName'],
                            onSaved: (value) {
                              c.registerData['firstName'] = value;
                            },
                          ),
                          CTextInput(
                            hint: 'Last name',
                            validator: (value) => FormHelper()
                                .validateUsername('Lastname', value),
                            value: c.registerData['lastName'],
                            onSaved: (value) {
                              c.registerData['lastName'] = value;
                            },
                          ),
                          CTextInput(
                            hint: 'Enter Email',
                            validator: FormHelper().validateEmail,
                            value: c.registerData['email'],
                            onSaved: (value) {
                              c.registerData['email'] = value;
                            },
                          ),
                          CTextInput(
                            hint: 'Enter Password',
                            validator: FormHelper().validatePassword,
                            value: c.registerData['password'],
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
                            onSaved: (value) {
                              c.registerData['password'] = value;
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
                      'Register',
                      style: theme.textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.offNamed(AppRoutes.login),
                    child: Text(
                      'Opps! I already have a registered account. \n Login Now',
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
