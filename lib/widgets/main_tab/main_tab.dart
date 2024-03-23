import 'package:flutter/material.dart';
import 'package:portfolio/widgets/main_tab/contacts.main_tab.dart';
import 'package:portfolio/widgets/main_tab/fields.main_tab.dart';
import 'package:portfolio/widgets/main_tab/home.main_tab.dart';
import 'package:portfolio/widgets/main_tab/projects.main_tab.dart';

enum MainTab {
  home(Icons.home, '메인', _getMainTab),
  // fields(Icons.construction, '작업 분야', _getFieldsTab),
  projects(Icons.list, '프로젝트', _getProjectsTab),
  contacts(Icons.contact_mail, '문의 프로필', _getContactsTab),
  ;

  final IconData icon;
  final String label;
  final Widget Function() getWidget;

  const MainTab(this.icon, this.label, [this.getWidget = _default]);

  static Widget _getMainTab() => const HomeMainTab();

  static Widget _getProjectsTab() => const ProjectsMainTab();

  static Widget _getFieldsTab() => const FieldsMainTab();

  static Widget _getContactsTab() => const ContactsMainTab();

  static Widget _default() => const Text('not implmented');
}
