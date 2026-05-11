import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/result_screen.dart';
import '../entities/product.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        final products = state.extra as List<Product>;
        return ResultScreen(products: products);
      },
    ),
  ],
);

