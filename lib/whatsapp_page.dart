import 'package:flutter/material.dart';
import 'package:ui_whatsapp/theme.dart';
import 'package:ui_whatsapp/widgets/chats_view.dart';
import 'package:ui_whatsapp/widgets/status_view.dart';
import 'package:ui_whatsapp/widgets/calls_view.dart';

class WhatsappPage extends StatefulWidget {
  const WhatsappPage({super.key});

  @override
  State<WhatsappPage> createState() => _WhatsappPageState();
}

class _WhatsappPageState extends State<WhatsappPage>
    with SingleTickerProviderStateMixin {
  final tabs = const [
    Tab(icon: Icon(Icons.camera_alt)),

    Tab(text: "CHATS"),

    Tab(text: "STATUS"),

    Tab(text: "CALLS"),
  ];

  TabController? tabController;
  var fabIcon = Icons.message;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    tabController?.index = 1;
    tabController?.addListener(() {
      setState(() {
        switch (tabController!.index) {
          case 0:
            fabIcon = Icons.camera;
            break;
          case 1:
            fabIcon = Icons.message;
            break;
          case 2:
            fabIcon = Icons.camera_alt;
            break;
          case 3:
            fabIcon = Icons.call;
            break;
          default:
            fabIcon = Icons.message;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WhatsAppColor,
        title: const Text('Whatsapp'),
        actions: const [
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(Icons.more_vert),
          ),
        ],

        bottom: TabBar(
          controller: tabController,
          tabs: tabs,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(child: Icon(Icons.camera_alt)),
          ChatsView(),
          StatusView(),
          CallsView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: WhatsAppLightGreen,
        child: Icon(fabIcon),
      ),
    );
  }
}
