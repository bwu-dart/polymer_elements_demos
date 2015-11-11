/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('prism_demo.html')
library polymer_elements_demos.web.web.prism_elementprism_demo;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/prism_highlighter.dart';

/// Silence analyzer [PrismHighlighter]
@PolymerRegister('prism-demo')
class PrismDemo extends PolymerElement {
  PrismDemo.created() : super.created();

  @Property(observer: 'render') String code;

  @property String lang;

  @override
  void attached() {
    render();
  }

  void render([_, __]) {
    $['output'].innerHtml = highlight(code, lang);
  }

  highlight(String code, String lang) {
    var event = fire('syntax-highlight', detail: {code: code, lang: lang});
    return event.detail.code;
  }
}
