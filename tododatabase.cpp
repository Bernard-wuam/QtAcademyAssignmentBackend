#include "tododatabase.h"

ToDoDataBase::ToDoDataBase(QObject* parent) : QObject{parent} {
  m_timer->start(1000);
}

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
                       QString description, bool isTime, int startHour,
                       int startMinute, int endHour, int endMinute) {
  QDateTime index{QDate{year, month, day}, QTime{0, 0, 0}};

  QTime t1{startHour, startMinute, 0};
  QTime t2{endHour, endMinute, 0};

  int c = numberOfSecondDiffrence(t2, t1);
  QString time = QString::number(startHour) + " : " +
                 QString::number(startMinute) + " pm ";
  qInfo() << "the end time is :" << c;

  if (m_database.contains(index)) {
    m_database[index]->addToDoData(title, description, 1, time, c);
    return;
  }
  m_database[index] = new ToDo{{title, description, 1, time, c}};
  auto d = m_database[index];
  connect(m_timer, &QTimer::timeout, d, &ToDo::calTimeElapsed);
  emit evaluateContaindo();
};

int ToDoDataBase::numberOfSecondDiffrence(QTime t2, QTime t1) {
  return calctimeinsec(t2) - calctimeinsec(t1);
};

int ToDoDataBase::calctimeinsec(QTime d) {
  auto hoursinsec = d.hour() * 60 * 60;
  auto minuteinsec = d.minute() * 60;
  return hoursinsec + minuteinsec + d.second();
}
