import 'package:aa_task1/commond/provider/bottom_nav.dart';
import 'package:aa_task1/presentation/screens/add.dart';
import 'package:aa_task1/presentation/screens/home.dart';
import 'package:aa_task1/presentation/screens/remove.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNav extends ConsumerStatefulWidget {
  const BottomNav({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomNavState();
}

class _BottomNavState extends ConsumerState<BottomNav> {
  PageController pageController = PageController();
  final List<Widget> pages = [
    const HomeScreen(),
    const AddScreen(),
    const RemoveScreen()
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: SafeArea(
              bottom: false,
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (page) {
                  ref.read(bottomNavIndexProvider.notifier).state = page;
                },
                itemBuilder: (context, index) => pages[index],
              ),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            height: 60,
            child: Consumer(builder: (context, ref, child) {
              final index = ref.watch(bottomNavIndexProvider);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      ref.read(bottomNavIndexProvider.notifier).state = 0;
                      pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    icon: Icon(
                      Icons.home,
                      color: index == 0 ? Colors.black : Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(bottomNavIndexProvider.notifier).state = 1;
                      pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    icon: Icon(
                      Icons.add,
                      color: index == 1 ? Colors.black : Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(bottomNavIndexProvider.notifier).state = 2;
                      pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    icon: Icon(
                      Icons.remove,
                      color: index == 2 ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
