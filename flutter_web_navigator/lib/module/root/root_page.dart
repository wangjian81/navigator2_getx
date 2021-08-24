/* ROOT */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        final title = current?.location;
        print(title);
        return Scaffold(
          drawer: DrawerWidget(),
          appBar: AppBar(title: Text(title ?? '')),
          body: GetRouterOutlet(
            initialRoute: '/splash',
          ),
        );
      },
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.red,
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
