import 'dart:collection';

import 'package:final_project/configs/palette.dart';
import 'package:final_project/configs/strings.dart';
import 'package:final_project/utils/remove_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:lottie/lottie.dart';


/// this the code for web view screen for opening urls.
class WebPage extends StatefulWidget {
  final String url;
  const WebPage(this.url,{Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final GlobalKey webViewKey = GlobalKey();

  /// web view controller.
  InAppWebViewController? webViewController;

  /// some configurations for web view.
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  /// controller for pull to refresh gesture.
  late PullToRefreshController pullToRefreshController;
  /// it stores url of loaded page.
  String url = "";
  /// stores current loading information.
  /// its value can be from 0 to 1.
  double progress = 0;
  /// text controller for url.
  final urlController = TextEditingController();

  @override
  void initState() {
    /// initializing pull to refresh controller.
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        webViewController?.reload();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// app bar.
      appBar: AppBar(
        backgroundColor: primaryColor,

        /// close button.
        leading: GestureDetector(
          child: const Icon(
            Icons.close_rounded
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body:  Stack(
        children: [

          ///
          Visibility(
            visible: progress == 1.0,
            maintainState: true,
            child: InAppWebView(
              key: webViewKey,
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.url),
              ),
              initialOptions: options,
              initialUserScripts:  UnmodifiableListView<UserScript>([
                /// inject js script to remove sidebar
                /// from course page while opening it.
                UserScript(
                    source: removeSideBarJS,
                    injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START),
              ]),
              pullToRefreshController: pullToRefreshController,
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              onLoadStart: (controller, url) {
                setState(() {
                  this.url = url.toString();
                  urlController.text = this.url;
                });
              },
              androidOnPermissionRequest: (controller, origin, resources) async {
                return PermissionRequestResponse(
                  resources: resources,
                  action: PermissionRequestResponseAction.GRANT,
                );
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                /// don't allow opening any link from webapge.
                return NavigationActionPolicy.CANCEL;
              },
              onLoadStop: (controller, url) async {
                pullToRefreshController.endRefreshing();
                setState(() {
                  this.url = url.toString();
                  urlController.text = this.url;
                });
              },
              onLoadError: (controller, url, code, message) {
                pullToRefreshController.endRefreshing();
              },
              onProgressChanged: (controller, progress) {
                if (progress == 100) {
                  pullToRefreshController.endRefreshing();
                }
                setState(() {
                  this.progress = progress / 100;
                  urlController.text = url;
                });
              },
              onUpdateVisitedHistory: (controller, url, androidIsReload) {
                setState(() {
                  this.url = url.toString();
                  urlController.text = this.url;
                });
              },
            ),
          ),

            /// show loading lottie while page loads.
            progress < 1.0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Lottie.asset(
                          /// lottie used from
                          /// https://lottiefiles.com/116545-loading-cat
                          "assets/lottie/loading_cat.json",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      const Center(child: Text(webViewLoading))
                    ],
                  )
                : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
