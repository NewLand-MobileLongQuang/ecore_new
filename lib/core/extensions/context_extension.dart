import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../providers/call_provider.dart';
import '../providers/tab_navigator.dart';
import '../providers/session_provider.dart';
import '../modules/auth/domain/entities/inos_user.dart';
import '../modules/auth/domain/entities/session_info.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;

  double get width => size.width;
  double get height => size.height;

  SessionProvider get sessionProvider => read<SessionProvider>();
  CallProvider get callProvider => read<CallProvider>();
  InosUser? get currentUser => sessionProvider.user;

  SessionInfo? get sessionInfo => sessionProvider.session;

  TabNavigator get tabNavigator => read<TabNavigator>();
  void pop() => tabNavigator.pop();
  void push(Widget page) => tabNavigator.push(TabItem(child: page));
}
