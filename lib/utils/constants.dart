import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../models/models.dart';

const email = "abimbolamichael100@gmail.com";
const name = "Abimbola Michael";
const aboutMe =
    "As a seasoned Flutter developer, I have honed my skills in creating visually stunning and highly functional mobile apps. I started my tech career with Java, building Android Apps Using Andriod Studio for a year and switched to Kotlin due to improved code style and learnt Andriod App Development with Google Android Developer Scholarship Program in year 2020 and now learnt Flutter to be able to build cross platform applications in a single codebase and have been building projects since 2021. I learnt Flutter by taking some internship programs, several Udemy courses, Youtube videos, Pdfs about everything on dart and Building cross platform application using Flutter with amazing UIs. I am a graduate of University of Lagos and studied Metallurgical and Materials Engineering. I learnt Software Engineering with ALX which has opened me up to other aspect of tech like C Programming, Python and many more and have also built projects like Simple Shell, Printf and other tasks which has improved my algorithmic thinking.";
const introMessage =
    "Welcome to my Flutter app developer portfolio, where innovation meets imagination! With a passion for crafting exceptional mobile applications, I strive to bring unique and captivating digital experiences to life.";
const jobRole = "Flutter Developer";
const allRolles = [
  "Flutter Developer",
  "Java/Kotlin Developer",
  "Software Engineer"
];
List<IconData> socialMediaIcons = [
  IonIcons.logo_github,
  IonIcons.logo_linkedin,
  IonIcons.logo_twitter,
  IonIcons.logo_facebook,
  IonIcons.logo_instagram,
];
String cvLink = "https://github.com/abimbola-michael?tab=repositories";
List<String> socialMedialinks = [
  "https://github.com/abimbola-michael"
      "https://www.linkedin.com/in/abimbola-michael-227181193",
  "https://twitter.com/urboihotshot?t=oscXe8CdJKyd8YxOqY6sIQ&s=09",
  "https://www.facebook.com/hotty.hotshot",
  "https://www.instagram.com/urboi_hotshot",
];

const actions = ["Home", "About", "Skills", "Projects", "Contact"];
List<Project> projects = [
  Project(
    title: "Games Arena",
    description:
        "An App of Games, consisting of 5 games which are Whot, Chess, Draught, Ludo and X and O",
    url: "",
    images: ["assets/images/games1.jpg", "assets/images/games2.jpg"],
  ),
  Project(
    title: "WhatsHot",
    description:
        "A social media app like WhatsApp, Facebook, Twitter and Instagram",
    url: "",
    images: ["assets/images/whatshot3.jpg", "assets/images/whatshot2.jpg"],
  ),
  Project(
    title: "Calcu8",
    description: "An easy to use scientific calculator",
    url: "https://github.com/abimbola-michael/Calcu8",
    images: ["assets/images/calc1.jpg", "assets/images/calc2.jpg"],
  ),
  Project(
    title: "Recipy",
    description: "A Recipy app reading from RapidApi",
    url: "https://github.com/abimbola-michael/Recipy",
    images: [
      "assets/images/recipy1.jpg",
      "assets/images/recipy2.jpg",
    ],
  ),
  Project(
    title: "Social Life",
    description: "A UI App for a social media",
    url: "https://github.com/abimbola-michael/SocialLife",
    images: ["assets/images/socialui1.jpg", "assets/images/socialui2.jpg"],
  ),
  Project(
    title: "Traveller",
    description: "A UI app for travelling",
    url: "https://github.com/abimbola-michael/Traveller",
    images: ["assets/images/traveller1.jpg", "assets/images/traveller2.jpg"],
  ),
  Project(
    title: "Chatty",
    description: "A Chat UI app",
    url: "https://github.com/abimbola-michael/Chatty",
    images: ["assets/images/chatty1.jpg", "assets/images/chatty2.jpg"],
  ),
  Project(
    title: "Portfolio",
    description: "My Portfolio website built with Flutter",
    url: "https://github.com/abimbola-michael/portfolio",
    images: ["assets/images/calc1.jpg"],
  )
];
List<Skill> skills = [
  Skill(
    title: "Mobile Development",
    names: const ["Flutter and Dart", "Java", "Kotlin"],
  ),
  Skill(
    title: "Database",
    names: const ["Firebase"],
  ),
  Skill(
    title: "State Management",
    names: ["Riverpod", "Bloc"],
  ),
  Skill(
    title: "Version Control",
    names: const ["GitHub"],
  ),
  Skill(
    title: "Other Stacks",
    names: ["Swift", "Python", "C", "HTML and CSS"],
  ),
];
