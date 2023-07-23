#include "tododatabase.h"

ToDoDataBase::ToDoDataBase(QObject* parent) : QObject{parent} {}

ToDo* ToDoDataBase::getTodo(int year, int month, int day) {
  QDateTime index{QDate{year, month, day}, QTime{0, 0, 0}};
  if (m_database.contains(index)) return m_database[index];
  return nullptr;
}

bool ToDoDataBase::containTodo(int year, int month, int day) const {
  QDateTime index{QDate{year, month, day}, QTime{0, 0, 0}};
  return (m_database.contains(index));
}

void ToDoDataBase::add(int year, int month, int day, QString title,
                       QString description, bool isTime, int hour, int minute) {
  QDateTime index{QDate{year, month, day}, QTime{0, 0, 0}};
  if (m_database.contains(index)) {
    m_database[index]->addToDoData(title, description, 1, "6:00pm");
    return;
  }
  m_database[index] = new ToDo{{title, description, 1, "6:00pm"}};
  emit evaluateContaindo();
};
