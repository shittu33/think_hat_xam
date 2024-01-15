import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:think_hat_test/core/assets.dart';
import 'package:think_hat_test/core/dimensions.dart';
import 'package:think_hat_test/core/theme.dart';
import 'package:think_hat_test/core/theme_extension.dart';
import 'package:think_hat_test/features/home/presentation/vm/home_vm.dart';
import 'package:think_hat_test/features/home/presentation/widget/app_bar_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var watchSearchFocusNode =
        context.watch<HomePageViewModel>().searchFocusNode;
    return AppBarWrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dims.appVertGap,horizontal: Dims.appSideGap),
        child: Column(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              switchOutCurve: Curves.easeInOut,
              reverseDuration: const Duration(milliseconds: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: Dims.appVertGap * 2),
                        const AccountSection(),
                        const SizedBox(height: Dims.appVertGap * 2.5),
                        Text(
                          'Hello good Morning!',
                          style: context.theme.textTheme.titleLarge?.copyWith(
                            color: const Color(0xFF092C4C),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )
                      ],
                    ),
            ),
            const SizedBox(height: Dims.appVertGap),
          ],
        ),
      ),
    );
  }
}

class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("onTap");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundImage: const AssetImage(user),
            backgroundColor: appColor.transparent,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(6),
              color: appColor.lightGray,
              child: SvgPicture.asset(
                ringBellIcon,
                width: 24,
                height: 24,
                color: appColor.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
