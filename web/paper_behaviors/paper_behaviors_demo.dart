/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('paper_behaviors_demo.html')
library polymer_elements_demos.web.paper_behaviors.paper_behaviors_demo;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements_demos/styles/demo_elements.dart';
import 'my_paper_button.dart';
import 'my_paper_radio_button.dart';

/// Silence analyzer [DemoElements], [MyPaperButton], [MyPaperRadioButton],
@PolymerRegister('paper-behaviors-demo')
class PaperBehaviorsDemo extends PolymerElement {
  PaperBehaviorsDemo.created() : super.created();
}
