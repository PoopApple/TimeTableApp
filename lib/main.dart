//import 'package:english_words/english_words.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/themes/themes.dart';
import 'package:flutter_application_2/utils/tt1.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

// String _colorToHex(Color color) {
//   return 'Color(0x${color.value.toRadixString(16).padLeft(8, '0')}';
// }

// void _printScheme(ColorScheme scheme) {
//   print('primary: ${_colorToHex(scheme.primary)}');
//   print('onPrimary: ${_colorToHex(scheme.onPrimary)}');
//   print('primaryContainer: ${_colorToHex(scheme.primaryContainer)}');
//   print('onPrimaryContainer: ${_colorToHex(scheme.onPrimaryContainer)}');
//   print('secondary: ${_colorToHex(scheme.secondary)}');
//   print('onSecondary: ${_colorToHex(scheme.onSecondary)}');
//   print('secondaryContainer: ${_colorToHex(scheme.secondaryContainer)}');
//   print('onSecondaryContainer: ${_colorToHex(scheme.onSecondaryContainer)}');
//   print('tertiary: ${_colorToHex(scheme.tertiary)}');
//   print('onTertiary: ${_colorToHex(scheme.onTertiary)}');
//   print('tertiaryContainer: ${_colorToHex(scheme.tertiaryContainer)}');
//   print('onTertiaryContainer: ${_colorToHex(scheme.onTertiaryContainer)}');
//   print('error: ${_colorToHex(scheme.error)}');
//   print('onError: ${_colorToHex(scheme.onError)}');
//   print('errorContainer: ${_colorToHex(scheme.errorContainer)}');
//   print('onErrorContainer: ${_colorToHex(scheme.onErrorContainer)}');
//   print('background: ${_colorToHex(scheme.background)}');
//   print('onBackground: ${_colorToHex(scheme.onBackground)}');
//   print('surface: ${_colorToHex(scheme.surface)}');
//   print('onSurface: ${_colorToHex(scheme.onSurface)}');
//   print('surfaceVariant: ${_colorToHex(scheme.surfaceVariant)}');
//   print('onSurfaceVariant: ${_colorToHex(scheme.onSurfaceVariant)}');
//   print('outline: ${_colorToHex(scheme.outline)}');
//   print('shadow: ${_colorToHex(scheme.shadow)}');
//   print('inverseSurface: ${_colorToHex(scheme.inverseSurface)}');
//   print('onInverseSurface: ${_colorToHex(scheme.onInverseSurface)}');
//   print('inversePrimary: ${_colorToHex(scheme.inversePrimary)}');
//   print('surfaceTint: ${_colorToHex(scheme.surfaceTint)}');
// }

void main() {
  // const seed = Color.fromARGB(255, 33, 41, 63);
  // final light = ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light);
  // final dark = ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark);
  // print('--- Light Scheme ---');
  // _printScheme(light);
  // print('\n--- Dark Scheme ---');
  // _printScheme(dark);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyAppState()),
        ChangeNotifierProvider(create: (_) => TTState()), 
        
      ],
      child: MaterialApp(
        title: 'Mera App',
        themeMode: ThemeMode.system,
        theme: PoopAppTheme.lightTheme,
        darkTheme: PoopAppTheme.darkTheme,
        home: MyHomePage(),
      ),
    );
  }
}

//app state is memory remain same after hot reload
class MyAppState extends ChangeNotifier {
  int number = 0;
  bool darkMode = false;

  void nextNum() {
    number++;
    notifyListeners();
  }

  void prevNum() {
    number--;
    notifyListeners();
  }

  var stored = <int>[];

  void insertInIncreasingOrder(List<int> stored, int numb) {
    int i = 0;

    if (stored.isNotEmpty) {
      while (i < stored.length && stored[i] < numb) {
        ++i;
      }
    }

    stored.insert(i, numb);
    // -5 -3 -2- 1 22
  }

  void toggleStore() {
    if (stored.contains(number)) {
      print("removed $number");
      stored.remove(number);
    } else {
      print("stored $number");
      insertInIncreasingOrder(stored, number);
    }
    notifyListeners();
  }

  void removeNumb(int numb) {
    stored.remove(numb);
    print("removed $number");
    notifyListeners();
  }

  bool containsNum() {
    return stored.contains(number);
  }
}

// is reloaded after hot reload
// everythingin build() reloads

//but with notifyListeners()  it updates becase we .watch<myappstate>
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget page;
    var appBar;
    switch (selectedIndex) {
      case 0:
        page = TT();
        appBar = TTAppBar();

      case 1:
        page = TTStack();
        appBar = AppBarTitleText();

      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      appBar: appBar,
      body: page,
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'TT',
          ),
          NavigationDestination(
            icon: Icon(Icons.exposure_plus_1),
            label: 'Counter',
          ),
        ],
        selectedIndex: selectedIndex,

        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
/*
Row(
        children: [
          SafeArea(
            child: NavigationBar(
              destinations: [
                NavigationDestination(icon: Icon(Icons.exposure_plus_1), label: "Counter"),
                NavigationDestination(icon: Icon(Icons.home), label: "trial"),
              ],
              selectedIndex: 0,
              onDestinationSelected: (value) {
                print('selected: $value');
              },

              
            )
          ),

          Expanded(
            child: Container(
              color: theme.colorScheme.primaryContainer,
              child: Counter(),


            ) 
            ),
        ],
      ),
*/

extension TimeOfDayExtension on TimeOfDay {
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }

  TimeOfDay add(TimeOfDay other) {
    int hr = (hour + other.hour) % 24;
    int mi = (minute + other.minute) % 60;
    return replacing(hour: hr, minute: mi);
  }

  TimeOfDay subtract(TimeOfDay other) {
    int hr = (24 + hour - other.hour) % 24;
    int mi = (60 + minute - other.minute) % 60;
    return replacing(hour: hr, minute: mi);
  }

  TimeOfDay getMultiplied(TimeOfDay other, int multiplier) {
    int mi = (minute + other.minute * multiplier);
    int hr = hour + other.hour * multiplier + mi ~/ 60;
    return TimeOfDay(hour: hr % 24, minute: mi % 60);
  }

  String toAMPM() {
    return (hour < 10 ? "0$hour:" : "${hour == 12 ? 12 : hour % 12}:") +
        (minute < 10 ? "0$minute " : "$minute ") +
        (period == DayPeriod.am ? "AM" : "PM");
  }
}

class PoopPeriod {
  late TimeOfDay starttime;
  late String nameOfSubject;
  late TimeOfDay duration;
  late String classroom;
  late String otherstuff;
  late String type;

  PoopPeriod(
    this.starttime,
    this.nameOfSubject,
    this.duration,
    this.classroom,
    this.type,
    this.otherstuff,
  );
}

/*Period(starttime,nameOfSubject,duration,classroom,otherstuff,day);

starttime => TimeOfDay(hour: 1, minute: 0)
nameOfSubject => simple string
classroom => simple string
duration => TimeOfDay(hour: 1, minute: 0)
day = simple string lowercase of monday tuesday etc

*/



class TTState extends ChangeNotifier {
  double rowHeight = 100;
  TimeOfDay start = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay gap = TimeOfDay(hour: 1, minute: 0);

  int numOfPeriod = 9;

  PoopWeek week = PoopWeek();

  int day = -1;

  void changeHeight(double hei) {
    rowHeight = hei;
    notifyListeners();
  }

  TimeOfDay getnext() {
    TimeOfDay next = start;
    next.add(gap);
    return next;
  }

  List<PoopPeriod> getDay(){
    if (day == -1){
      day = DateTime.now().weekday;
      notifyListeners();
    }
    return week.getDay(day);
  }

  void nextDay(){
    day++;
    if(day>7){
      day =1;
    }
    notifyListeners();
  }
  void prevDay(){
    day--;
    if(day < 1){
      day = 7;
    }
    notifyListeners();
  }

  void setToday(){
    day = DateTime.now().weekday;
    notifyListeners();
  }
 
}


class TTAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TTAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var ttState = context.watch<TTState>();
    int d = ttState.day;
    String dayName = dayIntToString[d];
  
    //TextButton()
    var middleText = Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "",
              style: TextStyle(color: theme.colorScheme.secondary),
            ),
            TextSpan(
              text: dayName,
              style: TextStyle(
                color: theme.colorScheme.onSurface,
              ), //TextStyle(color: Colors.white),
            ),
            TextSpan(
              text: "",
              style: TextStyle(color: theme.colorScheme.secondary),
            ),
          ],
          // default style
          style: TextStyle(fontSize: 18),
        ),
      ),
    );

    //
    var prevbut = TextButton( onPressed: ttState.prevDay,style: ButtonStyle(alignment: Alignment.centerRight,overlayColor: WidgetStateColor.transparent), child: Text("<<<<<<")); //style: ButtonStyle(overlayColor: WidgetStateColor.transparent) ,
    var nextbut = TextButton( onPressed: ttState.nextDay,style: ButtonStyle(alignment: Alignment.centerLeft,overlayColor: WidgetStateColor.transparent) ,child: Text(">>>>>>"),);
    var todaybut = TextButton( onPressed: ttState.setToday,style: ButtonStyle(alignment: Alignment.center,overlayColor: WidgetStateColor.transparent) ,child: Text("today"),);
    return AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex : 4, child: prevbut),
            Expanded(flex : 2, child: middleText),
            Expanded(flex : 2, child: nextbut),
            Expanded(flex : 2, child: todaybut),
          ],
        ),
        backgroundColor: theme.colorScheme.surface,
        centerTitle: true,
        //actions: [todaybut],
        //actions: [prevbut,nextbut],
      );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class TT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    

    return SingleChildScrollView(
      child: Column(
        children: [
          TtHeading(theme: theme),
          TTStack(),
        ],
      ),
    );
  }
}

class TTStack extends StatelessWidget {
  const TTStack({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var ttState = context.watch<TTState>();
    Color linecolor = theme.colorScheme.outlineVariant.withAlpha(50);
    List<PoopPeriod> week = ttState.getDay();

    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3, bottom: 3, top: 15),
      child: Stack(
        children: [
          CustomPaint(
            painter: LinesAndTextBG(ttState: ttState, linecolor: linecolor),
            child: getTimes(ttState),
          ),
          ...getPeriodsOfDay(ttState.getDay(), ttState, context),
        ],
      ),
    );
  }

  List<Widget> getPeriodsOfDay(
    List<PoopPeriod> monday,
    TTState ttState,
    BuildContext context,
  ) {
    return List.generate(
      monday.length,
      (i) => periodOverlay(ttState, monday[i], context),
    );
  }

  Column getTimes(TTState ttState) {
    final double heightOfRow = 100;
    final TimeOfDay start = ttState.start;
    final TimeOfDay gap = ttState.gap;
    List<IntrinsicHeight> labels = new List.filled(
      ttState.numOfPeriod,
      getTimeLabel(ttState, heightOfRow, "08:00 AM"),
    );

    for (int period = 0; period < ttState.numOfPeriod; ++period) {
      labels[period] = (getTimeLabel(
        ttState,
        heightOfRow,
        start.getMultiplied(gap, period).toAMPM(),
      ));
    }
    return Column(children: labels);
  }

  IntrinsicHeight getTimeLabel(
    TTState ttState,
    double heightOfRow,
    String tim,
  ) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            flex: 15,
            child: Container(
              height: ttState.rowHeight,
              alignment: Alignment.topCenter,
              child: Text(tim, style: TextStyle(fontSize: 10)),
            ),
          ),

          Expanded(flex: 85, child: SizedBox()),
        ],
      ),
    );
  }

  IntrinsicHeight periodOverlay(
    TTState ttState,
    PoopPeriod p,
    BuildContext context,
  ) {
    final rowh = ttState.rowHeight;

    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(flex: 15, child: SizedBox()),

          Expanded(
            flex: 85,
            child: Column(children: [periodContainer(p, ttState)]),
          ),
        ],
      ),
    );
  }

  Padding periodContainer(PoopPeriod p, TTState ttState) {
    int numperiod = ttState.numOfPeriod;
    double rowh = ttState.rowHeight;
    int startOfDayInMins = ttState.start.hour * 60 + ttState.start.minute;
    int startOfPeriodInMins = p.starttime.hour * 60 + p.starttime.minute;
    int gapInMins = ttState.gap.hour * 60 + ttState.gap.minute;
    int durationInMins = p.duration.hour * 60 + p.duration.minute;

    double topPadding =
        (startOfPeriodInMins - startOfDayInMins) / gapInMins * rowh;
    double containerHeight = durationInMins / gapInMins * rowh;

    double normalPadding = 5;

    return Padding(
      padding: EdgeInsets.only(
        left: normalPadding,
        right: normalPadding,
        top: (normalPadding + topPadding),
        bottom: normalPadding,
      ),
      child: Container(
        height:
            containerHeight -
            normalPadding * 2, //MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.orangeAccent.withAlpha(100),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "${p.nameOfSubject}",
                    ),
                  ),
                  Spacer(flex: 1),
                  Text(
                    "${p.starttime.toAMPM()} - ${p.starttime.getMultiplied(p.duration, 1).toAMPM()}",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "${p.classroom}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Spacer(flex: 1),
                  Text("B"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinesAndTextBG extends CustomPainter {
  final Color linecolor;
  TTState ttState;
  LinesAndTextBG({required this.ttState, required this.linecolor});
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = linecolor
      ..strokeWidth = 2;

    // draw vertical lines
    // for (double x = 0; x <= size.width; x += 40) {
    //   canvas.drawLine(Offset(x, 0), Offset(x, size.height), linePaint);
    // }

    canvas.drawLine(
      Offset(size.width * 0.15, 0),
      Offset(size.width * 0.15, size.height),
      linePaint,
    );

    // draw diagonal lines
    for (double y = 0; y <= size.height; y += ttState.rowHeight) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    // draw big background text
    final textStyle = TextStyle(
      color: Colors.grey.withAlpha(25),
      fontSize: 100,
      fontWeight: FontWeight.bold,
    );
    final textSpan = TextSpan(text: 'BG SCROLL', style: textStyle);
    //final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    // textPainter.layout();
    // textPainter.paint(canvas, Offset(20, size.height - 300));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TtHeading extends StatelessWidget {
  const TtHeading({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            border: Border(bottom: BorderSide(color: theme.colorScheme.onSurface)),
          ),
        
          width: double.infinity,
        
          child: Center(child: Text("TT bhi h ez if i put it on (an app)")),
        );
  }
}






class AppBarTitleText extends StatelessWidget implements PreferredSizeWidget{
  const AppBarTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
        
    var richText = RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Notes",
            style: TextStyle(
              color: theme.colorScheme.onSurface,
            ), //TextStyle(color: Colors.white),
          ),
          TextSpan(
            text: "++",
            style: TextStyle(color: theme.colorScheme.primary),
          ),
        ],
        // default style
        style: TextStyle(fontSize: 18),
      ),
    );

    return 
    AppBar(
        title: richText,
        backgroundColor: theme.colorScheme.surface,
        centerTitle: true,
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
