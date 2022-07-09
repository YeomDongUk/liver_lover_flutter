import 'package:intl/intl.dart';
import 'package:yak/domain/entities/survey/medication_adherence/medication_adherence_survey_question.dart';
import 'package:yak/domain/entities/survey/sf12/sf12_question.dart';

/// 살의 질 질문항목
final sf12Questions = [
  ...[
    <String, dynamic>{
      'id': 0,
      'question': '전반적으로 귀하의 건강 상태는 어떠합니까?',
      'options': ['최고로 좋다', '아주 좋다', '좋다', '조금 나쁘다', '나쁘다'],
    },
    <String, dynamic>{
      'id': 1,
      'question':
          '''다음 문항들은 귀하가 평상시 하는 활동에 관한 것입니다. 귀하의 건강상태 때문에 이러한 일상적인 활동을 하는 데 제한을 받습니까? 만약 그렇다면, 어느 정도 제한을 받습니까?''',
      'items': [
        '다소 힘든 활동(예: 탁자 옮기기, 비로 방쓸기, 한두 시간 산보하기, 자전거 타기)',
        '계단으로 여러 층 걸어 올라가는 것',
      ],
      'options': [
        '예, 제한을 많이 받는다',
        '예, 제한을 조금 받는다',
        '아니오, 제한을 전혀 받지 않는다',
      ],
    },
    <String, dynamic>{
      'id': 2,
      'question':
          '''지난 4주 동안에, 귀하의 신체적인 건강 때문에 귀하의 일이나 일상적인 활동을 하는 데 다음과 같은 문제가 얼마나 자주 있었습니까?''',
      'items': ['원하는 것보다 적은 양의 일을 했다', '일이나 다른 일상적인 활동 중에서 할 수 없는 것이 있었다.'],
      'options': ['항상 그랬다', '대부분 그랬다', '때때로 그랬다', '드물게 그랬다', '전혀 그렇지 않았다'],
    },
    <String, dynamic>{
      'id': 3,
      'question':
          '''지난 4주 동안에, 정서적인 문제(예: 기분이 좋지 않거나 불안을 느끼는 것) 때문에 귀하의 일이나 일상적인 활동을 하는 데 다음과 강튼 문제가 얼마나 자주 있었습니까?''',
      'items': [
        '원하는 것보다 적은 양의 일을 했다',
        '일이나 다른 일상적인 활동을 하는 데 평소처럼 주의를 기울이지 못했다',
      ],
      'options': [
        '항상 그랬다',
        '대부분 그랬다',
        '때때로 그랬다',
        '드물게 그랬다',
        '전혀 그렇지 않았다',
      ],
    }
  ].map(SF12Question.fromJson),
  const SF12Question(
    id: 4,
    question:
        '''지난 4주 동안에, 귀하는 몸의 통증 때문에 정상적인 일 (집 밖의 일과 집안 일을 포함해서)을 하는 데 얼마나 지장이 있었습니까?''',
    options: [
      '전혀 없었다',
      '약간 있었다',
      '어느 정도 있었다',
      '많이 있었다',
      '대단히 극심했었다',
    ],
  ),
  const SF12Question(
    id: 5,
    question:
        '''아래의 질문들은 지난 4주 동안 귀하가 어떻게 느꼇고, 또 어떻게 지냈는지에 대한 설문입니다. 아래의 각 항목에 대하여, 귀하가 느꼇던 것과 가장 가까운 번호에 답해 주십시오. (지난 4주 동안에, 얼마나 자주)''',
    items: [
      '귀하는 차분하고 평온하다고 느끼셨습니까?',
      '귀하는 활력이 넘쳤습니까?',
      '귀하는 마음이 많이 상하고 우울했었습니까?',
    ],
    options: [
      '항상 그랬다',
      '대부분 그랬다',
      '때떄로 그랬다',
      '드물게 그랬다',
      '전혀 그렇지 않았다',
    ],
  ),
  const SF12Question(
    id: 6,
    question:
        '''지난 4주 동안에, 귀하의 신체적인 건강 문제 혹은 정서적인 문제로 인하여, 귀하의 사회 활동(예:친구나 친지 방문하는 것)에 얼마나 자주 지장이 있었습니까?''',
    options: [
      '항상 그랬다',
      '대부분 그랬다',
      '때떄로 그랬다',
      '드물게 그랬다',
      '전혀 그렇지 않았다',
    ],
  ),
];

final reservedAtDateFormat = DateFormat('yyyy.MM.dd HH:mm');

const medicationAdherenceSurveyQuestions = [
  MedicationAdherenceSurveyQuestion(
    id: 0,
    question: '귀하는 약을 복용하는 것을 잊어버리십니까?',
    options: ['예', '아니오'],
  ),
  MedicationAdherenceSurveyQuestion(
    id: 1,
    question: '지난 2주 동안 약을 먹는 것을 잊어서가 아니고 다른 이유로 약을 복용하지 않은 적이 있습니까?',
    options: ['예', '아니오'],
  ),
  MedicationAdherenceSurveyQuestion(
    id: 2,
    question:
        '귀하는 약을 복용한 후 증상이 더 나빠지는 것 같아서 의사에게 알리지 않고 약 용량을 줄이거나 중단한 적이 있습니까?',
    options: ['예', '아니오'],
  ),
  MedicationAdherenceSurveyQuestion(
    id: 3,
    question: '여행이나 외출 시 약을 챙겨가는 것을 가끔 잊어버리십니까?',
    options: ['예', '아니오'],
  ),
  MedicationAdherenceSurveyQuestion(
    id: 4,
    question: '어제 약을 드셨습니까?',
    options: ['예', '아니오'],
  ),
  MedicationAdherenceSurveyQuestion(
    id: 5,
    question: '귀하의 병이 잘 조절되는 것 같으면 가끔 약 복용을 중단하십니까?',
    options: ['예', '아니오'],
  ),
  MedicationAdherenceSurveyQuestion(
    id: 6,
    question:
        '매일 약을 복용하는 것은 실제로 불편한 일입니다. 귀하는 의사의 약물복용지시를 따르는 것이 귀찮다고 느끼신 적이 있습니까?',
    options: ['예', '아니오'],
  ),
  MedicationAdherenceSurveyQuestion(
    id: 7,
    question: '귀하는 복용해야 할 모든 약을 기억하는데 어려움을 얼마나 자주 느끼십니까?',
    options: ['전혀 (별로)', '드물게', '가끔', '자주', '언제나'],
  ),
];
