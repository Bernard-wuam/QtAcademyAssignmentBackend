#ifndef TODO_H
#define TODO_H

#include <QObject>
#include <QQmlEngine>
#include <QTime>
#include <QTimer>
#include <tuple>

struct ToDoData {
  ToDoData(){};
  ToDoData(QString title, QString description, bool isAlarmSet,
           QString startTime, int timeTo)
      : title{title},
        description{description},
        isAlarmSet{isAlarmSet},
        startTime{startTime},
        timeTo{timeTo} {};

  QString title{};
  QString description{};
  bool isAlarmSet{};
  QString startTime;
  int timeTo{};
};

class ToDo : public QObject {
  Q_OBJECT
  QML_ELEMENT

 public:
  explicit ToDo(QObject* parent = nullptr);
  ToDo(std::initializer_list<std::tuple<QString, QString, bool, QString, int>>);

  int count() const;
  const QVector<ToDoData>& getToDoData();
  void addToDoData(QString, QString, bool, QString, int);
  void removeToDoData(int);

 signals:
  void preAdd();
  void postAdd();
  void preRemove(int index);
  void postRemoved();
  void singleDataChanged(int index);

 public slots:
  void calTimeElapsed();

 private:
  QVector<ToDoData> m_toDoModelList{};
};

#endif  // TODO_H
