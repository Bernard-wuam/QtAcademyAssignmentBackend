#include "todolistmodel.h"

ToDoListModel::ToDoListModel(QObject *parent) : QAbstractListModel(parent) {}

int ToDoListModel::rowCount(const QModelIndex &parent) const {
  // For list models only the root node (an invalid parent) should return the
  // list's size. For all other (valid) parents, rowCount() should return 0 so
  // that it does not become a tree model.
  if (parent.isValid() || !m_toDoItemList) return 0;

  return m_toDoItemList->count();
}

QVariant ToDoListModel::data(const QModelIndex &index, int role) const {
  if (!index.isValid() || !m_toDoItemList) return QVariant();
  auto c = index.row();

  const auto TitleRole = static_cast<int>(NameRole::TitleRole);
  const auto DescriptionRole = static_cast<int>(NameRole::DescriptionRole);
  const auto IsAlarmSetRole = static_cast<int>(NameRole::IsAlarmSetRole);
  const auto StartTimeRole = static_cast<int>(NameRole::StartTimeRole);

  switch (role) {
    case TitleRole:
      return m_toDoItemList->getToDoData().at(c).title;
    case DescriptionRole:
      return m_toDoItemList->getToDoData().at(c).description;
    case IsAlarmSetRole:
      return m_toDoItemList->getToDoData().at(c).isAlarmSet;
    case StartTimeRole:
      return m_toDoItemList->getToDoData().at(c).startTime;
  }
  return QVariant();
}

QHash<int, QByteArray> ToDoListModel::roleNames() const {
  QHash<int, QByteArray> namerole;
  namerole[static_cast<int>(NameRole::TitleRole)] = "title";
  namerole[static_cast<int>(NameRole::DescriptionRole)] = "description";
  namerole[static_cast<int>(NameRole::IsAlarmSetRole)] = "isAlarmSet";
  namerole[static_cast<int>(NameRole::StartTimeRole)] = "startTime";
  return namerole;
}

ToDo *ToDoListModel::toDoItemList() const { return m_toDoItemList; }

void ToDoListModel::setToDoItemList(ToDo *newToDoItemList) {
  if (m_toDoItemList == newToDoItemList) return;

  beginResetModel();

  if (m_toDoItemList) m_toDoItemList->disconnect(this);

  m_toDoItemList = newToDoItemList;

  if (m_toDoItemList) {
    connect(m_toDoItemList, &ToDo::preAdd, this, [=]() {
      auto index = m_toDoItemList->count();
      beginInsertRows(QModelIndex(), index, index);
    });

    connect(m_toDoItemList, &ToDo::postAdd, this, [=]() { endInsertRows(); });

    connect(m_toDoItemList, &ToDo::preRemove, this,
            [=](int index) { beginRemoveRows(QModelIndex(), index, index); });

    connect(m_toDoItemList, &ToDo::postRemoved, this,
            [=]() { endRemoveRows(); });
  }
  endResetModel();
  emit toDoItemListChanged();
}

void ToDoListModel::add(QString title, QString description, bool isTimed,
                        QString startTime) {
  m_toDoItemList->addToDoData(title, description, isTimed, startTime);
}
