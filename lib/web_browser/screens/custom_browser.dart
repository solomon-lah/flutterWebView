// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_view/web_browser/helper/string_helper.dart';
import 'package:web_view/web_browser/screens/attachments/custom_text.dart';
import 'package:web_view/web_browser/utilities/assets_provider.dart';

class CustomBroswer extends StatefulWidget {
  const CustomBroswer({super.key});

  @override
  State<CustomBroswer> createState() => _CustomBroswerState();
}

class _CustomBroswerState extends State<CustomBroswer> {
  late InAppWebViewController _controller;
  bool _encounteredError = false;
  double _progressValue = 0;
  int _index = 0;
  // bool _canPop = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) async {
        _popOrNot();
      },
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _progressValue != 1
                  ? SizedBox(
                      height: 5,
                      child: LinearProgressIndicator(
                        value: _progressValue,
                        color: Colors.green,
                      ),
                    )
                  : Container(),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: IndexedStack(index: _index, children: [
                  InAppWebView(
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        useShouldOverrideUrlLoading: true,
                      ),
                    ),
                    shouldOverrideUrlLoading:
                        (controller, navigationAction) async {
                      final url = navigationAction.request.url;
                      if (url.toString().contains("whatsapp://message")) {
                        launchUrl(url!);
                        return NavigationActionPolicy.CANCEL;
                      }
                      return NavigationActionPolicy.ALLOW;
                    },
                    onWebViewCreated: (controller) {
                      _controller = controller;
                    },
                    onLoadStart: (controller, url) {
                      _encounteredError = false;
                      _index = 1;
                      setState(() {});
                    },
                    onLoadStop: (controller, url) {
                      if (_encounteredError) {
                        _index = 2;
                      } else {
                        _index = 0;
                      }
                      setState(() {});
                    },
                    onLoadHttpError:
                        (controller, url, statusCode, description) {
                      _encounteredError = true;
                    },
                    onLoadError: (controller, url, code, message) {
                      _encounteredError = true;
                    },
                    onProgressChanged: (controller, progress) {
                      _progressValue = progress / 100;
                      setState(() {});
                    },
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(
                        StringHelper.baseUrl,
                      ),
                    ),
                  ),
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          errorImage,
                          // height: 10.h,
                          // width: 40.w,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.h),
                          child: const CustomText(
                            text:
                                'An error encountered, \n ensure you have an active internet connection',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => _controller.reload(),
                          child: const Text('Reload'),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _showExitDialog() => AwesomeDialog(
  //       context: context,
  //       dialogType: DialogType.info,
  //       animType: AnimType.rightSlide,
  //       title: 'Confirm Action',
  //       desc: 'Exit Application?',
  //       btnCancelOnPress: () {},
  //       btnOkOnPress: () => SystemNavigator.pop(),
  //     ).show();

  void _popOrNot() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
    } else {
      _pop();
    }
  }

  void _pop() => Navigator.pop(context);
}
