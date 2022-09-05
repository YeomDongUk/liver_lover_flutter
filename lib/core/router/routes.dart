class Routes {
  const Routes._();

  static const auth = Path.auth;
  static const login = Path.auth + Path.login;
  static const join = Path.auth + Path.join;
  static const home = Path.home;
  static const hospitalVisitSchedules = Path.hospitalVisitSchedules;
  static const hospitalVisitScheduleCreate =
      Path.hospitalVisitSchedules + Path.create;
  static const hospitalVisitSchedulesCalendar =
      Path.hospitalVisitSchedules + Path.calendar;
  static const hospitalVisitScheduleUpdate =
      Path.hospitalVisitSchedules + Path.update;
  static const hospitalVisitScheduleHistories =
      Path.hospitalVisitSchedules + Path.histories;
  static const myPinCodeUpdate = Path.my + Path.pinCode + Path.update;
  // '${Path.hospitalVisitSchedules}/create';
  static const sf12Surveys = Path.sf12Surveys;
  static const medicationAdherenceSurveys = Path.medicationAdherenceSurveys;
  static const answers = Path.answers;
  static const answerCreate = Path.answers + Path.create;
  static const create = Path.create;
  static const my = Path.my;
  static const point = Path.point;
  static const pointInformation = Path.point + Path.information;
  static const pointHistory = Path.point + Path.histories;
  static const healthQuestions = Path.healthQuestions;
  static const healthQuestionCreate = Path.healthQuestions + Path.create;
  static const healthQuestionUpdate = Path.healthQuestions + Path.update;
  static const smokingHistories = Path.smokingHistories;
  static const excerciseHistories = Path.excerciseHistories;
  static const graphs = Path.graphs;
  static const dringkingHistoriesGraphs = Path.dringkingHistories + Path.graphs;
  static const smokingHistoriesGraphs = Path.smokingHistories + Path.graphs;
  static const excerciseHistoriesGraphs = Path.excerciseHistories + Path.graphs;
  static const medicationSchedules = Path.medicationSchedules;
  static const medicationSchedulesCreate =
      Path.medicationSchedules + Path.create;

  static const medicationSchedulesCalendar =
      Path.medicationSchedules + Path.calendar;
}

class Path {
  const Path._();
  static const home = '/';
  static const auth = '/auth';
  static const login = '/login';
  static const join = '/join';
  static const hospitalVisitSchedules = '/hospital-visit-schedules';
  static const create = '/create';
  static const update = '/update';
  static const histories = '/histories';
  static const sf12Surveys = '/sf-12-surveys';
  static const medicationAdherenceSurveys = '/medication-adherence-surveys';
  static const answers = '/answers';
  static const my = '/my';
  static const pinCode = '/pin-code';
  static const point = '/point';
  static const information = '/information';
  static const healthQuestions = '/health-questions';
  static const dringkingHistories = '/drinking-histories';
  static const smokingHistories = '/smoking-histories';
  static const excerciseHistories = '/excercise-histories';
  static const graphs = '/graphs';
  static const calendar = '/calendar';
  static const medicationSchedules = '/medication-schedules';
}
