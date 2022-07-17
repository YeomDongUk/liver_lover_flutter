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
  static const String myPinCodeUpdate = Path.my + Path.pinCode + Path.update;
  // '${Path.hospitalVisitSchedules}/create';
  static const String sf12Surveys = Path.sf12Surveys;
  static const String answers = Path.answers;
  static const String answerCreate = Path.answers + Path.create;
  static const String create = Path.create;
  static const String my = Path.my;
  static const String point = Path.point;
  static const String pointInformation = Path.point + Path.information;
  static const String pointHistory = Path.point + Path.histories;
  static const String healthQuestions = Path.healthQuestions;
  static const String healthQuestionCreate = Path.healthQuestions + Path.create;
  static const String healthQuestionUpdate = Path.healthQuestions + Path.update;
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
  static const String my = '/my';
  static const String pinCode = '/pin-code';
  static const String point = '/point';
  static const String information = '/information';
  static const String healthQuestions = '/health-questions';
}
