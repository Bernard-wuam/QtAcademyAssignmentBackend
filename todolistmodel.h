#ifndef TODOLISTMODEL_H
#define TODOLISTMODEL_H

#include <QAbstractListModel>
#include <QQmlEngine>

#include "todo.h"

class ToDoListModel : public QAbstractListModel {
  Q_OBJECT
  QML_ELEMENT

  Q_PROPERTY(ToDo *toDoItemList READ toDoItemList WRITE setToDoItemList NOTIFY
                 toDoItemListChanged)
 public:
  explicit ToDoListModel(QObject *parent = nullptr);

  enum class NameRole {
    TitleRole = Qt::UserRole,
    DescriptionRole,
    IsAlarmSetRole,
    StartTimeRole,
    TimeElasedRole
  };

  // Basic functionality:
  int rowCount(const QModelIndex &parent = QModelIndex()) const override;

  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const override;
  QHash<int, QByteArray> roleNames() const override;

  ToDo *toDoItemList() const;
  void setToDoItemList(ToDo *newToDoItemList);
  // Q_INVOKABLE void add(QString, QString, bool, int, int, int, int);

 signals:
  void toDoItemListChanged();

 private:
  ToDo *m_toDoItemList = new ToDo{this};
};

#endif  // TODOLISTMODEL_H
