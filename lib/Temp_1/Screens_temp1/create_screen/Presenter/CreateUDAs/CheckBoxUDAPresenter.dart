import 'package:templets/Utilities/app_constants.dart';

abstract class CheckBoxUDAViewInterface {
  updateCheckBoxWidget();
}

class CheckBoxUDAPresenter {
  final CheckBoxUDAViewInterface view;
  final Function(bool) onValueChange;

  final bool isReadOnly;
  bool value;

  CheckBoxUDAPresenter(
      {this.onValueChange, this.isReadOnly, this.value, this.view});

  onCheckBoxValueChange(v) {
    if (isReadOnly != true) {
      value = v;
      onValueChange(v);
      view.updateCheckBoxWidget();
    }
  }

  checkBoxActiveColor() {
    return (isReadOnly == true) ? DARK_GREY : Main_Green;
  }
}
