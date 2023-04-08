import 'package:dufuna/core/model/property.dart';
import 'package:dufuna/core/model/property_model.dart';
import 'package:dufuna/core/service/db%20_services.dart';
import 'package:dufuna/core/util/colors.dart';
import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/core/widget/property_box.dart';
import 'package:dufuna/presentation/screen/auth/login_screen.dart';
import 'package:dufuna/presentation/screen/provider/olive_provider.dart';
import 'package:dufuna/view_model/admin_view_model.dart';
import 'package:dufuna/view_model/property_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'admin_property_list.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtils.themeBlack,
        bottomNavigationBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: TabBar(
            indicatorColor: ColorUtils.pureWhite,
            controller: _tabController,
            labelColor: Colors.white,
            tabs: const [
              Tab(
                icon: Icon(Icons.watch_later_outlined),
                text: "Unverified",
              ),
              Tab(
                icon: Icon(Icons.done_all),
                text: "Verified",
              ),
              Tab(
                icon: Icon(Icons.no_accounts),
                text: "Rejected",
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: ColorUtils.buttonRed,
          title: Text("Admin Panel"),
          actions: [
            IconButton(
                onPressed: () {
                  context.push(LoginScreen());
                },
                icon: Icon(Icons.logout)),
          ],
        ),
        body: Consumer<AdminViewModel>(builder: (_, value, __) {
          return TabBarView(controller: _tabController, children: [
            AdminPropertyList(
              propertyList: value.unVerifiedProperties,
              showButtons: true,
            ),
            AdminPropertyList(
              propertyList: value.verifiedProperties,
              showButtons: false,
            ),
            AdminPropertyList(
              propertyList: value.rejectedProperties,
              showButtons: false,
            ),
          ]);
        }),
      ),
    );
  }
}
