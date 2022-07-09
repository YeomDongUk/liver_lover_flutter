class Routes {
  const Routes._();

  static const String auth = Path.auth;
  static const String login = Path.auth + Path.login;
  static const String join = Path.auth + Path.join;
  static const String home = Path.home;
  static const String hospitalVisitSchedules = Path.hospitalVisitSchedules;
  static const String hospitalVisitScheduleCreate =
      Path.hospitalVisitSchedules + Path.create;

  static const String hospitalVisitScheduleUpdate =
      Path.hospitalVisitSchedules + Path.update;
  static const String hospitalVisitScheduleHistories =
      Path.hospitalVisitSchedules + Path.histories;

  // '${Path.hospitalVisitSchedules}/create';
  static const String sf12Surveys = Path.sf12Surveys;
  static const String answers = Path.answers;
  static const String answerCreate = Path.answers + Path.create;
  static const String create = Path.create;
}

class Path {
  const Path._();
  static const String home = '/';
  static const String auth = '/auth';
  static const String login = '/login';
  static const String join = '/join';
  static const String hospitalVisitSchedules = '/hospital-visit-schedules';
  static const String create = '/create';
  static const String update = '/update';
  static const String histories = '/histories';
  static const String sf12Surveys = '/sf-12-surveys';
  static const String answers = '/answers';
}
