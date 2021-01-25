import 'package:algo_app/utils/screen_size.dart';
import 'package:algo_app/ux/pages/Home/widgets/category_swicher.dart';
import 'package:algo_app/ux/pages/Home/widgets/configuration.dart';
import 'package:algo_app/ux/providered/pages_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PagesProvider(),
      child: deviceScreenType(MediaQuery.of(context).size.width) ==
              DeviceScreenType.Desktop
          ? const HomeDesktop()
          : const HomeMobile(),
    );
  }
}

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ConfigurationWidget(),
        Expanded(
          child: CategorySwitcher(),
        )
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: const <Widget>[
          Expanded(
            child: ConfigurationWidget(),
          ),
          Expanded(
            child: CategorySwitcher(),
          ),
        ],
      ),
    );
  }
}
