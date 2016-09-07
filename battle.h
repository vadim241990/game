#ifndef BATTLE_H
#define BATTLE_H

#include <QObject>
#include <QVector>
#include <QString>
#include "base_player.h"

class Battle : public QObject
{
    Q_OBJECT

    QList<Base_player *> blue_team;
    QList<Base_player *> red_team;
    QList<Base_player *> all_team;
    int many_za_boy;                //сколько опыта за бой
    QString name_battle;            //название битвы

    QString parsing_kill(QString res);

public:

    explicit Battle(QObject *parent = 0);
    ~Battle();
    
    void new_battle(QString text);
    void fabrica_players(QString name,int index,bool my_team);
    void sort_all_team();
    void perehod_hoda();
    QString get_stroka_all_team();
    QString get_stroka_all_team_start(); //возвращает строку с именами,коорд и жизнями для инициализации
    QString damage(int x,int y);
    QString hod_pc();
    int help_hod_pc(QString name_AI,QList<Base_player *> & other_team);
    QList<Base_player *> help_can_damage();
    QString get_full_info_otrad(int x,int y);

    int get_first_in_osheredi_x();
    int get_first_in_osheredi_y();
    QString get_first_name();
    QString get_first_in_osheredi_shel();
    QString get_first_in_osheredi_shel_attack();

    void set_name_battle(QString name);
    QString get_name_battle();

    int get_many_za_boy();
    int select_oshered(int x,int y);
    void clear();

signals:

public slots:
};

#endif // BATTLE_H
