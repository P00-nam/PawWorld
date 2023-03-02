import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_svg/svg.dart';

class Appearance extends StatelessWidget {
  const Appearance({super.key});

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Theme',
        subtitle: 'Dark',
        leading: SvgPicture.asset('asset/light_theme.svg'),
        onTap: () {},
        child: SettingsScreen(title: 'Theme', children: <Widget>[
          buildDark(context),
        ]),
      );
}

Widget buildDark(BuildContext context) => SimpleSettingsTile(
      title: 'Dark',
      subtitle: '',
      leading: SvgPicture.asset('asset/light_theme.svg'),
      onTap: () {},
    );
