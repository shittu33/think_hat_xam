import 'package:flutter/material.dart';
import 'package:think_hat_test/core/assets.dart';
import 'package:think_hat_test/core/dimensions.dart';
import 'package:think_hat_test/core/navigator_manager.dart';
import 'package:think_hat_test/core/theme.dart';
import 'package:think_hat_test/core/theme_extension.dart';
import 'package:think_hat_test/features/home/presentation/widget/page_wrapper.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PageWrapper(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dims.appSideGap, vertical: Dims.appVertGap),
          child: _TopCardWidget(),
        )),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dims.appSideGap),
          child: _TrackSection(),
        ),
      ],
    );
  }
}

class _TopCardWidget extends StatelessWidget {
  const _TopCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 305,
      decoration: BoxDecoration(
          color: appColor.yellow, borderRadius: BorderRadius.circular(32)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 130,
              height: 141,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      orderTopLines,
                    )),
              ),
            ),
          ),
          Positioned.fill(
            top: 73,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Track Your Package",
                  style: context.theme.textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF031725),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0.07,
                    letterSpacing: 0.50,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Enter the receipt number that has \nbeen given by the officer',
                  style: context.theme.textTheme.titleSmall?.copyWith(
                    color: appColor.black.withOpacity(0.5),
                    letterSpacing: 0.50,
                  ),
                ),
                const SizedBox(height: 29),
                Column(
                  children: [
                    TextFormField(
                      // textAlign: TextAlign.center,
                      decoration: buildInputDecoration(
                          fillColor: appColor.transparent,
                          hintText: "Enter the receipt number"),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                        onPressed: () {
                          NavigatorManager.navigateTo(
                              context, NavigatorManager.orderDetails);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Track Now',
                                textAlign: TextAlign.center,
                                style: context.theme.textTheme.titleMedium
                                    ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.50,
                                ),
                              ),
                              const Icon(Icons.arrow_forward)
                            ],
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration({Color? fillColor, String? hintText}) {
    return InputDecoration(
      fillColor: fillColor,
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 34),
      hintStyle: appTheme.light.textTheme.titleSmall
          ?.copyWith(color: appColor.black.withOpacity(0.8)),
    );
  }
}

class _TrackSection extends StatelessWidget {
  const _TrackSection({
    super.key,
  });

  ///copilot
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tracking history",
          style: context.theme.textTheme.titleMedium,
        ),
        const SizedBox(height: Dims.appVertGap),
        Container(
          padding: const EdgeInsets.only(top: Dims.cardVertGap, bottom: 1),
          child: const Column(
            children: [
              _TrackHistoryItem(
                title: "SCP9374826473",
                subtitle: "In the process",
                textIcon: "📦",
              ),
              SizedBox(
                height: 24,
              ),
              _TrackHistoryItem(
                title: "SCP6653728497",
                subtitle: "In delivery",
                textIcon: "🚚",
              ),
              SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TrackHistoryItem extends StatelessWidget {
  const _TrackHistoryItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.textIcon,
  });

  final String title;
  final String subtitle;
  final String textIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: appColor.lightGray2,
              child: Text(
                textIcon,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              width: Dims.averterSideGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.28,
                  ),
                ),
                Text(
                  subtitle,
                  style: context.theme.textTheme.titleSmall,
                )
              ],
            ),
          ],
        ),
        const Icon(Icons.chevron_right_outlined),
      ],
    );
  }
}
