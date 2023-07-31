import 'package:go_router/go_router.dart';
import 'package:intern_mobile_app/pages/Home/explore.dart';
import 'package:intern_mobile_app/pages/login_page.dart';
import 'package:intern_mobile_app/pages/register_login_email.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        name: 'login',
        path: '/login_page',
        builder: (context, state) => const LoginPage(title: 'log in page'),
      ),
      GoRoute(
        name: 'register',
        path: '/register_login_email',
        builder: (context, state) => const RegisterLogin(),
      ),
    ],
  );
}

