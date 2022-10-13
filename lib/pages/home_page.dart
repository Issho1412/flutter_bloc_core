import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/base/base_state.dart';
import 'package:src_core_bloc/core/util/helper.dart';
import 'package:src_core_bloc/core/util/style/colors.dart';
import 'package:src_core_bloc/core/util/style/others.dart';
import 'package:src_core_bloc/features/home/home_bloc.dart';
import 'package:src_core_bloc/features/home/home_event.dart';
import 'package:src_core_bloc/routes.dart';
import 'package:src_core_bloc/widgets/home/profile/profile_view.dart';
import 'package:src_core_bloc/widgets/home/setting_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _homeBloc.tabController = TabController(length: 4, vsync: this);
    _homeBloc.tabController.addListener(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    _homeBloc.tabController.dispose();
    super.dispose();
  }

  @override
  Future<bool> didPopRoute() {
    bool override;
    override = true;
    return Future<bool>.value(override);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper().onWillPop,
      child: BlocBuilder<HomeBloc, BaseState>(
        bloc: _homeBloc,
        builder: (context, state) {
          return DefaultTabController(
            length: 4,
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: (){ Helper().navigateTo(qrcodeRoute); },
                backgroundColor: ColorConst.kPrimaryColor,
                child: const Icon(Icons.qr_code_scanner_outlined,),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _homeBloc.tabController,
                children: const <Widget>[
                  Text('TAB A'),
                  Text('TAB C'),
                  SettingView(),
                  ProfileView(),
                ],
              ),
              bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: StyleOthersConst.kMarginDefault / 2,
                child: BottomNavigationBar(
                  backgroundColor: ColorConst.kTransparent,
                  currentIndex: _homeBloc.currentTabIndex,
                  elevation: 0,
                  iconSize: StyleOthersConst.kSize * 1.4,
                  onTap: (int mindex) {
                    _homeBloc.add(OnSetTabIndex(index: mindex));
                  },
                  selectedItemColor: ColorConst.kPrimaryColor,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.history_outlined),
                      label: 'History',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.message_rounded),
                      label: 'Messages',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
