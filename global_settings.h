#ifndef SELECT_WINDOWS_H
#define SELECT_WINDOWS_H

#include <QObject>
#include <QApplication>
#include <QtXml/QtXml>
#include "battle.h"


class global_settings : public QObject
{
    Q_OBJECT

    static global_settings * address;

    QApplication * app;

    int level_game;

    int number_date;

    int exp;                    //весь командный опыт
    QVector<int> exp_level;     //отметки необходимых баллов для нового уровня
    QString result_battle;      //результат поединка(миссии)(void - не завершилась, win - победа синих, game_over - победа красных)

    int level_team;             //текущий уровень команды

    QString name_geroy;

    QString image_geroy;

    QString position_otrad[2][3];  //расстановка отряда синей команды в меню армии

    QMap<QString,int> resurs; //золото и руда

    QMap<QString,bool> building; //здания куплено или нет

    QVector<QString> can_buy_otrad; //кого можно купить

    QVector<QString> otrad; //какие бойцы куплены

    QVector<QString> map_job; //коллекция миссий(выполненная миссия = "")

    QVector<bool> seath_otrad;

    // begin связано с уровнем героя
    int point_1; //очки умений на силу,ловкость и ...
    int point_2; //очки на умения
    int point_3; //очки на магию
    int point_sila;         //voin      15-10-20-10 - стартовый показатель
    int point_lovkost;      //mag       10-10-20-15
    int point_life;         //lushnik   10-15-20-10
    int point_energy;
    QVector<QString> books_magic; //книга с выбранными магиями

    QMap<QString,bool> geroy_skill; //какие умения прокачаны
    // end связано с уровнем героя
    
    Battle bat;

protected:
    explicit global_settings(QApplication * app,QObject * parent = 0);

public:
    static global_settings * global_settings_public(QApplication * app);
    static global_settings * get_global_settings();
    
    //функции для других классов на c++
    QString get_address_xml(QString name_unit);
    QString get_string_to_parsing(QString name);
    //end функции для других классов на c++
    
    Q_INVOKABLE void new_battle(QString select_job);
    Q_INVOKABLE QString get_oshered_hodov();
    Q_INVOKABLE QString get_stroka_start_game();

    Q_INVOKABLE int get_level_game();
    Q_INVOKABLE void set_level_game(int value);

    Q_INVOKABLE int get_number_date();
    Q_INVOKABLE void set_number_date(int value);

    Q_INVOKABLE int get_level_team();
    Q_INVOKABLE void set_level_team(int value);

    Q_INVOKABLE bool get_seath_otrad(int number);
    Q_INVOKABLE void set_seath_otrad(int number,bool value);

    Q_INVOKABLE int get_exp();
    Q_INVOKABLE void set_exp(int value);

    Q_INVOKABLE QString get_result_battle();
    Q_INVOKABLE void set_result_battle(QString text);

    Q_INVOKABLE QString get_name_geroy();
    Q_INVOKABLE QString get_real_name_geroy();
    Q_INVOKABLE void set_name_geroy(QString name);

    Q_INVOKABLE bool get_building(QString name);
    Q_INVOKABLE void set_building(QString name,bool value);

    Q_INVOKABLE int get_first_in_osheredi_x();
    Q_INVOKABLE int get_first_in_osheredi_y();

    Q_INVOKABLE QString get_first_in_osheredi_shel_attack();
    Q_INVOKABLE QString get_first_in_osheredi_shel();

    Q_INVOKABLE void add_can_buy_otrad(QString value);
    Q_INVOKABLE QString get_can_buy_otrad(int number);
    Q_INVOKABLE void remove_can_buy_otrad(int number);
    Q_INVOKABLE int get_can_buy_otrad_size();

    Q_INVOKABLE int get_map_job_size();
    Q_INVOKABLE void add_map_job(QString value);
    Q_INVOKABLE QString get_map_job_at(int number);
    Q_INVOKABLE void set_map_job_at(int number,QString value);

    Q_INVOKABLE void add_otrad(QString value);
    Q_INVOKABLE QString get_otrad(int number);
    Q_INVOKABLE int get_index_otrad(QString name);
    Q_INVOKABLE int get_otrad_size();

    Q_INVOKABLE void add_position_otrad(QString name,int x,int y);
    Q_INVOKABLE QString get_position_otrad(int x,int y);
    Q_INVOKABLE void rotation_position_otrad(int x,int y,int x1,int y1);
    Q_INVOKABLE bool position_otrad_size_more_zero();

    Q_INVOKABLE int get_resurs(QString name);
    Q_INVOKABLE void set_resurs(QString name,int value);

    Q_INVOKABLE QString get_image_geroy();

    Q_INVOKABLE int get_many_za_battle();

    Q_INVOKABLE QString get_sourse_otrad(QString name,int level = 0);

    Q_INVOKABLE int get_exp_level(int value);
    Q_INVOKABLE int get_exp_level_size();

    Q_INVOKABLE QString read_XML(QString name_file,QString name_unit,int number_level); //number_level(от 0 до 4)
    Q_INVOKABLE void random_map_job();
    Q_INVOKABLE QString damage(int x,int y);
    Q_INVOKABLE void perehod_hoda();
    Q_INVOKABLE int select_oshered(int x,int y);

    Q_INVOKABLE QString hod_pc();
    Q_INVOKABLE QString get_full_info_otrad(int x,int y);

    Q_INVOKABLE void job_ready();

    Q_INVOKABLE void remove_battle();

    // begin функции связанные с уровнем героя
    Q_INVOKABLE int get_point_sila();
    Q_INVOKABLE void set_point_sila(int number);

    Q_INVOKABLE int get_point_lovkost();
    Q_INVOKABLE void set_point_lovkost(int number);

    Q_INVOKABLE int get_point_life();
    Q_INVOKABLE void set_point_life(int number);

    Q_INVOKABLE int get_point_energy();
    Q_INVOKABLE void set_point_energy(int number);

    Q_INVOKABLE int get_point_1();
    Q_INVOKABLE void set_point_1(int number);
    Q_INVOKABLE void add_point_1();

    Q_INVOKABLE int get_point_2();
    Q_INVOKABLE void set_point_2(int number);
    Q_INVOKABLE void add_point_2();

    Q_INVOKABLE int get_point_3();
    Q_INVOKABLE void set_point_3(int number);
    Q_INVOKABLE void add_point_3();

    Q_INVOKABLE int get_add_life_for_geroy(QString name); //сколько добавляется герою к здоровью от прокачки
    Q_INVOKABLE int get_add_damage_for_geroy(QString name);

    Q_INVOKABLE int get_books_magic_use();
    Q_INVOKABLE void set_books_magic(int index, QString value);
    Q_INVOKABLE QString get_books_magic(int index);

    Q_INVOKABLE bool get_geroy_skill(QString key);
    Q_INVOKABLE void set_geroy_skill(QString key,bool value);
    // end функции связанные с уровнем героя

signals:

public slots:
    void quit();
};

#endif // SELECT_WINDOWS_H
