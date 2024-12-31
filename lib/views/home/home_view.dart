import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sampark/config/app_colors.dart';
import 'package:sampark/config/app_images.dart';
import 'package:sampark/config/app_strings.dart';
import 'package:sampark/config/components/appbar.dart';
import 'package:sampark/config/components/card_tile.dart';
import 'package:sampark/config/routes/routes_name.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  TabController? controller;

  int setTabIndex = 0;
  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    controller!.addListener(() {
      setTabIndex = controller!.index;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          context: context,
          title: Text(AppStrings.appName),
          bgColor: AppColors.dContainerColor,
          isLeading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppImages.logoUrl,
                width: 25,
              )),
          action: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ]),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: 42,
            color: AppColors.dContainerColor,
            child: TabBar(
                tabAlignment: TabAlignment.fill,
                controller: controller,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: AppColors.dPrimaryColor,
                labelColor: AppColors.dPrimaryColor,
                unselectedLabelStyle: TextStyle(color: AppColors.dGreyColor),
                labelStyle: Theme.of(context).textTheme.labelLarge,
                tabs: const [
                  Tab(
                    text: "Chats",
                  ),
                  Tab(
                    text: "Groups",
                  ),
                  Tab(
                    text: "Calls",
                  ),
                ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: TabBarView(controller: controller, children: [
              ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return const CardTile();
                  }),
              const Center(child: Text("Hi")),
              const Center(child: Text("Hi")),
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.dPrimaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
