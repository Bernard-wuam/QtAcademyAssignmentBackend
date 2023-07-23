#ifndef TODODATABASE_H
#define TODODATABASE_H

#include <QDateTime>
#include <QDebug>
#include <QMap>
#include <QObject>
#include <QQmlEngine>
#include <QTime>
#include <QTimer>

#include "todo.h"

class ToDoDataBase : public QObject {
  Q_OBJECT
  QML_ELEMENT
  QML_SINGLETON
 public:
  explicit ToDoDataBase(QObject *parent = nullptr);

  Q_INVOKABLE ToDo *getTodo(int, int, int);
  Q_INVOKABLE void add(int, int, int, QString, QString, bool, int, int, int,
                       int);
  Q_INVOKABLE bool containTodo(int year, int month, int day) const;
 signals:
  void evaluateContaindo();

 private:
  QMap<QDateTime, ToDo *> m_database{
      {QDateTime{QDate{2023, 6, 11}, QTime{}},
       new ToDo{
           {"learning Qt", "write some code", 1, "9 : 30 pm", 60},
       }}};
  int calctimeinsec(QTime d);
  int numberOfSecondDiffrence(QTime t2, QTime t1);
  QTimer *m_timer = new QTimer{this};
};

#endif  // TODODATABASE_H
