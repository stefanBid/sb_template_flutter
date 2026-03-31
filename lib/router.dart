import 'package:go_router/go_router.dart';
// Layouts
import 'layouts/app_layout.dart';

// Screens
import 'screens/home/home_screen.dart';
import 'screens/form/form_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/details/details_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  redirect: (context, state) {
    if (state.uri.path == '/') return '/home';
    return null;
  },
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppLayout(child: child),
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        GoRoute(path: '/form', builder: (context, state) => const FormScreen()),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    ShellRoute(
      builder: (context, state, child) =>
          AppLayout(withBottomNav: false, child: child),
      routes: [
        GoRoute(
          path: '/details/:detailId',
          builder: (context, state) {
            final detailId = state.pathParameters['detailId']!;
            return DetailsScreen(detailId: detailId);
          },
        ),
      ],
    ),
  ],
);
