/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('x_card.html')
library polymer_elements_demos.web.web.neon_animation.x_card;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/neon_shared_element_animatable_behavior.dart';
import 'package:polymer_elements/neon_animatable_behavior.dart';

/// Silence analyzer
@PolymerRegister('x-card')
class XCard extends PolymerElement
    with NeonAnimatableBehavior, NeonSharedElementAnimatableBehavior {
  XCard.created() : super.created();

  @property Map animationConfig;
  @property Map sharedElement;
  ready() {
    set('animationConfig', {
      'entry': [
        {'name': 'ripple-animation', 'id': 'ripple', 'toPage': this},
        {
          'name': 'fade-out-animation',
          'node': $['placeholder'],
          'timing': {'delay': 250}
        },
        {
          'name': 'fade-in-animation',
          'node': $['container'],
          'timing': {'delay': 50}
        }
      ],
      'exit': [
        {'name': 'opaque-animation', 'node': $['placeholder']},
        {
          'name': 'fade-out-animation',
          'node': $['container'],
          'timing': {'duration': 0}
        },
        {
          'name': 'reverse-ripple-animation',
          'id': 'reverse-ripple',
          'fromPage': this
        }
      ]
    });

    set('sharedElements',
        {'ripple': $['placeholder'], 'reverse-ripple': $['placeholder']});
  }
}
