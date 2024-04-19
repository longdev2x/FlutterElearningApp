import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader_notifier/app_loader_notifier_provider.dart.dart';
import 'package:ulearning_app/common/models/order_model.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  final OrderModel orderModel;
  const PaymentScreen({super.key, required this.orderModel});
  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  late String selectedUrl;
  late WebViewController controllerGlobal;

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  void initializeController() {
    print('${AppConstants.serverApiUrl}/payment-mobile?customer_id=${widget.orderModel.userId}&order_id=${widget.orderModel.id}');
    selectedUrl = '${AppConstants.serverApiUrl}payment-mobile?customer_id=${widget.orderModel.userId}&order_id=${widget.orderModel.id}';
    controllerGlobal = 
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(selectedUrl))
          ..setUserAgent(
              'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E233 Safari/601.1')
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress:(progress) {
                
              },
              onPageStarted: (url) {
                setState(() {
                  ref.read(appLoaderNotifierProvider.notifier).updateLoader(true);
                });
              },
              onPageFinished: (url) {
                ref.read(appLoaderNotifierProvider.notifier).updateLoader(false);
              } 
            ),
          );

    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: AppColors.primaryBackground,
      ),
      body: Center(
        child: ref.watch(appLoaderNotifierProvider)
        ? const CircularProgressIndicator()
        : SizedBox(
          width: MediaQuery.of(context).size.width,
          child: WebViewWidget(controller: controllerGlobal)
        ),
      ),
    );
  }
}
