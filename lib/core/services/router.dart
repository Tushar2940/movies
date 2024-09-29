import 'package:go_router/go_router.dart';
import 'package:movies/src/dashboard/views/dashboard.dart';


final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
        builder: (context, state) {
          return Dashboard();
        }
    ),
  ],
);