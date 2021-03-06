/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('iron_a11y_keys_demo.html')
library polymer_elements_demos.web.iron_a11y_keys.iron_a11y_keys_demo;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements_demos/styles/demo_elements.dart';
import 'x_key_aware.dart';

/// Silence analyzer [XKeyAware], [DemoElements]
@PolymerRegister('iron-a11y-keys-demo')
class IronA11yKeysDemo extends PolymerElement {
  IronA11yKeysDemo.created() : super.created();
}
