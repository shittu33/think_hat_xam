import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:logger/logger.dart';
import 'package:think_hat_test/core/assets.dart';
import 'package:think_hat_test/core/dimensions.dart';
import 'package:think_hat_test/core/theme.dart';
import 'package:think_hat_test/core/theme_extension.dart';
import 'package:think_hat_test/features/home/presentation/vm/home_vm.dart';
import 'package:think_hat_test/features/home/presentation/widget/page_wrapper.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomePageViewModel>().fetchVehicles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const PageWrapper(
      child: Column(
        children: [
          // SizedBox(height: 8),
          _VehicleSection(),
          SizedBox(height: 25),
          _OrderSection(),
          // SizedBox(height: 6),
          _RideDetailSection()
        ],
      ),
    );
  }
}

class _RideDetailSection extends StatelessWidget {
  const _RideDetailSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(rideAnim, width: 160, height: 160),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              'You too can join our \nElite squad of E-bikers',
              style: context.theme.textTheme.titleMedium?.copyWith(
                color: const Color(0xFF414141),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.50,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _OrderSection extends StatelessWidget {
  const _OrderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 109,
      width: double.infinity,
      color: appColor.yellow,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:18.0),
              child: Text(
                'Gotten your\nE-Bike yet?\n',
                style: context.theme.textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF95823C),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  // height: 0.09,
                  letterSpacing: 0.50,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<HomePageViewModel>().selectedTab = 1;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Text(
                        'Your Orders',
                        textAlign: TextAlign.center,
                        style: context.theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.50,
                        ),
                      ),
                      const SizedBox(width: 21),
                      const Icon(Icons.arrow_forward)
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _VehicleSection extends StatefulWidget {
  const _VehicleSection({
    super.key,
  });

  @override
  State<_VehicleSection> createState() => _VehicleSectionState();
}

class _VehicleSectionState extends State<_VehicleSection> {
  ScrollController scrollController = ScrollController();
  List<int> visibleItems = [];

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      visibleItems = [0];
      scrollController.addListener(() {
        final startIndex =
            (scrollController.offset ~/ (getListItemWidth(context) * 0.7));
        Logger().i("curr Index:${startIndex}");

        // selectedScrollBarEndIndex = selectedScrollBarStartIndex + maxBarCount;
        setState(() {
          visibleItems = [startIndex];
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomePageViewModel>();
    return Column(
      children: [
        if (vm.currentAppState.isVehicles && vm.currentProgress.isLoading)
           SizedBox(
            height: 265,
            child: Center(
              child: CircularProgressIndicator(
                color: appColor.yellow,
              ),
            ),
          )
        else if (vm.currentAppState.isVehicles && vm.currentProgress.isError)
          SizedBox(
            height: 265,
            child: Center(
              child: Text(
                "Something is wrong",
                style: context.theme.textTheme.titleSmall
                    ?.copyWith(color: appColor.red),
              ),
            ),
          )
        else ...[
          SizedBox(
            height: getListItemWidth(context) * 1.02,
            child: ListView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: Dims.appSideGap,
                ),
                ...vm.vehicles.asMap().entries.map((e) {
                  return SizedBox(
                    width: getListItemWidth(context),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          appColor.white.withOpacity(
                              visibleItems.contains(e.key) == true ? 0 : 0.4),
                          BlendMode.srcOver),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10, bottom: 0),
                        padding: const EdgeInsets.symmetric(
                            vertical: Dims.cardVertGap),
                        decoration: BoxDecoration(
                            color: appColor.lightGray,
                            borderRadius: BorderRadius.circular(30)),
                        child: AnimationConfiguration.staggeredList(
                            position: 0,
                            duration: const Duration(seconds: 1),
                            child: SlideAnimation(
                                horizontalOffset: -50,
                                verticalOffset: -50,
                                child: FadeInAnimation(
                                    child: Image.asset(e.value.image)))),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  width: Dims.appSideGap,
                ),
              ],
            ),
          ),
        ],
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: vm.vehicles.asMap().entries.map((e) {
            final index = e.key;
            return GestureDetector(
              onTap: () {
                scrollController.animateTo(
                    index * (getListItemWidth(context) * 0.7),
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 500));
                setState(() {
                  visibleItems = [index];
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 3,
                  backgroundColor: visibleItems.first == index
                      ? appColor.black
                      : appColor.lightGray2,
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  double getListItemWidth(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.6;
}
