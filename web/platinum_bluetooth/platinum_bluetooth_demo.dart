/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('platinum_bluetooth_demo.html')
library polymer_elements_demos.web.platinum_bluetooth.platinum_bluetooth_demo;

import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/marked_element.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_progress.dart';
import 'package:polymer_elements/paper_button.dart';
import 'package:polymer_elements/platinum_bluetooth_device.dart';
import 'package:polymer_elements/platinum_bluetooth_characteristic.dart';
import 'package:polymer_elements_demos/styles/demo_elements.dart';

/// Silence analyzer [MarkedElement], [PaperItem], [PaperMaterial], [PaperProgress], [PaperButton], [PlatinumBluetoothDevice], [PlatinumBluetoothCharacteristic], [DemoElements],
@PolymerRegister('platinum-bluetooth-demo')
class PlatinumBluetoothDemo extends PolymerElement {
  PlatinumBluetoothDemo.created() : super.created();

    PlatinumBluetoothDevice batteryDevice = document.getElementById('battery-device');
    var batteryLevel = batteryDevice.querySelector('[characteristic=battery_level]');

    var heartRateDevice = document.getElementById('heart-rate-device');
    var bodySensorLocation = heartRateDevice.querySelector('[characteristic=body_sensor_location]');
    var heartRateControlPoint = heartRateDevice.querySelector('[characteristic=heart_rate_control_point]');

    var getBatteryLevelButton = document.getElementById('get-battery-level');
    var getBodySensorLocationButton = document.getElementById('get-body-sensor-location');
    var resetEnergyExpendedButton = document.getElementById('reset-energy-expended');
    var progressBar = document.querySelector('paper-progress');

    var buttons = document.querySelectorAll('paper-button');
    for (var i = 0; i < buttons.length; i++) {
      buttons[i].addEventListener('click', buttonClick);
    }

    getBatteryLevelButton.addEventListener('click', function() {
      batteryDevice.request().then(function(device) {
        return batteryLevel.read().then(function(value) {
          var data = new DataView(value);
          template.text = device.name + ' Battery Level is ' + data.getUint8(0) + '%';
          progressBar.indeterminate = false;
        })
      })
      .catch(onError);
    });

    getBodySensorLocationButton.addEventListener('click', function() {
      heartRateDevice.request().then(function(device) {
        return bodySensorLocation.read().then(function(value) {
          var data = new DataView(value);
          var loc = ['other', 'chest', 'wrist', 'finger', 'hand', 'ear lobe', 'foot'];
          template.text = device.name + ' Body sensor is placed on the ' + loc[data.getUint8(0)];
          progressBar.indeterminate = false;
        })
      })
      .catch(onError);
    });

    resetEnergyExpendedButton.addEventListener('click', function() {
      heartRateDevice.request().then(function(device) {
        // Writing 1 is the signal to reset energy expended.
        var resetEnergyExpended = new Uint8Array([1]);
        return heartRateControlPoint.write(resetEnergyExpended).then(function() {
          template.text = device.name + ' Energy expended has been reset';
          progressBar.indeterminate = false;
        })
      })
      .catch(onError);
    });

    function buttonClick() {
      progressBar.indeterminate = true;
      template.text = '';
    }

    function onError(error) {
      template.text = 'Argh! ' + error;
      progressBar.indeterminate = false;
    }
}
