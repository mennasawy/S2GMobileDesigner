import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiMediaUDA/MultiMediaUDAInputForm.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/const.dart';

abstract class MultiMediaView {
  changeState();
}

class MultiMediaUdaPresenter {
  BuildContext context;
  MultiMediaView view;
  final UDAsWithValues uda;
  final GenericObject genericObject;
  final FormModes mode;
  final Function onvalueChange;
  final Function onMultiMediaUDAsValueChange;

  bool errorResponse = false;
  MultiMediaUdaPresenter(
    this.context,
    this.view,
    this.uda,
    this.genericObject,
    this.mode,
    this.onvalueChange,
    this.onMultiMediaUDAsValueChange, {
    Key key,
  });
  bool isExpanded = false;
  bool isImage = false;
  bool showInpuForm = false;
  bool isvideoIntialized = false;
  String urlValue = '';
  String descriptionValue = '';
  checkImageMultiMedia() {
    bool oo = uda.multiMediaTypeId == 1;
    return isImage = uda.multiMediaTypeId == 1;
  }

  buildInputForm() {
    return MultiMediaUDAInputForm(
      genericObject: genericObject,
      mode: mode,
      onMultiMediaUDAsValueChange: onMultiMediaUDAsValueChange,
      onvalueChange: onvalueChange,
      uda: uda,
    );
  }

  ondelete() {
    urlValue = '';
    descriptionValue = '';
    uda.udaValue = null;
    uda.multiMediaDescription = null;
  }

  isUrlLoaded() {
    String udaUrl = uda.udaValue;
    //?????? urlValue vs udaUrl???????
    return (uda.udaValue != null && udaUrl.isNotEmpty) ||
        (urlValue != null && urlValue.isNotEmpty);
  }

  get url {
    return uda.udaValue ?? urlValue;
  }

  get description {
    return uda.multiMediaDescription != null &&
            uda.multiMediaDescription.isNotEmpty
        ? uda.multiMediaDescription
        : (descriptionValue.isNotEmpty)
            ? descriptionValue
            : 'No description';
  }

  checkNewViewMode() {
    return mode != FormModes.viewMode && mode != FormModes.newMode;
  }

  ChewieController chewieController;
  VideoPlayerController videoPlayerController;
  initializeChewieVideo() {
    videoPlayerController = VideoPlayerController.network(url);

    videoPlayerController.initialize().catchError((error) {
      log(LogType.DEBUG, 'Video Error Response ====== $error');
      return ShowAlertMessage(
          '''invalid video url, url must start with "http or https"
      & end with (.mkv or .3gp or .mp4!)
     ''', context);
    });
    chewieController = ChewieController(
      aspectRatio: 16 / 9,
      looping: false,
      videoPlayerController: videoPlayerController,
    );

    isvideoIntialized = true;
  }

  Widget chewiePalyerWidget() {
    return Chewie(
      key: UniqueKey(),
      controller: chewieController,
    );
  }
}
