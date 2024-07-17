import 'package:event_book_app/presentation/pages/empty_events/empty_events_page.dart';
import 'package:event_book_app/presentation/pages/search_event/search_events_page.dart';
import 'package:event_book_app/presentation/pages/see_all_events/see_all_events_page.dart';
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
    GoRoute(
      path: "/seeAllEvents",
      name: "seeAllEvents",
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SeeAllEventsPage()),
    ),
    GoRoute(
      path: "/searchEvents",
      name: "searchEvents",
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SearchEventsPage()),
    ),
  ],
);
