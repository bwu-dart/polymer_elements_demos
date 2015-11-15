/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('paper_card_demo.html')
library polymer_elements_demos.web.paper_card.paper_card_demo;

import 'dart:html' as dom;
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/paper_card.dart';
import 'package:polymer_elements/iron_collapse.dart';
import 'package:polymer_elements/paper_button.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/hardware_icons.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/color.dart';
import 'package:polymer_elements_demos/styles/demo_elements.dart';

/// Silence analyzer [IronCollapse], [PaperButton], [PaperCard], [PaperIconButton],
@PolymerRegister('paper-card-demo')
class PaperCardDemo extends PolymerElement {
  PaperCardDemo.created() : super.created();

  @property String moreInfoIcon = 'hardware:keyboard-arrow-down';

  @reflectable
  void decreaseShadow([_, __]) {
    PaperCard card = $['shadow_demo'];
    card.elevation = card.elevation > 0 ? card.elevation - 1 : 0;
  }

  @reflectable
  void increaseShadow([_, __]) {
    PaperCard card = $['shadow_demo'];
    card.elevation = card.elevation < 5 ? card.elevation + 1 : 5;
  }

  @reflectable
  void toggleMoreInfo(dom.CustomEvent event, [_]) {
    IronCollapse moreInfo = $['more-info'];
    set('moreInfoIcon', moreInfoIcon == moreInfo.opened ? 'hardware:keyboard-arrow-down'
                                      : 'hardware:keyboard-arrow-up');
    moreInfo.toggle();
  }
}
