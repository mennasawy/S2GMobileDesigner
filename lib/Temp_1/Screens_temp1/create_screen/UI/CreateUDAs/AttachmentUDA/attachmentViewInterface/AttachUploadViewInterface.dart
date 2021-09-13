abstract class AttachUploadViewInterface {
  void changeState();
  void showSingleAlert(String message, {bool isLocalized});
  void showDualAlert(String message,
      {bool isLocalized, Function leftButtonAction});
  void showError(String errorMessage);
}
