import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader_notifier/app_loader_notifier_provider.dart.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/features/buy_course/provider/buy_course_provider.dart';
import 'package:ulearning_app/global.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BuyCourseScreen extends ConsumerStatefulWidget {
  const BuyCourseScreen({super.key});

  @override
  ConsumerState<BuyCourseScreen> createState() => _BuyCourseScreenState();
}

class _BuyCourseScreenState extends ConsumerState<BuyCourseScreen> {
  int? userId;
  late int courseId;
  late WebViewController webViewController;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    courseId = id['id'].toInt();
    userId = Global.storageService.getUserProfile().id;
  }


  @override
  Widget build(context) {
    var fetchUrlPayment =  ref.watch(buyCourseProviderFamily(courseId));

    return Scaffold(
      appBar: buildGlobalAppBar(title: 'Payment'),
      body: fetchUrlPayment.when(
      data: (data) {
        if(data==null) {
          return const Center(child: Text('Something wrong'));
        }
        if(data.isEmpty) {
          return const Center(child: Text('Bạn đã mua rồi'));
        }
        webViewController = WebViewController()
      ..loadRequest(
          Uri.parse('${AppConstants.serverApiUrl}$data?course_id=$courseId&user_id=$userId'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      //The name need same the name of button back in javascript Payment.postMessage('success');
      ..addJavaScriptChannel('Payment',
          onMessageReceived: (JavaScriptMessage msg) {
            Navigator.of(context).pop(msg.message);
      })
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          ref.read(appLoaderNotifierProvider.notifier).updateLoader(true);
        },
        onPageFinished: (url) {
          ref.read(appLoaderNotifierProvider.notifier).updateLoader(false);
        },
      ));

        return WebViewWidget(controller: webViewController);
      }, 
      error: (error, stackTrace) {
        return Center(child: Text(error.toString()));
      }, 
      loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
