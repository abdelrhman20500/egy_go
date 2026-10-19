import 'package:egy_go/features/discover/presentation/view/discover_view.dart';
import 'package:egy_go/features/home/presentation/view/home_view.dart';
import 'package:egy_go/features/profile/presentation/view/profile_view.dart';
import 'package:egy_go/features/saved/presentation/view/saved_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_manager/nav_bar_cubit.dart';
import '../view_manager/nav_bar_state.dart';

class LayoutView extends StatelessWidget {
  LayoutView({super.key});
  static const String routeName = "LayoutView";
  final List<Widget> tabs = [
    const HomeView(),
    const DiscoverView(),
    const SavedView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<NavBarCubit>(context);
          return Scaffold(
            body: SafeArea(child: tabs[cubit.currentIndex]),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) => cubit.changeIndex(index),
                type: BottomNavigationBarType
                    .fixed, // ensures all 4 items show labels
                backgroundColor: Colors.white,
                selectedItemColor: Color(0xFFC89B3C),
                unselectedItemColor: Colors.grey,
                selectedLabelStyle: TextStyle(color: Color(0xFF0D4040)),
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore),
                    label: 'Discover',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.save),
                    label: 'Saved',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
