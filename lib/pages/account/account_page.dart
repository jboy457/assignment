import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_images.dart';
import '../../helpers/form_helper.dart';
import '../components/custom_button.dart';
import '../components/text_input.dart';
import 'account_controller.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          AppImages.background,
        ),
        fit: BoxFit.fill,
        opacity: 0.8,
      )),
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
      ),
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.04,
      ),
      child: Column(children: [
        Row(
          children: [
            Text(
              'My Kitchen',
              style: theme.textTheme.headlineLarge,
            ),
            const Spacer(),
            const Icon(
              Icons.more_vert_outlined,
              size: 30,
            )
          ],
        ),
        Column(
          children: [
            
          ],
        )
      ]),
    ));
  }
}
