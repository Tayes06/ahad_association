import 'package:ahad/pages/constants.dart';
import 'package:flutter/material.dart';

class DashboardInfo {
  final String SvgSrc, title, totalPerson;
  final int person, percentage;
  final Color color;

  DashboardInfo({
    // ignore: non_constant_identifier_names
    this.SvgSrc = '',
    this.title = '',
    this.totalPerson = '',
    this.color = primaryColor,
    this.percentage = 0,
    this.person = 0,
  });
}

List mesChamps1 = [
  DashboardInfo(
    title: 'Membres',
    person: 25,
    SvgSrc: "assets/home_image.png",
    totalPerson: 'Inscrits',
    color: Colors.white,
    percentage: 100,
  ),
  DashboardInfo(
    title: 'Membres',
    person: 80,
    SvgSrc: "",
    totalPerson: 'Inscrits',
    color: primaryColor,
    percentage: 35,
  ),
];

List mesChamps2 = [
  DashboardInfo(
    title: 'Membres',
    person: 18,
    SvgSrc: "assets/home_image.png",
    totalPerson: 'Inscrits',
    color: Colors.white,
    percentage: 18,
  ),
  DashboardInfo(
    title: 'Membres',
    person: 25,
    SvgSrc: "",
    totalPerson: 'Inscrits',
    color: primaryColor,
    percentage: 50,
  ),
];
