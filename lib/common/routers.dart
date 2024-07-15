import 'package:event_book_app/presentation/pages/empty_events/empty_events_page.dart';
import 'package:go_router/go_router.dart';

final routers = GoRouter(
  initialLocation: "/emptyEvents",
  routes: [
    GoRoute(
      path: "/emptyEvents",
      name: "emptyEvents",
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: EmptyEventsPage()),
    ),
  ],
);
