import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';


List<String> dayIntToString = [
    "",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
    ];


class PoopWeek {
  late PoopPeriod p;
  late PoopPeriod p2;
  late PoopPeriod p3;
  
  
  
    // monday
    List<PoopPeriod> monday = [
      PoopPeriod(TimeOfDay(hour: 9, minute: 0), "Eco Lec",  TimeOfDay(hour: 1, minute: 0),  "CR53",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 11, minute: 0),  "COA Lec",  TimeOfDay(hour: 1, minute: 0),  "CR53",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 13, minute: 0),  "COA Lab",  TimeOfDay(hour: 2, minute: 0),  "CL3",  "lab",  ""),
    ];

    // tuesday
    List<PoopPeriod> tuesday = [
      PoopPeriod( TimeOfDay(hour: 8, minute: 0),  "MatS Lec",  TimeOfDay(hour: 1, minute: 0),  "225",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 9, minute: 0),  "CmpSec Lec",  TimeOfDay(hour: 1, minute: 0),  "254",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 10, minute: 0),  "Information Security Lab",  TimeOfDay(hour: 2, minute: 0),  "CL3",  "lab",  ""),
      PoopPeriod( TimeOfDay(hour: 13, minute: 0),  "OSSP Lec",  TimeOfDay(hour: 1, minute: 0),  "254",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 14, minute: 0),  "Consti Lec",  TimeOfDay(hour: 1, minute: 0),  "254",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 15, minute: 0),  "OSSP Tut",  TimeOfDay(hour: 1, minute: 0),  "234",  "tut",  ""),
    ];

    // wednesday
    List<PoopPeriod> wednesday = [
      PoopPeriod( TimeOfDay(hour: 8, minute: 0),  "Eco Lec",  TimeOfDay(hour: 1, minute: 0),  "CR53",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 9, minute: 0),  "MatS Lec",  TimeOfDay(hour: 1, minute: 0),  "225",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 10, minute: 0),  "OSSP Lec",  TimeOfDay(hour: 1, minute: 0),  "254",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 11, minute: 0),  "COA Lec",  TimeOfDay(hour: 1, minute: 0),  "254",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 14, minute: 0),  "Consti Lec",  TimeOfDay(hour: 1, minute: 0),  "CR54",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 15, minute: 0),  "COA Tut",  TimeOfDay(hour: 1, minute: 0),  "229",  "tut",  ""),
    ];

    // thursday
    List<PoopPeriod> thursday = [
      PoopPeriod( TimeOfDay(hour: 8, minute: 0),  "CmpSec Lec",  TimeOfDay(hour: 1, minute: 0),  "254",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 9, minute: 0),  "MatS Lec",  TimeOfDay(hour: 1, minute: 0),  "225",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 13, minute: 0),  "Operating Systems Lab",  TimeOfDay(hour: 2, minute: 0),  "CL3",  "lab",  ""),
      PoopPeriod( TimeOfDay(hour: 15, minute: 0),  "COA Lec",  TimeOfDay(hour: 1, minute: 0),  "CR54",  "lec",  ""),
    ];

    // friday
    List<PoopPeriod> friday = [
      PoopPeriod( TimeOfDay(hour: 9, minute: 0),  "Eco Lec",  TimeOfDay(hour: 1, minute: 0),  "CR53",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 10, minute: 0),  "Open Source Software Lab",  TimeOfDay(hour: 2, minute: 0),  "CL3",  "lab",  ""),
      PoopPeriod( TimeOfDay(hour: 13, minute: 0),  "OSSP Lec",  TimeOfDay(hour: 1, minute: 0),  "CR53",  "lec",  ""),
      PoopPeriod( TimeOfDay(hour: 14, minute: 0),  "Consti Lec",  TimeOfDay(hour: 1, minute: 0),  "CR54",  "lec",  ""),
    ];

    // saturday
    List<PoopPeriod> saturday = [
      PoopPeriod( TimeOfDay(hour: 9, minute: 0),  "CmpSec Lec",  TimeOfDay(hour: 1, minute: 0),  "254",  "lec",  ""),
    ];

    List<PoopPeriod> sunday = [];

    List<List<PoopPeriod>> fullWeek(){
      return [monday,tuesday,wednesday,thursday,friday,saturday];
    }

    List<PoopPeriod> getToday(){
      return  getDay(DateTime.now().weekday) ;
    }


    List<PoopPeriod> getDay(int d){
      switch (d){
          case 1:
              return monday;
          case 2:
              return tuesday;
          case 3:
              return wednesday;
          case 4:
              return thursday;
          case 5:
              return friday;
          case 6:
              return saturday;
          case 7:
              return sunday;
          default:
              return monday;
      }
    }

  
}
