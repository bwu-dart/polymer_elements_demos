/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('iron_component_page_demo.html')
library polymer_elements_demos.web.iron_component_page.iron_component_page_demo;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/iron_component_page.dart';
import 'package:polymer_elements_demos/styles/demo_elements.dart';

/// Silence analyzer [IronComponentPage], [DemoElements],
/// [IronComponentPageStyles]
@PolymerRegister('iron-component-page-demo')
class IronComponentPageDemo extends PolymerElement {
  IronComponentPageDemo.created() : super.created();
}
