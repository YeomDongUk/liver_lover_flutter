// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:yak/core/static/color.dart';
import 'package:yak/core/static/text_style.dart';
import 'package:yak/domain/entities/survey/sf12/sf12_question.dart';
import 'package:yak/domain/entities/survey/survey_question.dart';

/// only String or List<String>
class SurveyQuestionListTile<T> extends StatelessWidget {
  const SurveyQuestionListTile({
    super.key,
    required this.done,
    required this.surveyQuestion,
    required this.answer,
    required this.setAnswer,
  }) : assert(
          T is! String && T is! List<String>,
          'the answer type is only String or List<String>',
        );

  final SurveryQuestion surveyQuestion;
  final bool done;
  final T answer;
  final void Function(T answer)? setAnswer;

  @override
  Widget build(BuildContext context) {
    final items = surveyQuestion is SF12Question
        ? (surveyQuestion as SF12Question).items
        : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${surveyQuestion.id + 1}. ${surveyQuestion.question}',
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).primaryColor,
            ).rixMGoEB,
          ),
          const SizedBox(height: 16),
          if (items == null)
            ...List.generate(
              surveyQuestion.options.isEmpty
                  ? 0
                  : surveyQuestion.options.length * 2 - 1,
              (index) {
                final i = index ~/ 2;
                final option = surveyQuestion.options[i];
                return index.isOdd
                    ? const SizedBox(height: 10)
                    : SurveyOptionTile(
                        done: done,
                        index: i,
                        onTap: setAnswer == null
                            ? null
                            : () => setAnswer?.call(
                                  answer is! List
                                      ? '$i' as T
                                      : <String>['$i'] as T,
                                ),
                        option: option,
                        isSelected: answer is! List
                            ? answer == '$i'
                            : (answer as List).contains(i.toString()),
                      );
              },
            )
          else
            ...List.generate(
              items.length,
              (questionIndex) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (questionIndex > 0) const SizedBox(height: 24),
                  Text(
                    '''${String.fromCharCode(97 + questionIndex)}. ${items[questionIndex]}''',
                  ),
                  const SizedBox(height: 16),
                  ...List.generate(
                    surveyQuestion.options.isEmpty
                        ? 0
                        : surveyQuestion.options.length * 2 - 1,
                    (itemIndex) {
                      final i = itemIndex ~/ 2;
                      final option = surveyQuestion.options[i];
                      return itemIndex.isOdd
                          ? const SizedBox(height: 10)
                          : SurveyOptionTile(
                              done: done,
                              index: i,
                              onTap: setAnswer == null
                                  ? null
                                  : () {
                                      final newAnswer = ((answer as List)
                                                  .length <
                                              items.length
                                          ? List.generate(
                                              items.length,
                                              (index) => '',
                                            )
                                          : List<String>.from(
                                              answer as List<String>,
                                            ))
                                        ..[questionIndex] = '$i';

                                      setAnswer?.call(newAnswer as T);
                                    },
                              option: option,
                              isSelected:
                                  (answer as List).length >= items.length &&
                                      (answer as List<String>)
                                          .elementAt(questionIndex)
                                          .contains(i.toString()),
                            );
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class SurveyOptionTile extends StatelessWidget {
  const SurveyOptionTile({
    super.key,
    required this.done,
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.option,
  });
  final bool done;
  final int index;
  final String option;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ColoredBox(
        color: Colors.transparent,
        child: Row(
          children: [
            Material(
              shape: const CircleBorder(),
              child: InkWell(
                onTap: done ? null : onTap,
                customBorder: const CircleBorder(),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  padding: const EdgeInsets.all(2),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: isSelected && !done
                          ? Theme.of(context).primaryColor
                          : AppColors.gray,
                    ),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          // answers.contains(i.toString())
                          ? done
                              ? AppColors.gray
                              : Theme.of(context).primaryColor
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${index + 1}. $option',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.blueGrayDark,
                height: 17 / 13,
              ).rixMGoM,
            ),
          ],
        ),
      ),
    );
  }
}
