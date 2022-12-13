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


}