import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:think_hat_test/core/assets.dart';
import 'package:think_hat_test/core/data/model/home_page_data.dart';
import 'package:think_hat_test/core/navigator_manager.dart';
import 'package:think_hat_test/core/theme.dart';
import 'package:think_hat_test/features/home/presentation/vm/home_vm.dart';
import 'package:think_hat_test/features/dashboard/presentation/widget/appbar.dart';
import 'package:think_hat_test/features/dashboard/presentation/screen/dashboard_page.dart';
import 'package:think_hat_test/features/home/presentation/widget/page_wrapper.dart';
import 'package:think_hat_test/features/orders/presentation/screen/order_page.dart';
import 'package:think_hat_test/features/profile/presentation/screen/profile_page.dart';
import 'package:provider/provider.dart';

const appBarTopPadding = 14.0;
const horizontalGap = 20.0;
const verticalGap = 16.0;
const iconSize = 28.0;

const pages = [
  HomePageData(
    label: 'Home',
    icon: homeIcon,
    page: DashboardPage(),
  ),
  HomePageData(
    label: 'Orders',
    icon: orderIcon,
    page: OrderPage(),
  ),
  HomePageData(
    label: 'Cart',
    icon: cartIcon,
  ),
  HomePageData(
    label: 'Settings',
    icon: settingsIcon,
    page: ProfilePage(),
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: appColor.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: appColor.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: const Scaffold(
        bottomNavigationBar: PageWrapper(
          child: _BottomNavigationWidget(),
        ),
        body: SafeArea(child: PageBody()),
      ),
    );
  }
}

class PageBody extends StatelessWidget {
  const PageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<HomePageViewModel>();
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppBar(),
          const SizedBox(
            height: verticalGap,
          ),
          pages.map((e) => e.page).toList()[viewModel.selectedTab] ??
              const SizedBox(),
          // IndexedStack(
          //   index: viewModel.selectedTab,
          //   children: pages
          //       .map((e) => Container(
          //         padding: const EdgeInsets.symmetric(
          //             // horizontal: Dims.appSideGap,
          //             vertical: Dims.appVertGap),
          //         child: e.page,
          //       ))
          //       .toList(),
          // ),
        ],
      ),
    );
  }
}

class _BottomNavigationWidget extends StatelessWidget {
  const _BottomNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomePageViewModel>();
    final readVm = context.read<HomePageViewModel>();
    return SizedBox(
      height: 75,
      child: BottomNavigationBar(
        backgroundColor: appColor.lightGray,
        currentIndex: vm.selectedTab,
        onTap: (index) {
          readVm.selectedTab = index;
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: appColor.primary,
        unselectedItemColor: appColor.lightGray,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        iconSize: iconSize,
        items: pages
            .asMap()
            .entries
            .map((e) => BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    e.value.icon,
                    color: appColor.black,
                  ),
                  icon: SvgPicture.asset(e.value.icon,color: appColor.black.withOpacity(0.3),),
                  label: e.value.label,
                ))
            .toList(),
      ),
    );
  }
}

class TmpPage extends StatelessWidget {
  const TmpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(NavigatorManager.orderDetails);
                },
                child: Text(
                  "go",
                  style: appTheme.light.textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SliderProgress extends StatelessWidget {
  const SliderProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 16,
            height: 5,
            // color: appColor.black,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: appColor.black),
          ),
          const SizedBox(
            width: 4,
          ),
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(108), color: appColor.gray),
          ),
          const SizedBox(
            width: 4,
          ),
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(108), color: appColor.gray),
          )
        ],
      ),
    );
  }
}

class PairValue {
  String value1;
  String value2;

  PairValue(this.value1, this.value2);
}
