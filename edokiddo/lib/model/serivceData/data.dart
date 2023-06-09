import 'package:edokiddo/model/lecPath.dart';

class AppData{

  static List<LecPath> arabicList=[];

  static List arabic=[
    {
      "ID ": 1,
      "Subject ": "Arabic",
      "Lecture": 1,
      "Url": "https:\/\/youtu.be\/5j_UCxIEgj4?t=26"
    },
    {
      "ID ": 2,
      "Lecture": 2,
      "Url": "https:\/\/youtu.be\/j69Z5UKOR4o"
    },
    {
      "ID ": 3,
      "Lecture": 3,
      "Url": "https:\/\/youtu.be\/b7iR4ODg3lM"
    },
    {
      "ID ": 4,
      "Lecture": 4,
      "Url": "https:\/\/youtu.be\/mzrI21jwI2A"
    },
    {
      "ID ": 5,
      "Lecture": 5,
      "Url": "https:\/\/youtu.be\/romBxdZL7yE"
    },
    {
      "ID ": 6,
      "Lecture": 6,
      "Url": "https:\/\/youtu.be\/DA14Jm1ou7A "
    }
  ];

  static getarabicList(){
    LecPath temp;
    arabic.forEach((element) {
      temp=LecPath(name: element["ID "].toString(), url: element["Url"]);
      arabicList.add(temp);
    });
  }


  static List english=[
    {
      "ID ": 1,
      "Subject ": "English",
      "Lecture": 1,
      "Url": "https:\/\/youtu.be\/jPABwdH2Dqk"
    },
    {
      "ID ": 2,
      "Lecture": 2,
      "Url": "https:\/\/youtu.be\/yyET51FDt9c"
    },
    {
      "ID ": 3,
      "Lecture": 3,
      "Url": "https:\/\/youtu.be\/8uLPe4tAkbk"
    },
    {
      "ID ": 4,
      "Lecture": 4,
      "Url": "https:\/\/youtu.be\/VFOhxMZSMwc"
    },
    {
      "ID ": 5,
      "Lecture": 5,
      "Url": "https:\/\/youtu.be\/rOKQgYyIfv0"
    }
  ];

  static List<LecPath> EnglishList=[];

  static getEnglishList(){
    LecPath temp;
    english.forEach((element) {
      temp=LecPath(name: element["ID "].toString(), url: element["Url"]);
      EnglishList.add(temp);
    });
  }


  static List maths=[
    {
      "ID ": 1,
      "Subject ": "Mathematics",
      "Lecture": 1,
      "Url": "https:\/\/youtu.be\/4sHOH_zsRl4"
    },
    {
      "ID ": 2,
      "Lecture": 2,
      "Url": "https:\/\/youtu.be\/jqncNP_u6aw"
    },
    {
      "ID ": 3,
      "Lecture": 3,
      "Url": "https:\/\/youtu.be\/_l8loAo7-o4"
    },
    {
      "ID ": 4,
      "Lecture": 4,
      "Url": "https:\/\/youtu.be\/39-cndH0rbM"
    },
    {
      "ID ": 5,
      "Lecture": 5,
      "Url": "https:\/\/youtu.be\/oquTCRcChwo"
    }
  ];


  static List<LecPath> mathsList=[];

  static getMathsList(){
    LecPath temp;
   maths.forEach((element) {
      temp=LecPath(name: element["ID "].toString(), url: element["Url"]);
      mathsList.add(temp);
    });
  }


  static List entertainment=[
    {
      "ID": 1,
      "Name": "Paw patrol",
      "Type ": "Cartoon",
      "Url": "https:\/\/youtu.be\/ohO95wWMV2o"
    },
    {
      "ID": 2,
      "Name": "Shaun the sheep",
      "Type ": "Cartoon",
      "Url": "https:\/\/youtu.be\/0UyNnWAi6wA"
    },
    {
      "ID": 3,
      "Name": "Curious george",
      "Type ": "Cartoon",
      "Url": "https:\/\/youtu.be\/N9h2sg-PGRk"
    },
    {
      "ID": 4,
      "Name": "Masha and the bear",
      "Type ": "Cartoon",
      "Url": "https:\/\/youtu.be\/3kmc88JWdNo"
    },
    {
      "ID": 5,
      "Name": "Teletubbies",
      "Type ": "Cartoon",
      "Url": "https:\/\/youtu.be\/abEbkBEcYPY"
    },
    {
      "ID": 6,
      "Name": "fun colors",
      "Type ": "Game",
      "Url": "https:\/\/yandex.com\/games\/app\/99209?utm_medium=search&utm_source=google&utm_campaign=en-tier2_games_general-igra_all_google_search%7C17880492419&utm_term=game%20play%20for%20children#app-id=99209&catalog-session-uid=catalog-4278633f-d42b-5c70-b4c0-b8032966a30b-1683637332413-90e6&rtx-reqid=6994708227005891733&pos=%7B%22listType%22%3A%22suggested%22%2C%22tabCategory%22%3A%22educational%22%7D"
    },
    {
      "ID": 7,
      "Name": "simple words",
      "Type ": "Game",
      "Url": "https:\/\/yandex.com\/games\/app\/211187?utm_medium=search&utm_source=google&utm_campaign=en-tier2_games_general-igra_all_google_search%7C17880492419&utm_term=game%20play%20for%20children#app-id=211187&catalog-session-uid=catalog-4278633f-d42b-5c70-b4c0-b8032966a30b-1683637332413-90e6&rtx-reqid=6994708227005891733&pos=%7B%22listType%22%3A%22suggested%22%2C%22tabCategory%22%3A%22educational%22%7D"
    },
    {
      "ID": 8,
      "Name": "Animal memory",
      "Type ": "Game",
      "Url": "https:\/\/yandex.com\/games\/app\/103622?utm_source=game_header_logo#app-id=103622&catalog-session-uid=catalog-4278633f-d42b-5c70-b4c0-b8032966a30b-1683638917368-284c&rtx-reqid=8416349886629693133&pos=%7B%22listType%22%3A%22suggested%22%2C%22tabCategory%22%3A%22educational%22%7D"
    },
    {
      "ID": 9,
      "Name": "Baby Hazel",
      "Type ": "Game",
      "Url": "https:\/\/yandex.com\/games\/app\/96650?utm_source=game_header_logo#app-id=96650&catalog-session-uid=catalog-4278633f-d42b-5c70-b4c0-b8032966a30b-1683638917368-284c&rtx-reqid=8416349886629693133&pos=%7B%22listType%22%3A%22suggested%22%2C%22tabCategory%22%3A%22educational%22%7D"
    }
  ];

  static List<LecPath> CartoonList=[];

  static getCartoonList(){
    LecPath temp;
    entertainment.forEach((element) {
      if(element["Type "]=="Cartoon") {
        temp = LecPath(name: element["Name"].toString(), url: element["Url"]);
        CartoonList.add(temp);
      }
    });
  }
  static List<LecPath> GameList=[];
  static getGameList(){
    LecPath temp;
    entertainment.forEach((element) {
      if(element["Type "]=="Game")
      {
        temp = LecPath(name: element["Name"].toString(), url: element["Url"]);
        GameList.add(temp);
      }

    });
    print(GameList);
  }






}