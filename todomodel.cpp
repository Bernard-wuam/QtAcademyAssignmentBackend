#include "todomodel.h"

TodoModel::TodoModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

int TodoModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    return m_toDoList.count();
}

QVariant TodoModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    auto c = index.row();

    const auto TitleRole = static_cast<int>(NameRole::TitleRole);
    const auto DescriptionRole = static_cast<int>(NameRole::DescriptionRole);
    const auto IsAlarmSetRole = static_cast<int>(NameRole::IsAlarmSetRole);
    const auto StartTimeRole = static_cast<int>(NameRole::StartTimeRole);

    switch (role) {
    case TitleRole: return m_toDoList.at(c).title;
    case DescriptionRole: return m_toDoList.at(c).description;
    case IsAlarmSetRole: return m_toDoList.at(c).startTime;
    case StartTimeRole: return m_toDoList.at(c).startTime;
    }
    return QVariant();
}

QHash<int, QByteArray> TodoModel::roleNames() const
{
    QHash<int, QByteArray> namerole;
    namerole[static_cast<int>(NameRole::TitleRole)] = "title";
    namerole[static_cast<int>(NameRole::DescriptionRole)] = "description";
    namerole[static_cast<int>(NameRole::IsAlarmSetRole)] = "isAlarmSet";
    namerole[static_cast<int>(NameRole::StartTimeRole)] = "startTime";
    return namerole;
}
