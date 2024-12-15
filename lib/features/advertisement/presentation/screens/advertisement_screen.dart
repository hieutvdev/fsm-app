import 'package:flutter/material.dart';
import 'package:fsm_app/common/widgets/appbar/app_bar_base_wg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share_plus/share_plus.dart';

class AdvertisementScreen extends StatefulWidget {
  final String url;

  const AdvertisementScreen({super.key, required this.url});

  @override
  State<AdvertisementScreen> createState() => _AdvertisementScreenState();
}

class _AdvertisementScreenState extends State<AdvertisementScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    final actions = [
      IconButton(
        icon: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(3.14159), // Flip horizontally
          child: const Icon(Icons.reply_outlined),
        ),
        onPressed: () {
          Share.share(widget.url);
        },
      )
    ];
    return Scaffold(
      appBar: AppBarBaseWg(
        title: Text(widget.url, style: const TextStyle(fontSize: 14)),
        leadingIcon: Icons.close,
        actions: actions,
        isLogo: false,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}