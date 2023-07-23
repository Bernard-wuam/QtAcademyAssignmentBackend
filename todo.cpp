#include "todo.h"

ToDo::ToDo(QObject* parent) : QObject{parent} {}

ToDo::ToDo(
    std::initializer_list<std::tuple<QString, QString, bool, QString> > ls) {
  for (const auto& c : ls) {
    m_toDoModelList << ToDoData{std::get<0>(c), std::get<1>(c), std::get<2>(c),
                                std::get<3>(c)};
  };
}

int ToDo::count() const { return m_toDoModelList.size(); }

const QVector<ToDoData>& ToDo::getToDoData() { return m_toDoModelList; }

void ToDo::addToDoData(QString title, QString description, bool isTimed,
                       QString time) {
  emit preAdd();
  m_toDoModelList.append(ToDoData{title, description, isTimed, time});
  qInfo() << "append " << m_toDoModelList.size();
  emit postAdd();
}

void ToDo::removeToDoData(int index) {
  emit preRemove(index);
  m_toDoModelList.removeAt(index);
  emit postRemoved();
}
