import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:yak/domain/entities/survey/sf12/sf12_question.dart';

class SF12SurveyQuestionListTile extends StatelessWidget {
  const SF12SurveyQuestionListTile({
    super.key,
    required this.sf12surveyQuestion,
    required this.answers,
    required this.setAnswer,
  });

  final SF12Question sf12surveyQuestion;
  final List<String> answers;

  final void Function(List<String> answer) setAnswer;
  @override
  Widget build(BuildContext context) {
    final items = sf12surveyQuestion.items;
    final questionSeq = sf12surveyQuestion.id + 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            height: 16,
          ),
          Text('${sf12surveyQuestion.id + 1}. ${sf12surveyQuestion.question}'),
          const Divider(
            height: 16,
          ),
          if (items == null)
            ...sf12surveyQuestion.options.mapIndexed(
              (i, e) => Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    InkResponse(
                      onTap: () => setAnswer(['$i']),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: answers.contains(i.toString())
                              ? Colors.red
                              : Colors.transparent,
                          border: Border.all(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Text(e),
                  ],
                ),
              ),
            )
          else
            ...List.generate(
              items.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('$questionSeq-${index + 1}. ${items[index]}'),
                    const Divider(
                      height: 16,
                    ),
                    ...sf12surveyQuestion.options.mapIndexed(
                      (i, e) => Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            InkResponse(
                              onTap: () {
                                if (answers.length < items.length) {
                                  setAnswer(
                                    List.generate(
                                      items.length,
                                      (index) => '',
                                    )..[index] = '$i',
                                  );
                                } else {
                                  setAnswer(List.from(answers)..[index] = '$i');
                                }
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: answers.length < items.length
                                      ? Colors.transparent
                                      : answers[index].contains(i.toString())
                                          ? Colors.red
                                          : Colors.transparent,
                                  border: Border.all(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Text(e),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
