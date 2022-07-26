import 'package:bloc/bloc.dart';
import 'package:fanchat/business_logic/cubit/app_cubit.dart';
import 'package:fanchat/business_logic/shared/local/cash_helper.dart';
import 'package:fanchat/constants/app_colors.dart';
import 'package:fanchat/constants/app_strings.dart';
import 'package:fanchat/firebase_options.dart';
import 'package:fanchat/presentation/layouts/home_layout.dart';
import 'package:fanchat/presentation/screens/edit_profie_screen.dart';
import 'package:fanchat/presentation/screens/login_screen.dart';
import 'package:fanchat/presentation/screens/profile_screen.dart';
import 'package:fanchat/presentation/screens/register_screen.dart';
import 'package:fanchat/presentation/screens/select_national.dart';
import 'package:fanchat/presentation/screens/splash_screen.dart';
import 'package:fanchat/presentation/widgets/shared_widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/bloc/bloc_observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CashHelper.init();
  AppStrings.uId = CashHelper.getData(key: 'uid');
  printMessage('userId is: ${AppStrings.uId}');

  Bloc.observer = MyBlocObserver();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String widget;
    if(AppStrings.uId !=null){
      widget = 'home_layout';
    }else{
      widget = '/';
    }
    return BlocProvider(
      create: (BuildContext context) =>AppCubit()..getUser(),
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context,state){

        },
        builder: (context,state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: widget,
            routes: {
              '/' :(context)=>const SplashScreen(),
              'home_layout':(context)=> const HomeLayout(),
              'login':(context)=> LoginScreen(),
              'register':(context)=>RegisterScreen(),
              'profile':(context)=>const ProfileScreen(),
              'edit_profile':(context)=>EditProfileScreen(),
              'select_national':(context)=>SelectNational()

            },
          );
        },
      )
    );
  }
}


