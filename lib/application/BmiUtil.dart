import 'dart:core';
import 'dart:math';


class BmiUtil {

  late double height;
  late double weight;

  BmiUtil(this.height, this.weight);

  BmiUtil.bmiUtilString(String height, String weight) {
      this.height = double.parse(height);
      this.weight = double.parse(weight);
  }

  double getHeight() { return height; }
  double getWeight() { return weight; }

  double getBMI() {
    return weight / pow(height / 100, 2);
  }

  Rating getRating() {
    var bmi = getBMI();
    if (bmi < Rating.UNDERWEIGHT_VERY_SEVERELY.high) {
      return Rating.UNDERWEIGHT_VERY_SEVERELY;
    } else if (bmi < Rating.UNDERWEIGHT_SEVERELY.high) {
      return Rating.UNDERWEIGHT_SEVERELY;
    } else if (bmi < Rating.UNDERWEIGHT_MODERATELY.high) {
      return Rating.UNDERWEIGHT_MODERATELY;
    } else if (bmi < Rating.UNDERWEIGHT_SLIGHTLY.high) {
      return Rating.UNDERWEIGHT_SLIGHTLY;
    } else if (bmi < Rating.NORMAL.high) {
      return Rating.NORMAL;
    } else if (bmi < Rating.OVERWEIGHT.high) {
      return Rating.OVERWEIGHT;
    } else if (bmi < Rating.OBESE_MODERATELY.high) {
      return Rating.OBESE_MODERATELY;
    } else if (bmi < Rating.OBESE_SEVERELY.high) {
      return Rating.OBESE_SEVERELY;
    } else {
      return Rating.OBESE_VERY_SEVERELY;
    }
  }

}

enum Rating {
  UNDERWEIGHT_VERY_SEVERELY(double.negativeInfinity, 15.0),
  UNDERWEIGHT_SEVERELY(15.0, 16.0),
  UNDERWEIGHT_MODERATELY(16.0, 17.0),
  UNDERWEIGHT_SLIGHTLY(17.0, 18.5),
  NORMAL(18.5, 25.0),
  OVERWEIGHT(25.0, 30.0),
  OBESE_MODERATELY(30.0, 35.0),
  OBESE_SEVERELY(35.0, 40.0),
  OBESE_VERY_SEVERELY(40.0, double.infinity);

  const Rating(this.low, this.high);
  final double low;
  final double high;

   static List<Rating> getDescriptions() {
     return Rating.values;
   }

}