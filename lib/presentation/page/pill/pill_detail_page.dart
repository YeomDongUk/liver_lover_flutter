// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PillDetailPage extends StatefulWidget {
  const PillDetailPage({super.key});

  @override
  State<PillDetailPage> createState() => _PillDetailPageState();
}

class _PillDetailPageState extends State<PillDetailPage> {
  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      onLoadStart: (controller, url) => print('onLoadStart'),
      onLoadStop: (controller, url) {
        final hasUrl = url?.toString().contains(
                'https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=') ??
            false;

        if (hasUrl) {
          controller.callAsyncJavaScript(
            functionBody:
                '''document.getElementsByClassName("pc-img")[0].style.display = 'block';''',
          );
        }

        // if (url.data.uri) ;
      },
      initialUrlRequest: URLRequest(
        url: Uri.parse(
          'https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=200401857',
        ),
      ),
    );
  }
}
