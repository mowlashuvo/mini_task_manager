import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../core/navigation/page_transitions.dart';
import '../core/theme/theme.dart';
import '../injection_container.dart';
import 'task/presentation/bloc/task/task_bloc.dart';
import 'task/presentation/pages/task_page.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<TaskBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        child: MaterialApp.router(
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: MaterialTheme.lightTheme(),
          darkTheme: MaterialTheme.darkTheme(),
          themeMode: ThemeMode.system,
          title: 'Shokrio User List',
        ),
      ),
    );
  }

  final router = GoRouter(
    initialLocation: TaskPage.route,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: TaskPage.route,
        pageBuilder: (context, state) => buildPage(TaskPage(), state),
      ),
      /*GoRoute(
        path: '${TaskPage.route}/:id',
        name: TaskDetailPage.route,
        pageBuilder: (context, state) {
          final user = state.extra as TaskDataEntity?;
          final userId = state.pathParameters['id']!;
          if (user == null) {
            return MaterialPage(
              child: const Scaffold(
                body: Center(child: Text('Task not found')),
              ),
            );
          }
          return buildPage(TaskDetailPage(id: userId, user: user,), state);
        },
      ),*/
    ],
  );
}
