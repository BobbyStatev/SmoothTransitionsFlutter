import 'package:flutter/animation.dart';

import 'curve_model.dart';

class Data {
  static List<CurveModel?> curves = [
    null,
    CurveModel("bounceOut", Curves.bounceOut),
    CurveModel("bounceIn", Curves.bounceIn),
    CurveModel("bounceInOut", Curves.bounceInOut),
    CurveModel("decelerate", Curves.decelerate),
    CurveModel("linear", Curves.linear),
    CurveModel("easeInBack", Curves.easeInBack),
    CurveModel("ease", Curves.ease),
    CurveModel("easeInCirc", Curves.easeInCirc),
    CurveModel("easeInExpo", Curves.easeInExpo),
    CurveModel("easeInOut", Curves.easeInOut),
    CurveModel("easeInOutBack", Curves.easeInOutBack),
    CurveModel("easeInOutCirc", Curves.easeInOutCirc),
    CurveModel("easeInOutCubic", Curves.easeInOutCubic),
    CurveModel("easeInOutExpo", Curves.easeInOutExpo),
    CurveModel("easeInOutQuad", Curves.easeInOutQuad),
    CurveModel("easeInOutQuint", Curves.easeInOutQuint),
    CurveModel("easeInOutSine", Curves.easeInOutSine),
    CurveModel("easeOut", Curves.easeOut),
    CurveModel("easeOutBack", Curves.easeOutBack),
    CurveModel("easeOutCirc", Curves.easeOutCirc),
    CurveModel("easeOutCubic", Curves.easeOutCubic),
    CurveModel("easeOutExpo", Curves.easeOutExpo),
    CurveModel("easeOutQuad", Curves.easeOutQuad),
    CurveModel("easeOutQuint", Curves.easeOutQuint),
    CurveModel("easeOutSine", Curves.easeOutSine),
  ];
}
