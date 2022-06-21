
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:twitter_project/providers/auth_provider.dart';
import 'package:twitter_project/providers/sidemenu_provider.dart';
import 'package:twitter_project/router/router.dart';
import 'package:twitter_project/ui/views/blank_view.dart';
import 'package:twitter_project/ui/views/categories_view.dart';
import 'package:twitter_project/ui/views/dashboard_view.dart';
import 'package:twitter_project/ui/views/icons_view.dart';
import 'package:twitter_project/ui/views/login_view.dart';
import 'package:twitter_project/ui/views/user_view.dart';
import 'package:twitter_project/ui/views/users_view.dart';





class DashboardHandlers {

  static Handler dashboard = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl( Flurorouter.dashboardRoute );

      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return DashboardView();
      } else {
        return LoginView();
      }
    }
  );


  static Handler icons = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl( Flurorouter.iconsRoute );

      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return IconsView();
      } else {
        return LoginView();
      }
    }
  );


  static Handler blank = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl( Flurorouter.blankRoute );

      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return const BlankView();
      } else {
        return LoginView();
      }
    }
  );


  static Handler categories = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl( Flurorouter.categoriesRoute );

      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return const CategoriesView();
      } else {
        return LoginView();
      }
    }
  );

  // users
  static Handler users = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl( Flurorouter.usersRoute );

      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return UsersView();
      } else {
        return LoginView();
      }
    }
  );

  // user
  static Handler user = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl( Flurorouter.userRoute );

      if ( authProvider.authStatus == AuthStatus.authenticated ){
        print( params );
        if ( params['uid']?.first != null ) {
            return UserView(uid: params['uid']!.first );
        } else {
          return UsersView();
        }


      } else {
        return LoginView();
      }
    }
  );

}

