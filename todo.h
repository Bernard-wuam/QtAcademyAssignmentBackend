#ifndef TODO_H
#define TODO_H

#include <QObject>
#include <QQmlEngine>
#include <tuple>

struct ToDoData {
  ToDoData(){};
  ToDoData(QString title, QString description, bool isAlarmSet,
           QString startTime)
      : title{title},
        description{description},
        isAlarmSet{isAlarmSet},
        startTime{startTime} {};

  QString title{};
  QString description{};
  bool isAlarmSet{};
  QString startTime{};
};

class ToDo : public QObject {
  Q_OBJECT
  QML_ELEMENT
 public:
  explicit ToDo(QObject* parent = nullptr);
  ToDo(std::initializer_list<std::tuple<QString, QString, bool, QString>>);

  int count() const;
  const QVector<ToDoData>& getToDoData();
  void addToDoData(QString, QString, bool, QString);
  void removeToDoData(int);

 signals:
  void preAdd();
  void postAdd();
  void preRemove(int index);
  void postRemoved();

 private:
  QVector<ToDoData> m_toDoModelList;
};

#endif  // TODO_H
