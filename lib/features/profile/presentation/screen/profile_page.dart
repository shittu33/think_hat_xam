import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:think_hat_test/core/assets.dart';
import 'package:think_hat_test/core/theme.dart';
import 'package:think_hat_test/core/theme_extension.dart';
import 'package:think_hat_test/features/home/presentation/widget/page_wrapper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            CircleAvatar(
              radius: 52,
              backgroundImage: const AssetImage(user),
              backgroundColor: appColor.transparent,
            ),
            const SizedBox(height: 20,),
            Text(
              'Profile Page',
              style: context.theme.textTheme.titleSmall?.copyWith(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
