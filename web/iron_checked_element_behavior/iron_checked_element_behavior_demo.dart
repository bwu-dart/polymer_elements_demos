/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('iron_checked_element_behavior_demo.html')
library polymer_elements_demos.web.iron_checked_element_behavior.iron_checked_element_behavior_demo;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements_demos/styles/demo_elements.dart';
import 'simple_checkbox.dart';

/// Silence analyzer [SimpleCheckbox], [DemoElements]
@PolymerRegister('iron-checked-element-behavior-demo')
class IronCheckedElementBehaviorDemo extends PolymerElement {
  IronCheckedElementBehaviorDemo.created() : super.created();
}
