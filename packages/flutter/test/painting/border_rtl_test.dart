// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';

import '../rendering/mock_canvas.dart';

class SillyBorder extends BoxBorder {
  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

void main() {
  test('BoxBorder.lerp', () {
    // names of the form fooAtX are foo, lerped X% of the way to null
    final BoxBorder directionalWithMagentaTop5 = const BorderDirectional(top: const BorderSide(color: const Color(0xFFFF00FF), width: 5.0));
    final BoxBorder directionalWithMagentaTop5At25 = const BorderDirectional(top: const BorderSide(color: const Color(0x3F3F003F), width: 1.25));
    final BoxBorder directionalWithMagentaTop5At75 = const BorderDirectional(top: const BorderSide(color: const Color(0xBFBF00BF), width: 3.75));
    final BoxBorder directionalWithSides10 = const BorderDirectional(start: const BorderSide(width: 10.0), end: const BorderSide(width: 20.0));
    final BoxBorder directionalWithSides10At25 = const BorderDirectional(start: const BorderSide(width: 2.5, color: const Color(0x3F000000)), end: const BorderSide(width: 5.0, color: const Color(0x3F000000)));
    final BoxBorder directionalWithSides10At50 = const BorderDirectional(start: const BorderSide(width: 5.0, color: const Color(0x7F000000)), end: const BorderSide(width: 10.0, color: const Color(0x7F000000)));
    final BoxBorder directionalWithSides10At75 = const BorderDirectional(start: const BorderSide(width: 7.5, color: const Color(0xBF000000)), end: const BorderSide(width: 15.0, color: const Color(0xBF000000)));
    final BoxBorder directionalWithSides20 = const BorderDirectional(start: const BorderSide(width: 20.0), end: const BorderSide(width: 40.0));
    final BoxBorder directionalWithSides30 = const BorderDirectional(start: const BorderSide(width: 30.0), end: const BorderSide(width: 60.0));
    final BoxBorder directionalWithTop10 = const BorderDirectional(top: const BorderSide(width: 10.0));
    final BoxBorder directionalWithYellowTop10 = const BorderDirectional(top: const BorderSide(color: const Color(0xFFFFFF00), width: 10.0));
    final BoxBorder directionalWithYellowTop5 = const BorderDirectional(top: const BorderSide(color: const Color(0xFFFFFF00), width: 5.0));
    final BoxBorder visualWithMagentaTop10 = const Border(top: const BorderSide(color: const Color(0xFFFF00FF), width: 10.0));
    final BoxBorder visualWithMagentaTop5 = const Border(top: const BorderSide(color: const Color(0xFFFF00FF), width: 5.0));
    final BoxBorder visualWithSides10 = const Border(left: const BorderSide(width: 10.0), right: const BorderSide(width: 20.0));
    final BoxBorder visualWithSides10At25 = const Border(left: const BorderSide(width: 2.5, color: const Color(0x3F000000)), right: const BorderSide(width: 5.0, color: const Color(0x3F000000)));
    final BoxBorder visualWithSides10At50 = const Border(left: const BorderSide(width: 5.0, color: const Color(0x7F000000)), right: const BorderSide(width: 10.0, color: const Color(0x7F000000)));
    final BoxBorder visualWithSides10At75 = const Border(left: const BorderSide(width: 7.5, color: const Color(0xBF000000)), right: const BorderSide(width: 15.0, color: const Color(0xBF000000)));
    final BoxBorder visualWithSides20 = const Border(left: const BorderSide(width: 20.0), right: const BorderSide(width: 40.0));
    final BoxBorder visualWithSides30 = const Border(left: const BorderSide(width: 30.0), right: const BorderSide(width: 60.0));
    final BoxBorder visualWithTop10 = const Border(top: const BorderSide(width: 10.0));
    final BoxBorder visualWithTop100 = const Border(top: const BorderSide(width: 100.0));
    final BoxBorder visualWithTop190 = const Border(top: const BorderSide(width: 190.0));
    final BoxBorder visualWithYellowTop5 = const Border(top: const BorderSide(color: const Color(0xFFFFFF00), width: 5.0));
    final BoxBorder visualWithYellowTop5At25 = const Border(top: const BorderSide(color: const Color(0x3F3F3F00), width: 1.25));
    final BoxBorder visualWithYellowTop5At75 = const Border(top: const BorderSide(color: const Color(0xBFBFBF00), width: 3.75));

    expect(BoxBorder.lerp(null, null, -1.0), null);
    expect(BoxBorder.lerp(new Border.all(width: 10.0), null, -1.0), new Border.all(width: 20.0));
    expect(BoxBorder.lerp(null, new Border.all(width: 10.0), -1.0), new Border.all(width: 0.0, style: BorderStyle.none));
    expect(BoxBorder.lerp(directionalWithTop10, null, -1.0), const BorderDirectional(top: const BorderSide(width: 20.0)));
    expect(BoxBorder.lerp(null, directionalWithTop10, -1.0), const BorderDirectional());
    expect(BoxBorder.lerp(directionalWithTop10, visualWithTop100, -1.0), const Border());
    expect(BoxBorder.lerp(visualWithSides10, directionalWithMagentaTop5, -1.0), visualWithSides20);
    expect(BoxBorder.lerp(visualWithYellowTop5, directionalWithMagentaTop5, -1.0), const Border(top: const BorderSide(color: const Color(0xFFFFFF00), width: 5.0)));
    expect(BoxBorder.lerp(visualWithSides10, directionalWithSides10, -1.0), visualWithSides30);
    expect(BoxBorder.lerp(visualWithYellowTop5, directionalWithSides10, -1.0), directionalWithYellowTop10);
    expect(() => BoxBorder.lerp(new SillyBorder(), const Border(), -1.0), throwsFlutterError);

    expect(BoxBorder.lerp(null, null, 0.0), null);
    expect(BoxBorder.lerp(new Border.all(width: 10.0), null, 0.0), new Border.all(width: 10.0));
    expect(BoxBorder.lerp(null, new Border.all(width: 10.0), 0.0), const Border());
    expect(BoxBorder.lerp(directionalWithTop10, null, 0.0), const BorderDirectional(top: const BorderSide(width: 10.0)));
    expect(BoxBorder.lerp(null, directionalWithTop10, 0.0), const BorderDirectional());
    expect(BoxBorder.lerp(directionalWithTop10, visualWithTop100, 0.0), visualWithTop10);
    expect(BoxBorder.lerp(visualWithSides10, directionalWithMagentaTop5, 0.0), visualWithSides10);
    expect(BoxBorder.lerp(visualWithYellowTop5, directionalWithMagentaTop5, 0.0), const Border(top: const BorderSide(color: const Color(0xFFFFFF00), width: 5.0)));
    expect(BoxBorder.lerp(visualWithSides10, directionalWithSides10, 0.0), visualWithSides10);
    expect(BoxBorder.lerp(visualWithYellowTop5, directionalWithSides10, 0.0), directionalWithYellowTop5);
    expect(() => BoxBorder.lerp(new SillyBorder(), const Border(), 0.0), throwsFlutterError);

    expect(BoxBorder.lerp(null, null, 0.25), null);
    expect(BoxBorder.lerp(new Border.all(width: 10.0), null, 0.25), new Border.all(width: 7.5));
    expect(BoxBorder.lerp(null, new Border.all(width: 10.0), 0.25), new Border.all(width: 2.5));
    expect(BoxBorder.lerp(directionalWithTop10, null, 0.25), const BorderDirectional(top: const BorderSide(width: 7.5)));
    expect(BoxBorder.lerp(null, directionalWithTop10, 0.25), const BorderDirectional(top: const BorderSide(width: 2.5)));
    expect(BoxBorder.lerp(directionalWithTop10, visualWithTop100, 0.25), const Border(top: const BorderSide(width: 32.5)));
    expect(BoxBorder.lerp(visualWithSides10, directionalWithMagentaTop5, 0.25), visualWithSides10At75 + directionalWithMagentaTop5At25);
    expect(BoxBorder.lerp(visualWithYellowTop5, directionalWithMagentaTop5, 0.25), new Border(top: new BorderSide(width: 5.0, color: Color.lerp(const Color(0xFFFFFF00), const Color(0xFFFF00FF), 0.25))));
    expect(BoxBorder.lerp(visualWithSides10, directionalWithSides10, 0.25), visualWithSides10At50);
    expect(BoxBorder.lerp(visualWithYellowTop5, directionalWithSides10, 0.25), visualWithYellowTop5At75 + directionalWithSides10At25);
    expect(() => BoxBorder.lerp(new SillyBorder(), const Border(), 0.25), throwsFlutterError);

    expect(BoxBorder.lerp(null, null, 0.75), null);
    expect(BoxBorder.lerp(new Border.all(width: 10.0), null, 0.75), new Border.all(width: 2.5));
    expect(BoxBorder.lerp(null, new Border.all(width: 10.0), 0.75), new Border.all(width: 7.5));
    expect(BoxBorder.lerp(directionalWithTop10, null, 0.75), const BorderDirectional(top: const BorderSide(width: 2.5)));
    expect(BoxBorder.lerp(null, directionalWithTop10, 0.75), const BorderDirectional(top: const BorderSide(width: 7.5)));
    expect(BoxBorder.lerp(directionalWithTop10, visualWithTop100, 0.75), const Border(top: const BorderSide(width: 77.5)));
    expect(BoxBorder.lerp(visualWithSides10, directionalWithMagentaTop5, 0.75), visualWithSides10At25 + directionalWithMagentaTop5At75);
    expect(BoxBorder.lerp(visualWithYellowTop5, directionalWithMagentaTop5, 0.75), new Border(top: new BorderSide(width: 5.0, color: Color.lerp(const Color(0xFFFFFF00), const Color(0xFFFF00FF), 0.75))));
    expect(BoxBorder.lerp(visualWithSides10, directionalWithSides10, 0.75), directionalWithSides10At50);
    expect(BoxBorder.lerp(visualWithYellowTop5, directionalWithSides10, 0.75), visualWithYellowTop5At25 + directionalWithSides10At75);
    expect(() => BoxBorder.lerp(new SillyBorder(), const Border(), 0.75), throwsFlutterError);

    expect(BoxBorder.lerp(null, null, 1.0), null);
    expect(BoxBorder.lerp(new Border.all(width: 10.0), null, 1.0), new Border.all(width: 0.0, style: BorderStyle.none));
    expect(BoxBorder.lerp(null, new Border.all(width: 10.0), 1.0), new Border.all(width: 10.0));
    expect(BoxBorder.lerp(directionalWithTop10, null, 1.0), const BorderDirectional());
    expect(BoxBorder.lerp(null, directionalWithTop10, 1.0), const BorderDirectional(top: const BorderSide(width: 10.0)));
    expect(BoxBorder.lerp(directionalWithTop10, visualWithTop100, 1.0), visualWithTop100);
    expect(BoxBorder.lerp(visualWithSides10, directionalWithMagentaTop5, 1.0), visualWithMagentaTop5);
    expect(BoxBorder.lerp(visualWithYellowTop5, directionalWithMagentaTop5, 1.0), visualWithMagentaTop5);
    expect(BoxBorder.lerp(visualWithSides10, directionalWithSides10, 1.0), directionalWithSides10);
    expect(BoxBorder.lerp(visualWithYellowTop5, directionalWithSides10, 1.0), directionalWithSides10);
    expect(() => BoxBorder.lerp(new SillyBorder(), const Border(), 1.0), throwsFlutterError);

    expect(BoxBorder.lerp(null, null, 2.0), null);
    expect(BoxBorder.lerp(new Border.all(width: 10.0), null, 2.0), new Border.all(width: 0.0, style: BorderStyle.none));
    expect(BoxBorder.lerp(null, new Border.all(width: 10.0), 2.0), new Border.all(width: 20.0));
    expect(BoxBorder.lerp(directionalWithTop10, null, 2.0), const BorderDirectional());
    expect(BoxBorder.lerp(null, directionalWithTop10, 2.0), const BorderDirectional(top: const BorderSide(width: 20.0)));
    expect(BoxBorder.lerp(directionalWithTop10, visualWithTop100, 2.0), visualWithTop190);
    expect(BoxBorder.lerp(visualWithSides10, directionalWithMagentaTop5, 2.0), visualWithMagentaTop10);
    expect(BoxBorder.lerp(visualWithYellowTop5, directionalWithMagentaTop5, 2.0), visualWithMagentaTop5);
    expect(BoxBorder.lerp(visualWithSides10, directionalWithSides10, 2.0), directionalWithSides30);
    expect(BoxBorder.lerp(visualWithYellowTop5, directionalWithSides10, 2.0), directionalWithSides20);
    expect(() => BoxBorder.lerp(new SillyBorder(), const Border(), 2.0), throwsFlutterError);
  });

  test('BoxBorder.getInnerPath / BoxBorder.getOuterPath', () {
    // for Border, BorderDirectional
    final Border border = const Border(top: const BorderSide(width: 10.0), right: const BorderSide(width: 20.0));
    final BorderDirectional borderDirectional = const BorderDirectional(top: const BorderSide(width: 10.0), end: const BorderSide(width: 20.0));
    expect(
      border.getOuterPath(new Rect.fromLTRB(50.0, 60.0, 110.0, 190.0), textDirection: TextDirection.rtl),
      isPathThat(
        includes: <Offset>[
          const Offset(50.0, 60.0),
          const Offset(60.0, 60.0),
          const Offset(60.0, 70.0),
          const Offset(80.0, 190.0),
          const Offset(109.0, 189.0),
          const Offset(110.0, 80.0),
          const Offset(110.0, 190.0),
        ],
        excludes: <Offset>[
          const Offset(40.0, 60.0),
          const Offset(50.0, 50.0),
          const Offset(111.0, 190.0),
          const Offset(110.0, 191.0),
          const Offset(111.0, 191.0),
          const Offset(0.0, 0.0),
          const Offset(-10.0, -10.0),
          const Offset(0.0, -10.0),
          const Offset(-10.0, 0.0),
          const Offset(1000.0, 1000.0),
        ],
      ),
    );
    expect(
      border.getInnerPath(new Rect.fromLTRB(50.0, 60.0, 110.0, 190.0), textDirection: TextDirection.rtl),
      // inner path is a rect from 50.0,70.0 to 90.0,190.0
      isPathThat(
        includes: <Offset>[
          const Offset(50.0, 70.0),
          const Offset(55.0, 70.0),
          const Offset(50.0, 75.0),
          const Offset(70.0, 70.0),
          const Offset(70.0, 71.0),
          const Offset(71.0, 70.0),
          const Offset(71.0, 71.0),
          const Offset(80.0, 180.0),
          const Offset(80.0, 190.0),
          const Offset(89.0, 189.0),
          const Offset(90.0, 190.0),
        ],
        excludes: <Offset>[
          const Offset(40.0, 60.0),
          const Offset(50.0, 50.0),
          const Offset(50.0, 60.0),
          const Offset(60.0, 60.0),
          const Offset(0.0, 0.0),
          const Offset(-10.0, -10.0),
          const Offset(0.0, -10.0),
          const Offset(-10.0, 0.0),
          const Offset(110.0, 80.0),
          const Offset(89.0, 191.0),
          const Offset(90.0, 191.0),
          const Offset(91.0, 189.0),
          const Offset(91.0, 190.0),
          const Offset(91.0, 191.0),
          const Offset(109.0, 189.0),
          const Offset(110.0, 190.0),
          const Offset(1000.0, 1000.0),
        ],
      )
    );
    expect(
      borderDirectional.getOuterPath(new Rect.fromLTRB(50.0, 60.0, 110.0, 190.0), textDirection: TextDirection.rtl),
      isPathThat(
        includes: <Offset>[
          const Offset(50.0, 60.0),
          const Offset(60.0, 60.0),
          const Offset(60.0, 70.0),
          const Offset(80.0, 190.0),
          const Offset(109.0, 189.0),
          const Offset(110.0, 80.0),
          const Offset(110.0, 190.0),
        ],
        excludes: <Offset>[
          const Offset(40.0, 60.0),
          const Offset(50.0, 50.0),
          const Offset(111.0, 190.0),
          const Offset(110.0, 191.0),
          const Offset(111.0, 191.0),
          const Offset(0.0, 0.0),
          const Offset(-10.0, -10.0),
          const Offset(0.0, -10.0),
          const Offset(-10.0, 0.0),
          const Offset(1000.0, 1000.0),
        ],
      ),
    );
    expect(
      borderDirectional.getInnerPath(new Rect.fromLTRB(50.0, 60.0, 110.0, 190.0), textDirection: TextDirection.rtl),
      // inner path is a rect from 70.0,70.0 to 110.0,190.0
      isPathThat(
        includes: <Offset>[
          const Offset(70.0, 70.0),
          const Offset(70.0, 71.0),
          const Offset(71.0, 70.0),
          const Offset(71.0, 71.0),
          const Offset(80.0, 180.0),
          const Offset(80.0, 190.0),
          const Offset(89.0, 189.0),
          const Offset(90.0, 190.0),
          const Offset(91.0, 189.0),
          const Offset(91.0, 190.0),
          const Offset(109.0, 189.0),
          const Offset(110.0, 80.0),
          const Offset(110.0, 190.0),
        ],
        excludes: <Offset>[
          const Offset(40.0, 60.0),
          const Offset(50.0, 50.0),
          const Offset(50.0, 60.0),
          const Offset(50.0, 70.0),
          const Offset(50.0, 75.0),
          const Offset(55.0, 70.0),
          const Offset(60.0, 60.0),
          const Offset(0.0, 0.0),
          const Offset(-10.0, -10.0),
          const Offset(0.0, -10.0),
          const Offset(-10.0, 0.0),
          const Offset(89.0, 191.0),
          const Offset(90.0, 191.0),
          const Offset(91.0, 191.0),
          const Offset(110.0, 191.0),
          const Offset(111.0, 190.0),
          const Offset(111.0, 191.0),
          const Offset(1000.0, 1000.0),
        ],
      ),
    );
    expect(
      borderDirectional.getOuterPath(new Rect.fromLTRB(50.0, 60.0, 110.0, 190.0), textDirection: TextDirection.ltr),
      isPathThat(
        includes: <Offset>[
          const Offset(50.0, 60.0),
          const Offset(60.0, 60.0),
          const Offset(60.0, 70.0),
          const Offset(80.0, 190.0),
          const Offset(109.0, 189.0),
          const Offset(110.0, 80.0),
          const Offset(110.0, 190.0),
        ],
        excludes: <Offset>[
          const Offset(40.0, 60.0),
          const Offset(50.0, 50.0),
          const Offset(111.0, 190.0),
          const Offset(110.0, 191.0),
          const Offset(111.0, 191.0),
          const Offset(0.0, 0.0),
          const Offset(-10.0, -10.0),
          const Offset(0.0, -10.0),
          const Offset(-10.0, 0.0),
          const Offset(1000.0, 1000.0),
        ],
      ),
    );
    expect(
      borderDirectional.getInnerPath(new Rect.fromLTRB(50.0, 60.0, 110.0, 190.0), textDirection: TextDirection.ltr),
      // inner path is a rect from 50.0,70.0 to 90.0,190.0
      isPathThat(
        includes: <Offset>[
          const Offset(50.0, 70.0),
          const Offset(50.0, 75.0),
          const Offset(55.0, 70.0),
          const Offset(70.0, 70.0),
          const Offset(70.0, 71.0),
          const Offset(71.0, 70.0),
          const Offset(71.0, 71.0),
          const Offset(80.0, 180.0),
          const Offset(80.0, 190.0),
          const Offset(89.0, 189.0),
          const Offset(90.0, 190.0),
        ],
        excludes: <Offset>[
          const Offset(50.0, 50.0),
          const Offset(40.0, 60.0),
          const Offset(50.0, 60.0),
          const Offset(60.0, 60.0),
          const Offset(0.0, 0.0),
          const Offset(-10.0, -10.0),
          const Offset(0.0, -10.0),
          const Offset(-10.0, 0.0),
          const Offset(110.0, 80.0),
          const Offset(89.0, 191.0),
          const Offset(90.0, 191.0),
          const Offset(91.0, 189.0),
          const Offset(91.0, 190.0),
          const Offset(91.0, 191.0),
          const Offset(109.0, 189.0),
          const Offset(110.0, 190.0),
          const Offset(1000.0, 1000.0),
        ],
      ),
    );
  });

  test('BorderDirectional constructor', () {
    final Null $null = null;
    expect(() => new BorderDirectional(top: $null), throwsAssertionError);
    expect(() => new BorderDirectional(start: $null), throwsAssertionError);
    expect(() => new BorderDirectional(end: $null), throwsAssertionError);
    expect(() => new BorderDirectional(bottom: $null), throwsAssertionError);
  });

  test('BorderDirectional.merge', () {
    final BorderSide magenta3 = const BorderSide(color: const Color(0xFFFF00FF), width: 3.0);
    final BorderSide magenta6 = const BorderSide(color: const Color(0xFFFF00FF), width: 6.0);
    final BorderSide yellow2 = const BorderSide(color: const Color(0xFFFFFF00), width: 2.0);
    final BorderSide yellowNone0 = const BorderSide(color: const Color(0xFFFFFF00), width: 0.0, style: BorderStyle.none);
    expect(
      BorderDirectional.merge(
        new BorderDirectional(top: yellow2),
        new BorderDirectional(end: magenta3),
      ),
      new BorderDirectional(top: yellow2, end: magenta3),
    );
    expect(
      BorderDirectional.merge(
        new BorderDirectional(bottom: magenta3),
        new BorderDirectional(bottom: magenta3),
      ),
      new BorderDirectional(bottom: magenta6),
    );
    expect(
      BorderDirectional.merge(
        new BorderDirectional(start: magenta3, end: yellowNone0),
        new BorderDirectional(end: yellow2),
      ),
      new BorderDirectional(start: magenta3, end: yellow2),
    );
    expect(
      BorderDirectional.merge(const BorderDirectional(), const BorderDirectional()),
      const BorderDirectional(),
    );
    expect(
      () => BorderDirectional.merge(
        new BorderDirectional(start: magenta3),
        new BorderDirectional(start: yellow2),
      ),
      throwsAssertionError,
    );
  });

  test('BorderDirectional.dimensions', () {
    expect(
      const BorderDirectional(
        top: const BorderSide(width: 3.0),
        start: const BorderSide(width: 2.0),
        end: const BorderSide(width: 7.0),
        bottom: const BorderSide(width: 5.0),
      ).dimensions,
      const EdgeInsetsDirectional.fromSTEB(2.0, 3.0, 7.0, 5.0),
    );
  });

  test('BorderDirectional.isUniform', () {
    expect(
      const BorderDirectional(
        top: const BorderSide(width: 3.0),
        start: const BorderSide(width: 3.0),
        end: const BorderSide(width: 3.0),
        bottom: const BorderSide(width: 3.1),
      ).isUniform,
      false,
    );
    expect(
      const BorderDirectional(
        top: const BorderSide(width: 3.0),
        start: const BorderSide(width: 3.0),
        end: const BorderSide(width: 3.0),
        bottom: const BorderSide(width: 3.0),
      ).isUniform,
      true,
    );
    expect(
      const BorderDirectional(
        top: const BorderSide(color: const Color(0xFFFFFFFF)),
        start: const BorderSide(color: const Color(0xFFFFFFFE)),
        end: const BorderSide(color: const Color(0xFFFFFFFF)),
        bottom: const BorderSide(color: const Color(0xFFFFFFFF)),
      ).isUniform,
      false,
    );
    expect(
      const BorderDirectional(
        top: const BorderSide(color: const Color(0xFFFFFFFF)),
        start: const BorderSide(color: const Color(0xFFFFFFFF)),
        end: const BorderSide(color: const Color(0xFFFFFFFF)),
        bottom: const BorderSide(color: const Color(0xFFFFFFFF)),
      ).isUniform,
      true,
    );
    expect(
      const BorderDirectional(
        top: const BorderSide(style: BorderStyle.none),
        start: const BorderSide(style: BorderStyle.none),
        end: const BorderSide(style: BorderStyle.none),
        bottom: const BorderSide(style: BorderStyle.solid, width: 0.0),
      ).isUniform,
      false,
    );
    expect(
      const BorderDirectional(
        top: const BorderSide(style: BorderStyle.none),
        start: const BorderSide(style: BorderStyle.none),
        end: const BorderSide(style: BorderStyle.none),
        bottom: BorderSide.none,
      ).isUniform,
      false,
    );
    expect(
      const BorderDirectional(
        top: const BorderSide(style: BorderStyle.none, width: 0.0),
        start: const BorderSide(style: BorderStyle.none, width: 0.0),
        end: const BorderSide(style: BorderStyle.none, width: 0.0),
        bottom: BorderSide.none,
      ).isUniform,
      true,
    );
    expect(
      const BorderDirectional().isUniform,
      true,
    );
  });

  test('BorderDirectional.add - all directional', () {
    final BorderSide magenta3 = const BorderSide(color: const Color(0xFFFF00FF), width: 3.0);
    final BorderSide magenta6 = const BorderSide(color: const Color(0xFFFF00FF), width: 6.0);
    final BorderSide yellow2 = const BorderSide(color: const Color(0xFFFFFF00), width: 2.0);
    final BorderSide yellowNone0 = const BorderSide(color: const Color(0xFFFFFF00), width: 0.0, style: BorderStyle.none);
    expect(
      new BorderDirectional(top: yellow2) + new BorderDirectional(end: magenta3),
      new BorderDirectional(top: yellow2, end: magenta3),
    );
    expect(
      new BorderDirectional(bottom: magenta3) + new BorderDirectional(bottom: magenta3),
      new BorderDirectional(bottom: magenta6),
    );
    expect(
      new BorderDirectional(start: magenta3, end: yellowNone0) + new BorderDirectional(end: yellow2),
      new BorderDirectional(start: magenta3, end: yellow2),
    );
    expect(
      const BorderDirectional() + const BorderDirectional(),
      const BorderDirectional(),
    );
    expect(
      new BorderDirectional(start: magenta3) + new BorderDirectional(start: yellow2),
      isNot(const isInstanceOf<BorderDirectional>()), // see shape_border_test.dart for better tests of this case
    );
    final BorderDirectional b3 = new BorderDirectional(top: magenta3);
    final BorderDirectional b6 = new BorderDirectional(top: magenta6);
    expect(b3 + b3, b6);
    final BorderDirectional b0 = new BorderDirectional(top: yellowNone0);
    final BorderDirectional bZ = const BorderDirectional();
    expect(b0 + b0, bZ);
    expect(bZ + bZ, bZ);
    expect(b0 + bZ, bZ);
    expect(bZ + b0, bZ);
  });

  test('BorderDirectional.add', () {
    const BorderSide side1 = const BorderSide(color: const Color(0x11111111));
    const BorderSide doubleSide1 = const BorderSide(color: const Color(0x11111111), width: 2.0);
    const BorderSide side2 = const BorderSide(color: const Color(0x22222222));
    const BorderSide doubleSide2 = const BorderSide(color: const Color(0x22222222), width: 2.0);

    // adding tops and sides
    expect(const Border(left: side1) + const BorderDirectional(top: side2), const Border(left: side1, top: side2));
    expect(const BorderDirectional(start: side1) + const Border(top: side2), const BorderDirectional(start: side1, top: side2));
    expect(const Border(top: side2) + const BorderDirectional(start: side1), const BorderDirectional(start: side1, top: side2));
    expect(const BorderDirectional(top: side2) + const Border(left: side1), const Border(left: side1, top: side2));

    // adding incompatible tops and bottoms
    expect((const Border(top: side1) + const BorderDirectional(top: side2)).toString(), contains(' + '));
    expect((const BorderDirectional(top: side2) + const Border(top: side1)).toString(), contains(' + '));
    expect((const Border(bottom: side1) + const BorderDirectional(bottom: side2)).toString(), contains(' + '));
    expect((const BorderDirectional(bottom: side2) + const Border(bottom: side1)).toString(), contains(' + '));

    // adding compatible tops and bottoms
    expect(const BorderDirectional(top: side1) + const Border(top: side1), const Border(top: doubleSide1));
    expect(const Border(top: side1) + const BorderDirectional(top: side1), const Border(top: doubleSide1));
    expect(const BorderDirectional(bottom: side1) + const Border(bottom: side1), const Border(bottom: doubleSide1));
    expect(const Border(bottom: side1) + const BorderDirectional(bottom: side1), const Border(bottom: doubleSide1));

    const Border borderWithLeft = const Border(left: side1, top: side2, bottom: side2);
    const Border borderWithRight = const Border(right: side1, top: side2, bottom: side2);
    const Border borderWithoutSides = const Border(top: side2, bottom: side2);
    const BorderDirectional borderDirectionalWithStart = const BorderDirectional(start: side1, top: side2, bottom: side2);
    const BorderDirectional borderDirectionalWithEnd = const BorderDirectional(end: side1, top: side2, bottom: side2);
    const BorderDirectional borderDirectionalWithoutSides = const BorderDirectional(top: side2, bottom: side2);

    expect((borderWithLeft + borderDirectionalWithStart).toString(), '$borderWithLeft + $borderDirectionalWithStart');
    expect((borderWithLeft + borderDirectionalWithEnd).toString(), '$borderWithLeft + $borderDirectionalWithEnd');
    expect((borderWithLeft + borderDirectionalWithoutSides).toString(), '${const Border(left: side1, top: doubleSide2, bottom: doubleSide2)}');
    expect((borderWithRight + borderDirectionalWithStart).toString(), '$borderWithRight + $borderDirectionalWithStart');
    expect((borderWithRight + borderDirectionalWithEnd).toString(), '$borderWithRight + $borderDirectionalWithEnd');
    expect((borderWithRight + borderDirectionalWithoutSides).toString(), '${const Border(right: side1, top: doubleSide2, bottom: doubleSide2)}');
    expect((borderWithoutSides + borderDirectionalWithStart).toString(), '${const BorderDirectional(start: side1, top: doubleSide2, bottom: doubleSide2)}');
    expect((borderWithoutSides + borderDirectionalWithEnd).toString(), '${const BorderDirectional(end: side1, top: doubleSide2, bottom: doubleSide2)}');
    expect((borderWithoutSides + borderDirectionalWithoutSides).toString(), '${const Border(top: doubleSide2, bottom: doubleSide2)}');

    expect((borderDirectionalWithStart + borderWithLeft).toString(), '$borderDirectionalWithStart + $borderWithLeft');
    expect((borderDirectionalWithEnd + borderWithLeft).toString(), '$borderDirectionalWithEnd + $borderWithLeft');
    expect((borderDirectionalWithoutSides + borderWithLeft).toString(), '${const Border(left: side1, top: doubleSide2, bottom: doubleSide2)}');
    expect((borderDirectionalWithStart + borderWithRight).toString(), '$borderDirectionalWithStart + $borderWithRight');
    expect((borderDirectionalWithEnd + borderWithRight).toString(), '$borderDirectionalWithEnd + $borderWithRight');
    expect((borderDirectionalWithoutSides + borderWithRight).toString(), '${const Border(right: side1, top: doubleSide2, bottom: doubleSide2)}');
    expect((borderDirectionalWithStart + borderWithoutSides).toString(), '${const BorderDirectional(start: side1, top: doubleSide2, bottom: doubleSide2)}');
    expect((borderDirectionalWithEnd + borderWithoutSides).toString(), '${const BorderDirectional(end: side1, top: doubleSide2, bottom: doubleSide2)}');
    expect((borderDirectionalWithoutSides + borderWithoutSides).toString(), '${const Border(top: doubleSide2, bottom: doubleSide2)}');
  });

  test('BorderDirectional.scale', () {
    final BorderSide magenta3 = const BorderSide(color: const Color(0xFFFF00FF), width: 3.0);
    final BorderSide magenta6 = const BorderSide(color: const Color(0xFFFF00FF), width: 6.0);
    final BorderSide yellow2 = const BorderSide(color: const Color(0xFFFFFF00), width: 2.0);
    final BorderSide yellowNone0 = const BorderSide(color: const Color(0xFFFFFF00), width: 0.0, style: BorderStyle.none);
    final BorderDirectional b3 = new BorderDirectional(start: magenta3);
    final BorderDirectional b6 = new BorderDirectional(start: magenta6);
    expect(b3.scale(2.0), b6);
    final BorderDirectional bY0 = new BorderDirectional(top: yellowNone0);
    expect(bY0.scale(3.0), bY0);
    final BorderDirectional bY2 = new BorderDirectional(top: yellow2);
    expect(bY2.scale(0.0), bY0);
  });

  test('BorderDirectional.lerp', () {
    final BorderDirectional directionalWithTop10 = const BorderDirectional(top: const BorderSide(width: 10.0));
    final BorderDirectional atMinus100 = const BorderDirectional(start: const BorderSide(width: 0.0), end: const BorderSide(width: 300.0));
    final BorderDirectional at0 = const BorderDirectional(start: const BorderSide(width: 100.0), end: const BorderSide(width: 200.0));
    final BorderDirectional at25 = const BorderDirectional(start: const BorderSide(width: 125.0), end: const BorderSide(width: 175.0));
    final BorderDirectional at75 = const BorderDirectional(start: const BorderSide(width: 175.0), end: const BorderSide(width: 125.0));
    final BorderDirectional at100 = const BorderDirectional(start: const BorderSide(width: 200.0), end: const BorderSide(width: 100.0));
    final BorderDirectional at200 = const BorderDirectional(start: const BorderSide(width: 300.0), end: const BorderSide(width: 0.0));

    expect(BorderDirectional.lerp(null, null, -1.0), null);
    expect(BorderDirectional.lerp(directionalWithTop10, null, -1.0), const BorderDirectional(top: const BorderSide(width: 20.0)));
    expect(BorderDirectional.lerp(null, directionalWithTop10, -1.0), const BorderDirectional());
    expect(BorderDirectional.lerp(at0, at100, -1.0), atMinus100);

    expect(BorderDirectional.lerp(null, null, 0.0), null);
    expect(BorderDirectional.lerp(directionalWithTop10, null, 0.0), const BorderDirectional(top: const BorderSide(width: 10.0)));
    expect(BorderDirectional.lerp(null, directionalWithTop10, 0.0), const BorderDirectional());
    expect(BorderDirectional.lerp(at0, at100, 0.0), at0);

    expect(BorderDirectional.lerp(null, null, 0.25), null);
    expect(BorderDirectional.lerp(directionalWithTop10, null, 0.25), const BorderDirectional(top: const BorderSide(width: 7.5)));
    expect(BorderDirectional.lerp(null, directionalWithTop10, 0.25), const BorderDirectional(top: const BorderSide(width: 2.5)));
    expect(BorderDirectional.lerp(at0, at100, 0.25), at25);

    expect(BorderDirectional.lerp(null, null, 0.75), null);
    expect(BorderDirectional.lerp(directionalWithTop10, null, 0.75), const BorderDirectional(top: const BorderSide(width: 2.5)));
    expect(BorderDirectional.lerp(null, directionalWithTop10, 0.75), const BorderDirectional(top: const BorderSide(width: 7.5)));
    expect(BorderDirectional.lerp(at0, at100, 0.75), at75);

    expect(BorderDirectional.lerp(null, null, 1.0), null);
    expect(BorderDirectional.lerp(directionalWithTop10, null, 1.0), const BorderDirectional());
    expect(BorderDirectional.lerp(null, directionalWithTop10, 1.0), const BorderDirectional(top: const BorderSide(width: 10.0)));
    expect(BorderDirectional.lerp(at0, at100, 1.0), at100);

    expect(BorderDirectional.lerp(null, null, 2.0), null);
    expect(BorderDirectional.lerp(directionalWithTop10, null, 2.0), const BorderDirectional());
    expect(BorderDirectional.lerp(null, directionalWithTop10, 2.0), const BorderDirectional(top: const BorderSide(width: 20.0)));
    expect(BorderDirectional.lerp(at0, at100, 2.0), at200);
  });

  test('BorderDirectional.paint', () {
    expect(
      (Canvas canvas) {
        const BorderDirectional(end: const BorderSide(width: 10.0, color: const Color(0xFF00FF00)))
          .paint(canvas, new Rect.fromLTRB(10.0, 20.0, 30.0, 40.0), textDirection: TextDirection.rtl);
      },
      paints
        ..path(
          includes: <Offset>[const Offset(15.0, 30.0)],
          excludes: <Offset>[const Offset(25.0, 30.0)],
          color: const Color(0xFF00FF00),
        )
    );
    expect(
      (Canvas canvas) {
        const BorderDirectional(end: const BorderSide(width: 10.0, color: const Color(0xFF00FF00)))
          .paint(canvas, new Rect.fromLTRB(10.0, 20.0, 30.0, 40.0), textDirection: TextDirection.ltr);
      },
      paints
        ..path(
          includes: <Offset>[const Offset(25.0, 30.0)],
          excludes: <Offset>[const Offset(15.0, 30.0)],
          color: const Color(0xFF00FF00),
        )
    );
    expect(
      (Canvas canvas) {
        const BorderDirectional(end: const BorderSide(width: 10.0, color: const Color(0xFF00FF00)))
          .paint(canvas, new Rect.fromLTRB(10.0, 20.0, 30.0, 40.0));
      },
      paintsAssertion // no TextDirection
    );
  });

  test('BorderDirectional hashCode', () {
    final BorderSide side = const BorderSide(width: 2.0);
    expect(new BorderDirectional(top: side).hashCode, new BorderDirectional(top: side).hashCode);
    expect(new BorderDirectional(top: side).hashCode, isNot(new BorderDirectional(bottom: side).hashCode));
  });

  test('BoxDecoration.border takes a BorderDirectional', () {
    const BoxDecoration decoration2 = const BoxDecoration(
      border: const BorderDirectional(start: const BorderSide(width: 2.0)),
    );
    const BoxDecoration decoration4 = const BoxDecoration(
      border: const BorderDirectional(start: const BorderSide(width: 4.0)),
    );
    const BoxDecoration decoration6 = const BoxDecoration(
      border: const BorderDirectional(start: const BorderSide(width: 6.0)),
    );
    final BoxPainter painter = decoration2.createBoxPainter();
    expect(
      (Canvas canvas) {
        painter.paint(
          canvas,
          const Offset(30.0, 0.0),
          const ImageConfiguration(size: const Size(20.0, 20.0), textDirection: TextDirection.rtl),
        );
      },
      paints
        ..path(
          includes: <Offset>[const Offset(49.0, 10.0)],
          excludes: <Offset>[const Offset(31.0, 10.0)],
        )
    );
    expect(
      (Canvas canvas) {
        painter.paint(
          canvas,
          const Offset(30.0, 0.0),
          const ImageConfiguration(size: const Size(20.0, 20.0), textDirection: TextDirection.ltr),
        );
      },
      paints
        ..path(
          includes: <Offset>[const Offset(31.0, 10.0)],
          excludes: <Offset>[const Offset(49.0, 10.0)],
        )
    );
    expect(decoration2.padding, const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0));
    expect(decoration2.scale(2.0), decoration4);
    expect(BoxDecoration.lerp(decoration2, decoration6, 0.5), decoration4);
  });
}