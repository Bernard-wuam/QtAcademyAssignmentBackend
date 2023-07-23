#ifndef TODODATABASE_H
#define TODODATABASE_H

#include <QDateTime>
#include <QDebug>
#include <QMap>
#include <QObject>
#include <QQmlEngine>

#include "todo.h"

class ToDoDataBase : public QObject {
  Q_OBJECT
  QML_ELEMENT
  QML_SINGLETON
 public:
  explicit ToDoDataBase(QObject *parent = nullptr);

  Q_INVOKABLE ToDo *getTodo(int, int, int);
  Q_INVOKABLE void add(int, int, int, QString, QString, bool, int, int);
  Q_INVOKABLE bool containTodo(int year, int month, int day) const;
 signals:
  void evaluateContaindo();

 private:
  QMap<QDateTime, ToDo *> m_database{
      {QDateTime{QDate{2023, 7, 1}, QTime{}},
       new ToDo{{"doing soome coding", "writing some old stuff..", 1, "8:00pm"},
                {"doing soome coding", "writing some old stuff..", 1, "8:00pm"},
                {"listen to some new song and write down some lyrics",
                 "study the classic and review my strategy", 1, "9:00pm"}}},
      {QDateTime{QDate{2023, 6, 11}, QTime{}},
       new ToDo{
           {"learning Qt", "write some code", 1, "5:00pm"},
       }}};
};

#endif  // TODODATABASE_H
