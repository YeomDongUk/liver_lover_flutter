// Package imports:
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:yak/domain/entities/survey/medication_adherence/medication_adherence_survey_question.dart';
import 'package:yak/domain/entities/survey/sf12/sf12_question.dart';

const simpleCommonSenses = [
  '만성 B형, C형간염은 진단할 때 혈액검사와 복부 영상 (초음파, CT 등) 검사가 필요해요.',
  '항바이러스 치료는 간염의 진행을 막고 간경변증과 간세포암 같은 합병증을 낮춰줘요. ',
  '만 40세 이상의 만성 B형, C형간염 환자는 6개월에 한번 간암 검진이 필요해요. ',
  '항바이러스제를 임의로 중단하면 약제 내성과 간부전이 발생할 수 있어요. ',
  'A형, B형간염은 예방접종이 있고 C형 간염은 예방접종이 없어요. ',
  '영양분이 고른 균형 잡힌 음식을 섭취가 필요해요.',
  '우리나라 만성 B형간염, C형간염 유병률은 각각 약 3%, 0.6% 정도 예요.',
  '함께 생활하는 가족들도 B형, C형간염 검사를 받는게 좋아요.',
  '간세포암 검진을 꾸준히 받으면 생존율이 향상돼요. ',
  '만성 C형간염 약들은 다른 약제와 약물 상호작용 확인이 필요해요.',
  '가족을 위해 혈액이 묻는 생활기구(면도기, 칫솔, 손톱깍이)는 따로 쓰는게 좋아요. ',
  '만성 B형, C형간염 환자는 A형간염 예방접종이 필요해요. ',
  '임신/수유 중 항바이러스제를 복용할 수 있지만 담당 의사와 함께 신중하게 결정해야해요.',
  '적당한 운동은 건강한 간을 유지하는데 도움이 돼요. ',
  '드물게 만성 B형, C형중복감염도 일어나요. ',
  '만성 B, C형간염은 대부분 증상이 없어요. ',
  '만성 B형간염은 대부분 평생, 만성 C형간염은 2-3달 정도 항바이러스제를 복용해요.',
  '만성 B형, C형간염은 악수, 포옹, 가벼운 입맞춤, 재채기 등으로 전염 되진 않아요.',
  '양약뿐 아니라 각종 건강보조식품과 생약제도 간에 손상을 줄 수 있어요. ',
  '간경변증이 없어도 만성 B형, C형간염이 있으면 간세포암이 발생할 수 있어요.',
  '간경변증, 간세포암은 증상이 없어서 주기적으로 건강검진을 받는게 중요해요. ',
  '의료행위, 문신, 피어싱, 침술 등으로 B형, C형간염이 전염될 수 있어요. ',
  '섬유소가 많은 음식을 먹고, 기름진 음식을 줄이며, 싱겁게 먹는게 좋아요.',
  '간섬유화 정도는 혈액이나 간섬유화스캔으로도 확인할 수 있어요. ',
  '간세포암 검진으로는 알파태아단백과 복부 초음파가 추천돼요.',
  '항바이러스제 중단은 담당 의사와 함께 매우 신중하게 결정해야해요.',
  '만성 B형, C형간염 환자에서 당뇨, 비만, 대사증후군 관리가 필요해요. ',
  '항암제나 면역억제치료 전에는 예방적 항바이러스제가 필요할 수 있어요. ',
  '만성 B형간염 환자는 B형간염 예방접종은 효과가 없어요. ',
];

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
      'items': [
        '원하는 것보다 적은 양의 일을 했다',
        '일이나 다른 일상적인 활동 중에서 할 수 없는 것이 있었다.',
      ],
      'options': ['항상 그랬다', '대부분 그랬다', '때때로 그랬다', '드물게 그랬다', '전혀 그렇지 않았다'],
    },
    <String, dynamic>{
      'id': 3,
      'question':
          '''지난 4주 동안에, 정서적인 문제(예: 기분이 좋지 않거나 불안을 느끼는 것) 때문에 귀하의 일이나 일상적인 활동을 하는 데 다음과 같은 문제가 얼마나 자주 있었습니까?''',
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
        '''아래의 질문들은 지난 4주 동안 귀하가 어떻게 느꼈고, 또 어떻게 지냈는지에 대한 설문입니다. 아래의 각 항목에 대하여, 귀하가 느꼈던 것과 가장 가까운 번호에 답해 주십시오. (지난 4주 동안에, 얼마나 자주)''',
    items: [
      '귀하는 차분하고 평온하다고 느끼셨습니까?',
      '귀하는 활력이 넘쳤습니까?',
      '귀하는 마음이 많이 상하고 우울했었습니까?',
    ],
    options: [
      '항상 그랬다',
      '대부분 그랬다',
      '때때로 그랬다',
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
      '때때로 그랬다',
      '드물게 그랬다',
      '전혀 그렇지 않았다',
    ],
  ),
];

final reservedAtDateFormat = DateFormat('yyyy.MM.dd HH:mm');
final yyyyMMddFormat = DateFormat('yyyy.MM.dd');
final yyyyMMFormat = DateFormat('yyyy.MM');
final mmDDFormat = DateFormat('MM.dd');
final hhmmFormat = DateFormat('HH:mm');
final numberForamt = NumberFormat('###,###,###,###.###');

FilteringTextInputFormatter get doubleTextInputFormatter =>
    FilteringTextInputFormatter.allow(
      RegExp(r'^\d+\.?\d{0,2}'),
    );

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
