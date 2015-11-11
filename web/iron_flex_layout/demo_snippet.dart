/*
@license
Copyright (c) 2015 The Polymer Project Authors. All rights reserved.
This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
Code distributed by Google as part of the polymer project is also
subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
*/
@HtmlImport('demo_snippet.html')
library polymer_elements_demos.web.web.iron_flex_layout.demo_snippet;

import 'dart:html' as dom;
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:polymer_elements/prism_highlighter.dart';
import 'package:polymer_elements/marked_element.dart';

/// Silence analyzer [PrismHighlighter], [MarkedElement]
@PolymerRegister('demo-snippet')
class DemoSnippet extends PolymerElement {
  DemoSnippet.created() : super.created();

  @property String markdown = '';

  @override
  void attached() {
    var template = new PolymerDom(this).queryDistributedElements('template')[0];

    String snippet = _getInnerHtml(template);
    markdown = '```\n${snippet}\n```';

    // Stamp the template.
//      new PolymerDom(this)
//          .append(dom.document.importNode(template.content, true));
  }

  String _getInnerHtml(dom.Node node) {
    if (node is dom.TemplateElement) {
      node = (node as dom.TemplateElement).content;
    }
    var s = '';
    var c$ = new PolymerDom(node).childNodes;

    for (var i = 0, l = c$.length, child; (i < l) && (child = c$[i]); i++) {
      s += _getOuterHTML(child, node);
    }
    return s;
  }

  String _getOuterHTML(dom.Node node, dom.Element parentNode) {
    if (node is dom.Element) {
      dom.Element element = node;
      //var tagName = node.tagName.toLowerCase();
      var tagName = element.localName;
      var s = '<' + tagName;
      var attrs = element.attributes;
      for (var i = 0, attr; attr = attrs[i]; i++) {
        s = '$s ${attr['name']}="${_escapeAttr(attr['value'])}"';
      }
      s += '>';
      if (_voidElements[tagName]) {
        return s;
      }
      return '${s}${_getInnerHtml(node)}</${tagName}>';
    } else if (node is dom.Text) {
      var data = node.data;
      if (parentNode != null && _plaintextParents[parentNode.localName]) {
        return data;
      }
      return _escapeData(data);
    } else if (node is dom.Comment) {
      return '<!--${node.data}-->';
    } else {
      print(node);
      throw 'not implemented';
    }
  }

  static final _plaintextParents = new Set.from([
    'style',
    'script',
    'xmp',
    'iframe',
    'noembed',
    'noframes',
    'plaintext',
    'noscript'
  ]);

  // http://www.whatwg.org/specs/web-apps/current-work/#void-elements
  static final _voidElements = new Set.from([
    'area',
    'base',
    'br',
    'col',
    'command',
    'embed',
    'hr',
    'img',
    'input',
    'keygen',
    'link',
    'meta',
    'param',
    'source',
    'track',
    'wbr'
  ]);

  // http://www.whatwg.org/specs/web-apps/current-work/multipage/the-end.html#escapingString
  static const escapeAttrRegExp = r'[&\u00A0"]';
  static const escapeDataRegExp = r'[&\u00A0<>]';

  String _escapeReplace(Match c) {
    switch (c.group(1)) {
      case '&':
        return '&amp;';
      case '<':
        return '&lt;';
      case '>':
        return '&gt;';
      case '"':
        return '&quot;';
      case '\u00A0':
        return '&nbsp;';
    }
    return '';
  }

  String _escapeAttr(String s) {
    return s.replaceAllMapped(escapeAttrRegExp, _escapeReplace);
  }

  String _escapeData(String s) {
    return s.replaceAllMapped(escapeDataRegExp, _escapeReplace);
  }
}
