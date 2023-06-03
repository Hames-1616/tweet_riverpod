import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/common/Error_page.dart';
import 'package:riverpod_learning/common/loading_page.dart';
import 'package:riverpod_learning/features/auth/controller/auth_controller.dart';
import 'package:riverpod_learning/features/auth/view/signup_view.dart';
import 'package:riverpod_learning/features/home/view/home_view.dart';
import 'package:riverpod_learning/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: ref.watch(currentuseraccountProvider).when(
        data: (data){
          if(data!=null)
          {
            return const HomeView();
          }
          return const SignUpView();
        }, error: (error,stk){
          Error_page(error: error.toString());
        }, loading: ()=> const loader()),
    );
  }
}

