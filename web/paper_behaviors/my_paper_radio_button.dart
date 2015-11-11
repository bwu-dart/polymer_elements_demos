/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('my_paper_radio_button.html')
library polymer_elements_demos.web.web.paper_behaviors.my_paper_radio_button;

import 'dart:html' as dom;
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/paper_checked_element_behavior.dart';
import 'package:polymer_elements/iron_button_state.dart';
import 'package:polymer_elements/iron_control_state.dart';
import 'package:polymer_elements/iron_a11y_keys_behavior.dart';
import 'package:polymer_elements/paper_inky_focus_behavior.dart';
import 'package:polymer_elements/iron_checked_element_behavior.dart';
import 'package:polymer_elements/iron_form_element_behavior.dart';
import 'package:polymer_elements/iron_validatable_behavior.dart';
import 'package:polymer_elements/paper_ripple_behavior.dart';

/// Silence analyzer
@PolymerRegister('my-paper-radio-button')
class MyPaperRadioButton extends PolymerElement
    with
        IronA11yKeysBehavior,
        IronButtonState,
        IronControlState,
        PaperRippleBehavior,
        PaperInkyFocusBehavior,
        IronFormElementBehavior,
        IronValidatableBehavior,
        IronCheckedElementBehavior,
        PaperCheckedElementBehavior {
  MyPaperRadioButton.created() : super.created();

  static var hostAttributes = {'role': 'radio'};

  dom.Element _rippleContainer;

  void ready() {
    toggles = true;
  }

  void createRipple() {
    _rippleContainer = $['radioContainer'];
    return Polymer.PaperInkyFocusBehaviorImpl._createRipple.call(this);
  }
}
