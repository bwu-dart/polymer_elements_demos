/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('sample_content.html')
library polymer_elements_demo.web.web.paper_scroll_header_panel.sample_content;

import 'dart:html' as dom;
import 'dart:math' as math;
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';

/// Silence analyzer
@PolymerRegister('sample-content')
class SampleContent extends PolymerElement {
  SampleContent.created() : super.created();

  @property List strings = [
    'Lorem ipsum dolor sit amet, per in nusquam nominavi periculis, sit elit oportere ea.',
    'Ut labores minimum atomorum pro. Laudem tibique ut has.',
    'Fugit adolescens vis et, ei graeci forensibus sed.',
    'Convenire definiebas scriptorem eu cum. Sit dolor dicunt consectetuer no.',
    'Ea duis bonorum nec, falli paulo aliquid ei eum.',
    'Usu eu novum principes, vel quodsi aliquip ea.',
    'Has at minim mucius aliquam, est id tempor laoreet.',
    'Pro saepe pertinax ei, ad pri animal labores suscipiantur.',
    'Detracto suavitate repudiandae no eum. Id adhuc minim soluta nam.',
    'Iisque perfecto dissentiet cum et, sit ut quot mandamus, ut vim tibique splendide instructior.',
    'Id nam odio natum malorum, tibique copiosae expetenda mel ea.',
    'Cu mei vide viris gloriatur, at populo eripuit sit.',
    'Modus commodo minimum eum te, vero utinam assueverit per eu.',
    'No nam ipsum lorem aliquip, accumsan quaerendum ei usu.'
  ];

  final _random = new math.Random();
  @reflectable
  String randomString() =>
      strings[(_random.nextDouble() * strings.length).floor()];

  @reflectable
  String randomLetter() =>
      new String.fromCharCode(65 + (_random.nextDouble() * 26).floor());

  @Property(observer: 'sizeChanged') num size = 0;

  @reflectable
  void sizeChanged([_, __]) {
    var html = '';
    for (var i = 0; i < size; i++) {
      html +=
          '<div style="border: 1px solid #bebebe; padding: 16px; margin: 16px; border-radius: 5px; background-color: #fff; color: #555;">'
          '<div style="display: inline-block; height: 64px; width: 64px; border-radius: 50%; background: #ddd; line-height: 64px; font-size: 30px; color: #666; text-align: center;">${randomLetter()}</div>'
          '<div style="font-size: 22px; padding: 8px 0 16px; color: #888;">${randomString()}</div>'
          '<div style="font-size: 16px; padding-bottom: 8px;">${randomString()}</div>'
          '<div style="font-size: 12px;">${randomString()}</div>'
          '<div style="font-size: 12px;">${randomString()}</div>'
          '</div>';
      ($['content'] as dom.DivElement)
          .setInnerHtml(html, treeSanitizer: dom.NodeTreeSanitizer.trusted);
    }
  }
}
