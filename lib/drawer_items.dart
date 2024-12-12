import 'drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerItems {
  static const home = DrawerItem(
      title: 'श्रीपाद श्रीवल्लभ चरित्रामृत अध्याय',
      icon: Icons.import_contacts);
  static const audioapp = DrawerItem(
      title: 'श्रीपाद श्रीवल्लभ चरित्रामृत ऑडियो', icon: Icons.get_app);
  static const stotra = DrawerItem(
      title: 'श्रीपाद श्रीवल्लभ स्तोत्रम् ', icon: Icons.text_snippet);
  static const arti =
  DrawerItem(title: 'आरती ', icon: Icons.filter_vintage_sharp);
  // festival
  static const sidhhamangal =
  DrawerItem(title: 'सिद्धमंगलस्तोत्र ', icon: Icons.spa);
  static const parayan =
  DrawerItem(title: 'पारायण पद्धती ', icon: Icons.speaker_notes);
  static const phal = DrawerItem(title: 'अध्याय पठणाचे फल', icon: Icons.yard);
  static const uddhar =
  DrawerItem(title: 'घोरकष्टोद्धरणस्तोत्रम्', icon: Icons.emoji_emotions);
  static const abhay =
  DrawerItem(title: 'अभय वचने', icon: Icons.brightness_5_outlined);



  static final List<DrawerItem> all = [
    home,
    audioapp,
    stotra,
    arti,
    sidhhamangal,
    uddhar,
    abhay,
    parayan,
    phal,


  ];
}


