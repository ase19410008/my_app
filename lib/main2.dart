import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:my_app/demos/material/grid_list_demo.dart';
// import 'package:my_app/demos/material/material_demo_types.dart';

import 'constants.dart';
import 'data/gallery_options.dart';
import 'main.dart';
// import 'routes.dart';

// export 'data/demos.dart' show pumpDeferredLibraries;

void main() {
  // runApp(const MyApp());
  // runApp(const GalleryApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'マスコット一覧',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var mascots = <String>[
    'Duke',
    'elePHPant',
    'gopher',
    'Moby Dock',
    'octocat',
    'Tax',
    'Wilber',
    'Dash'
  ];

  var projects = <String>[
    'Java',
    'PHP',
    'Go',
    'Docker',
    'GitHub',
    'Linux',
    'GIMP',
    'Dart'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('マスコット一覧'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: mascots.length,
          itemBuilder: (BuildContext ctx, index) {
            return GridTile(
              child: Image.asset(
                'assets/images/pic$index.png',
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  mascots[index],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(projects[index].toString()),
              ),
            );
          }),
    );
  }
}

class GalleryApp extends StatelessWidget {
  const GalleryApp({
    super.key,
    this.initialRoute,
    this.isTestMode = false,
  });

  final String? initialRoute;
  final bool isTestMode;

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: GalleryOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        customTextDirection: CustomTextDirection.localeBased,
        locale: null,
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
        isTestMode: isTestMode,
      ),
      child: Builder(
        builder: (context) {
          // final options = GalleryOptions.of(context);
          return const MaterialApp(
            // By default on desktop, scrollbars are applied by the
            // ScrollBehavior. This overrides that. All vertical scrollables in
            // the gallery need to be audited before enabling this feature,
            // see https://github.com/flutter/gallery/issues/523
            // scrollBehavior:
            //     const MaterialScrollBehavior().copyWith(scrollbars: false),
            // restorationScopeId: 'rootGallery',
            // title: 'Flutter Gallery',
            debugShowCheckedModeBanner: false,
            // themeMode: options.themeMode,
            // theme: GalleryThemeData.lightThemeData.copyWith(
            //   platform: options.platform,
            // ),
            // darkTheme: GalleryThemeData.darkThemeData.copyWith(
            //   platform: options.platform,
            // ),
            localizationsDelegates: [
              ...GalleryLocalizations.localizationsDelegates,
              LocaleNamesLocalizationsDelegate()
            ],
            // initialRoute: initialRoute,
            // supportedLocales: GalleryLocalizations.supportedLocales,
            // locale: options.locale,
            // localeListResolutionCallback: (locales, supportedLocales) {
            //   deviceLocale = locales?.first;
            //   return basicLocaleListResolution(locales, supportedLocales);
            // },
            // onGenerateRoute: RouteConfiguration.onGenerateRoute,
            home: GridListDemo(),
          );
        },
      ),
    );
  }
}

// class RootPage extends StatelessWidget {
//   const RootPage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const ApplyTextOptions(
//       child: GridListDemo(type: GridListDemoType.footer),
//     );
//   }
// }
