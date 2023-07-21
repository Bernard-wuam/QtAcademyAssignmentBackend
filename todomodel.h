#ifndef TODOMODEL_H
#define TODOMODEL_H

#include <QAbstractListModel>
#include <QtQml>
struct ToDo {
  ToDo(){};
  ToDo(QString title, QString description, bool isAlarmSet, QString startTime)
      : title{title},
        description{description},
        isAlarmSet{isAlarmSet},
        startTime{startTime} {};

  QString title{};
  QString description{};
  bool isAlarmSet{};
  QString startTime{};
};

class TodoModel : public QAbstractListModel {
  Q_OBJECT
  QML_ELEMENT

 public:
  explicit TodoModel(QObject *parent = nullptr);
  enum class NameRole {
    TitleRole = Qt::UserRole,
    DescriptionRole,
    IsAlarmSetRole,
    StartTimeRole
  };
  // Basic functionality:
  int rowCount(const QModelIndex &parent = QModelIndex()) const override;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const override;
  QHash<int, QByteArray> roleNames() const override;

 private:
  QVector<ToDo> m_toDoList{ToDo{"coding to night",
                                "learning learning some new series from Qt "
                                "grouplearning some new series from Qt "
                                "group some new series from Qt group learning "
                                "some new series from Qt group ",
                                1, "900"},
                           ToDo{"do my QtAcademy Assignment",
                                "after my dinner, at 7:00pm, i’ll take some "
                                "time, to read some pdf material, that ...",
                                1, "600"},
                           ToDo{"coding to night",
                                "learning learning some new series from Qt "
                                "grouplearning some new series from Qt "
                                "group some new series from Qt group learning "
                                "some new series from Qt group ",
                                1, "900"},
                           ToDo{"do my QtAcademy Assignment",
                                "after my dinner, at 7:00pm, i’ll take some "
                                "time, to read some pdf material, that ...",
                                1, "600"},
                           ToDo{"coding to night",
                                "learning learning some new series from Qt "
                                "grouplearning some new series from Qt "
                                "group some new series from Qt group learning "
                                "some new series from Qt group ",
                                1, "900"},
                           ToDo{"do my QtAcademy Assignment",
                                "after my dinner, at 7:00pm, i’ll take some "
                                "time, to read some pdf material, that ...",
                                1, "600"}};
};

#endif  // TODOMODEL_H
