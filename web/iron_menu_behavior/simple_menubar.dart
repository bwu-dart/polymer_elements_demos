/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('simple_menubar.html')
library polymer_elements_demos.web.web.iron_menu_behavior.simple_menubar;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/iron_menubar_behavior.dart';
import 'package:polymer_elements/iron_a11y_keys_behavior.dart';
import 'package:polymer_elements/iron_multi_selectable.dart';
import 'package:polymer_elements/iron_selectable.dart';
import 'package:polymer_elements/iron_menu_behavior.dart';

/// Silence analyzer
@PolymerRegister('simple-menubar')
class SimpleMenubar extends PolymerElement
    with
        IronSelectableBehavior,
        IronMultiSelectableBehavior,
        IronA11yKeysBehavior,
        IronMenuBehavior,
        IronMenubarBehavior {
  SimpleMenubar.created() : super.created();
}
