import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:think_hat_test/core/assets.dart';
import 'package:think_hat_test/core/dimensions.dart';
import 'package:think_hat_test/core/theme.dart';
import 'package:think_hat_test/core/theme_extension.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: appColor.lightGray,
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  mapViewBg,
                )),
          ),
          child: Scaffold(
            backgroundColor: appColor.transparent,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: appColor.transparent,
                  statusBarIconBrightness: Brightness.dark),
              backgroundColor: appColor.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 39.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 327,
                      height: 88,
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: appColor.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(46),
                        ),
                      ),
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50, color: appColor.blackGreen),
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "SCP6653728497",
                            textAlign: TextAlign.center,
                            style: context.theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const _BottomSheet(),
        const _AppBar()
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83,
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: appColor.transparent,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: appColor.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: appColor.black,
            size: 16,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Tracking Details',
          style: context.theme.textTheme.titleSmall?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.36,
          ),
        ),
      ),
    );
  }
}

class _BottomSheet extends StatefulWidget {
  const _BottomSheet({
    super.key,
  });

  @override
  State<_BottomSheet> createState() => _BottomSheetState();
}

const initialChildSize = 0.15;

class _BottomSheetState extends State<_BottomSheet> {
  final controller = DraggableScrollableController();
  var shadowOpacity = 0.0;
  var ignoreClick = true;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        if (controller.size <= initialChildSize) {
          shadowOpacity = 0;
          return;
        }
        shadowOpacity = controller.size * 0.8;
      });
      // print("shadowOpacity:${shadowOpacity}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: appColor.black.withOpacity(shadowOpacity),
          spreadRadius: 4,
          blurRadius: 3,
        ),
      ]),
      child: DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: initialChildSize,
          maxChildSize: 0.85,
          snap: true,
          controller: controller,
          builder: (ctx, ctrl) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              child: Container(
                color: appColor.white,
                child: SingleChildScrollView(
                  controller: ctrl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 134,
                          child: Align(
                            alignment: const FractionalOffset(1, 0.4),
                            child: Text(
                              ". .",
                              style:
                                  context.theme.textTheme.titleSmall?.copyWith(
                                color: const Color(0xFF2E3E5C),
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.50,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: SizedBox(
                                  width: 48,
                                  child: Divider(
                                    height: 10,
                                    thickness: 6,
                                    color: appColor.lightGray2,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Estimate arrives in',
                              style:
                                  context.theme.textTheme.titleSmall?.copyWith(
                                color: appColor.blackGreen.withOpacity(0.8),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                                letterSpacing: 0.50,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '2h 40m',
                              style:
                                  context.theme.textTheme.titleSmall?.copyWith(
                                color: const Color(0xFF2E3E5C),
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.50,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const _DetailCard(),
                            const SizedBox(
                              height: 24,
                            ),
                            const _HistorySection(),
                            const SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class _HistorySection extends StatelessWidget {
  const _HistorySection({
    super.key,
  });

  ///copilot
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "History",
          style: context.theme.textTheme.titleMedium,
        ),
        const SizedBox(height: Dims.appVertGap),
        Container(
          padding: const EdgeInsets.only(top: Dims.cardVertGap, bottom: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _ShipHistoryItem(
                title: "In Delivery",
                subtitle: "Bali, Indonesia",
                time: "00.00 PM",
                textIcon: "🚚",
                current: true,
              ),
              Container(
                height: 24,
                width: 1.5,
                margin: const EdgeInsets.only(left: 20),
                color: appColor.lightGray2,
              ),
              const _ShipHistoryItem(
                title: "Transit - Sending City",
                subtitle: "Jakarta, Indonesia",
                time: "22.00 PM",
                textIcon: "📬",
              ),
              Container(
                height: 24,
                width: 1.5,
                margin: const EdgeInsets.only(left: 20),
                color: appColor.lightGray2,
              ),
              const _ShipHistoryItem(
                title: "Send Form Sukabumi",
                subtitle: "Sukabumi, Indonesia",
                time: "10.00 AM",
                textIcon: "📦",
              ),
              const SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ShipHistoryItem extends StatelessWidget {
  const _ShipHistoryItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.textIcon,
    required this.time,
    this.current = false,
  });

  final String title;
  final String subtitle;
  final String textIcon;
  final bool current;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: current?appColor.yellow:appColor.lightGray2,
              child: Text(
                textIcon,
                style: const TextStyle(fontSize: 18),
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
        Text(
          time,
          style: context.theme.textTheme.labelSmall?.copyWith(
            color: Color(0xFF7A809D),
            letterSpacing: 0.50,
          ),
        )
      ],
    );
  }
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: appColor.yellow, borderRadius: BorderRadius.circular(32)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(
            'Sukabumi, Indonesia',
            style: context.theme.textTheme.titleMedium?.copyWith(
              letterSpacing: 0.50,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'No receipt : SCP6653728497',
            style: context.theme.textTheme.labelLarge?.copyWith(
              color: const Color(0xFF95823C),
              letterSpacing: 0.50,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(
            thickness: 0.8,
          ),
          const SizedBox(height: 16),
          Text(
            '2,50 USD',
            style: context.theme.textTheme.titleMedium?.copyWith(
              letterSpacing: 0.50,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Postal fee',
            style: context.theme.textTheme.labelLarge?.copyWith(
              color: const Color(0xFF95823C),
              letterSpacing: 0.50,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(
            thickness: 0.8,
          ),
          const SizedBox(height: 16),
          Text(
            'Bali, Indonesia',
            style: context.theme.textTheme.titleMedium?.copyWith(
              letterSpacing: 0.50,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Parcel, 24kg',
            style: context.theme.textTheme.labelLarge?.copyWith(
              color: const Color(0xFF95823C),
              letterSpacing: 0.50,
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
