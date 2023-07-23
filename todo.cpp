#include "todo.h"

ToDo::ToDo(QObject* parent) : QObject{parent} {}

ToDo::ToDo(
    std::initializer_list<std::tuple<QString, QString, bool, QString, int> >
        ls) {
  for (const auto& c : ls) {
    m_toDoModelList << ToDoData{std::get<0>(c), std::get<1>(c), std::get<2>(c),
                                std::get<3>(c), std::get<4>(c)};
  };
}

int ToDo::count() const { return m_toDoModelList.size(); }

const QVector<ToDoData>& ToDo::getToDoData() { return m_toDoModelList; }

void ToDo::addToDoData(QString title, QString description, bool isTimed,
                       QString startTime, int elapsedTime) {
  emit preAdd();
  m_toDoModelList.append(
      ToDoData{title, description, isTimed, startTime, elapsedTime});
  qInfo() << "append " << m_toDoModelList.size();
  emit postAdd();
}

void ToDo::removeToDoData(int index) {
  emit preRemove(index);
  m_toDoModelList.removeAt(index);
  emit postRemoved();
}

void ToDo::calTimeElapsed() {
  // emit preAdd();
  qInfo() << "called ...from ll " << m_toDoModelList.size();
  for (int i = 0; i < m_toDoModelList.size(); i++) {
    if (m_toDoModelList[i].timeTo > 0) m_toDoModelList[i].timeTo -= 1;
    qInfo() << "the value change " << m_toDoModelList[i].timeTo;
    emit singleDataChanged(i);
  }
  // emit postAdd();
}
