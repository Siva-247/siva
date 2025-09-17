import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Screens
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/chat_thread_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final loggingIn = state.matchedLocation == '/login' ||
          state.matchedLocation == '/signup';

      if (user == null && !loggingIn) {
        return '/login'; // not logged in → go login
      }
      if (user != null && loggingIn) {
        return '/home'; // already logged in → go home
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) =>
            const HomeScreen(), // bottom nav: Chats, Contacts, Settings
      ),
      GoRoute(
        path: '/chat-thread/:id',
        builder: (context, state) {
          final chatId = state.pathParameters['id']!;
          return ChatThreadScreen(chatId: chatId);
        },
      ),
    ],
  );
}
