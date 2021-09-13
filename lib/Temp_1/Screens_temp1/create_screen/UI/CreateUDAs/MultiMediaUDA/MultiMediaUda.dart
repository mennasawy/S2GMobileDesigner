import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiMediaUDA/MultiMediautils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';

//Menna review... Consider localization

class MultiMediaUda extends StatefulWidget {
  final UDAsWithValues uda;
  final GenericObject genericObject;
  final FormModes mode;
  final Function onvalueChange;
  final Function onMultiMediaUDAsValueChange;
  MultiMediaUda(
    this.uda,
    this.genericObject,
    this.mode,
    this.onvalueChange,
    this.onMultiMediaUDAsValueChange, {
    Key key,
  }) : super(key: key);

  @override
  _MultiMediaUdaState createState() => _MultiMediaUdaState();
}

class _MultiMediaUdaState extends State<MultiMediaUda>
    implements MultiMediaView {
  MultiMediaUdaPresenter _multiMediaUdaPresenter;

  @override
  void initState() {
    super.initState();
    //Menna review... Separate initializations in a method
    _multiMediaUdaPresenter = MultiMediaUdaPresenter(
      context,
      this,
      widget.uda,
      widget.genericObject,
      widget.mode,
      widget.onvalueChange,
      widget.onMultiMediaUDAsValueChange,
    );
    //Menna review... checkImageMultiMedia method doesn't need to be called twice
    _multiMediaUdaPresenter.checkImageMultiMedia();
    String presenterUrlValue = _multiMediaUdaPresenter.uda.udaValue;
    if (/*Menna review... You can separate this condition in presenter and use isEmptyText method for presenterUrlValue*/
        !_multiMediaUdaPresenter.checkImageMultiMedia() &&
            presenterUrlValue != null &&
            presenterUrlValue.isNotEmpty) {
      _multiMediaUdaPresenter.initializeChewieVideo();
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (_multiMediaUdaPresenter.isvideoIntialized) {
      _multiMediaUdaPresenter.chewieController.dispose();
      _multiMediaUdaPresenter.videoPlayerController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment(-0.9, 1),
          child: Text(
            widget.uda.udaCaption ?? '',
            style: normalTextStyle,
          ),
        ),
        Card(
          elevation: 0,
          shape: buildRoundedRectangleBorder(),
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              _multiMediaUdaPresenter.isImage
                  ? buidImageMultiMedia()
                  : buildVideoPlayer(),
              description(),
            ],
          ),
        ),
      ],
    );
  }

  buidImageMultiMedia() {
    if (_multiMediaUdaPresenter.isUrlLoaded())
      return Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            _multiMediaUdaPresenter.url,
            key: ValueKey(_multiMediaUdaPresenter.url),
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                      '''invalid image url, url must end with (.jpg or .webp or .gif or .webp&ct=g or at least contain webp in it !)'''),
                ),
              );
            },
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                ),
              );
            },
          ),
        ),
      );
    else
      return buildAddIconButton();
  }

  buildVideoPlayer() {
    if (_multiMediaUdaPresenter.isUrlLoaded()) {
      _multiMediaUdaPresenter.initializeChewieVideo();
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: _multiMediaUdaPresenter.chewiePalyerWidget(),
        ),
      );
    } else {
      if (_multiMediaUdaPresenter.isvideoIntialized) {
        _multiMediaUdaPresenter.chewieController.dispose();
        _multiMediaUdaPresenter.isvideoIntialized = false;
      }
      return buildAddIconButton();
    }
  }

  RoundedRectangleBorder buildRoundedRectangleBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(
        color: BLACK.withOpacity(0.5),
        width: 1,
      ),
    );
  }

  Widget description() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 5, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Description',
                style: normalTextStyle,
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          buildinputDialog();
                        }),
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _multiMediaUdaPresenter.ondelete();
                          });
                        })
                  ],
                ),
              ),
            ],
          ),
          Text(
            _multiMediaUdaPresenter.description,
            textAlign: TextAlign.left,
            softWrap: true,
          ),
        ],
      ),
    );
  }

  Widget buildAddIconButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 50,
        width: 300,
        child: IconButton(
          icon: Icon(
            Icons.add_a_photo,
            size: 50,
            color: GREY,
          ),
          onPressed: widget.mode != FormModes.viewMode
              ? () {
                  buildinputDialog();
                }
              : () => null,
        ),
      ),
    );
  }

  void buildinputDialog() {
    if (/*Menna review... Condition could be separated in presenter*/
        _multiMediaUdaPresenter.isvideoIntialized &&
            _multiMediaUdaPresenter.videoPlayerController.value.isPlaying) {
      _multiMediaUdaPresenter.chewieController.pause();
      _multiMediaUdaPresenter.videoPlayerController.pause();
    }
    //Menna review... I think one setState is enough
    return setState(() {
      showDialog(
        context: context,
        builder: (context) => _multiMediaUdaPresenter.buildInputForm(),
        barrierDismissible: false,
      ).then((value) {
        setState(() {
          _multiMediaUdaPresenter.urlValue =
              widget.uda.udaValue = value[0]["urlValue"];
          _multiMediaUdaPresenter.descriptionValue =
              widget.uda.multiMediaDescription = value[0]['descriptionValue'];
        });
      });
    });
  }

  @override
  changeState() {
    setState(() {});
  }
}
