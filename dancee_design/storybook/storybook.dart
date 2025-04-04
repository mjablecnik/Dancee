import 'package:dancee_design/dancee_design.dart';
import 'package:flutter/material.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';

import 'all_stories.dart';
import 'assets/icons.dart';

Storybook storybook([List<Story>? stories]) {
  return Storybook(
    wrapperBuilder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: DanceeTheme().light,
        darkTheme: DanceeTheme().dark,
        builder: defaultMediaQueryBuilder,
        home: Scaffold(body: Center(child: child)),
      );
    },
    plugins: initializePlugins(
      enableCodeView: false,
      enableDirectionality: false,
      enableTimeDilation: false,
      initialDeviceFrameData: DeviceFrameData(
        visibility: DeviceFrameVisibility.none,
        device: Devices.ios.iPhone12,
        orientation: Orientation.portrait,
      ),
    ),
    initialStory: stories?.first.name,
    stories: [...assetIcons, ...stories ?? allStories],
  );
}

void main() => runApp(storybook());
