#ifndef BASE_PLAYER_H
#define BASE_PLAYER_H

#include <QObject>
#include <memory>
#include "effect.h"

struct Result //вспомогательная структура
{
    int uron; //сколько получил урона
    bool kill; //получил смертельный урон
};

class Base_player : public QObject
{
    Q_OBJECT
    
    QString name_id; //уникальное имя с прифексом
    QString name;    //имя отряда для вывода может повторяться с другими отрядами
    QString type_damage;
    int ver_damage;
    int damage;
    int life; //максимум здоровья
    int bron;
    int inichiativa;
    QString shel;
    QString zashita;
    QString immunitet;
    QString shel_attack;
    QString description;

    //добавляют характеристики в процентном соотношении
    int bonus_damage;
    int bonus_life;
    int bonus_bron;
    int bonus_inichiativa;
    
    int point_X;
    int point_Y;
    int real_life;   //текущий показатель здоровья

    QList<std::shared_ptr<Effect>> plus;
    QList<std::shared_ptr<Effect>> minus;
    
protected:
	
    void create_unit(QString name,QString header,bool need_level);
    void create_geroy_skill(QVector<QString>& massiv);
    Base_player * seatsh_player(QList<Base_player *> list,int x,int y);
    bool immunitet_def(Base_player * player);
    bool zashita_def(Base_player * player);
    bool damage_popal();
    bool veroatnost(int procent_good_result);

    //вспомогательные методы
    QString help_attack_in_one(QList<Base_player *> list,int x,int y,QString image);
    QString help_attack_in_all(QList<Base_player *> list,int x,int y,QString image);

public:

    explicit Base_player(QObject *parent = 0);
    ~Base_player();

    QString base_res_stroka(Base_player * player);
    QString use_effect();

	int set_point_X(int number);
	int get_point_X();
	int set_point_Y(int number);
	int get_point_Y();

    int get_inichiativa();
    QString get_name();
    QString get_name_id();
    QString get_shel();
    QString get_shel_attack();
    QString get_zashita();
    QString get_immunitet();
    QString get_type_damage();
    QString get_description();
    int get_ver_damage();

    int get_life();
    void set_life(int number);

    int get_real_life();
    void set_real_life(int number);

    int get_damage();
    void set_damage(int number);

    int get_bron();
    void set_bron(int value);

    void set_bonus_damage(int value);
    int get_bonus_damage();
    void set_bonus_life(int value);
    int get_bonus_life();
    void set_bonus_bron(int value);
    int get_bonus_bron();
    void set_bonus_inichiativa(int value);
    int get_bonus_inichiativa();

    void add_plus_effect(QString name,QVector<int> &parametr);
    int size_plus_effect();
    void clear_plus_effect();

    void add_minus_effect(QString name,QVector<int> &parametr);
    std::shared_ptr<Effect> get_minus_at(int index);
    int size_minus_effect();
    void clear_minus_effect();

    QString parsing_result_for_update(QString parsing_text,QString text);
	
    virtual QString attack(int x, int y,QList<Base_player *> list);
    virtual Result result_damage(Base_player * player);

signals:

public slots:
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Heroes_voin : public Base_player
{
public:
	explicit Heroes_voin();
	~Heroes_voin();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Heroes_mag : public Base_player
{
public:
	explicit Heroes_mag();
	~Heroes_mag();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Heroes_luchnik : public Base_player
{
public:
	explicit Heroes_luchnik();
	~Heroes_luchnik();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_angel : public Base_player
{
public:
	explicit Team20_angel();
	~Team20_angel();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_arbaletshik : public Base_player
{
public:
	explicit Team20_arbaletshik();
	~Team20_arbaletshik();

    QString attack(int x, int y,QList<Base_player *> list);
    Result result_damage(Base_player * player);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_cold : public Base_player
{
public:
	explicit Team20_cold();
	~Team20_cold();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_dark_mag : public Base_player
{
public:
	explicit Team20_dark_mag();
	~Team20_dark_mag();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_elemental_cold : public Base_player
{
public:
	explicit Team20_elemental_cold();
	~Team20_elemental_cold();

    QString attack(int x, int y,QList<Base_player *> list);
    Result result_damage(Base_player * player);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_elemental_elektrisiti : public Base_player
{
public:
	explicit Team20_elemental_elektrisiti();
	~Team20_elemental_elektrisiti();
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_fier : public Base_player
{
public:
	explicit Team20_fier();
	~Team20_fier();

    QString attack(int x, int y,QList<Base_player *> list);
    Result result_damage(Base_player * player);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_fire_mag : public Base_player
{
public:
	explicit Team20_fire_mag();
	~Team20_fire_mag();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_golem : public Base_player
{
public:
	explicit Team20_golem();
	~Team20_golem();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_lekar : public Base_player
{
public:
	explicit Team20_lekar();
	~Team20_lekar();

    QString attack(int x, int y,QList<Base_player *> list);
    Result result_damage(Base_player * player);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_luchnik : public Base_player
{
public:
	explicit Team20_luchnik();
	~Team20_luchnik();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_molniy_mag : public Base_player
{
public:
	explicit Team20_molniy_mag();
	~Team20_molniy_mag();

    QString attack(int x, int y,QList<Base_player *> list);
    Result result_damage(Base_player * player);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_ogr : public Base_player
{
public:
	explicit Team20_ogr();
	~Team20_ogr();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_paralish : public Base_player
{
public:
	explicit Team20_paralish();
	~Team20_paralish();

    QString attack(int x, int y,QList<Base_player *> list);
    Result result_damage(Base_player * player);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_proklynaet : public Base_player
{
public:
	explicit Team20_proklynaet();
	~Team20_proklynaet();

    QString attack(int x, int y,QList<Base_player *> list);
    Result result_damage(Base_player * player);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_shelitel : public Base_player
{
public:
	explicit Team20_shelitel();
	~Team20_shelitel();

    QString attack(int x, int y,QList<Base_player *> list);
    Result result_damage(Base_player * player);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_simbiot : public Base_player
{
public:
	explicit Team20_simbiot();
	~Team20_simbiot();

    QString attack(int x, int y,QList<Base_player *> list);
    Result result_damage(Base_player * player);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_skelet : public Base_player
{
public:
	explicit Team20_skelet();
	~Team20_skelet();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_vampir : public Base_player
{
public:
	explicit Team20_vampir();
	~Team20_vampir();
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Team20_vsadnik : public Base_player
{
public:
	explicit Team20_vsadnik();
	~Team20_vsadnik();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Other_goblin_lushnik : public Base_player
{
public:
	explicit Other_goblin_lushnik();
	~Other_goblin_lushnik();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Other_goblin_voin : public Base_player
{
public:
	explicit Other_goblin_voin();
	~Other_goblin_voin();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Other_krestyanin : public Base_player
{
public:
	explicit Other_krestyanin();
	~Other_krestyanin();

    QString attack(int x, int y,QList<Base_player *> list);
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Other_lushnik : public Base_player
{
public:
	explicit Other_lushnik();
	~Other_lushnik();
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Other_main_l1 : public Base_player
{
public:
	explicit Other_main_l1();
	~Other_main_l1();
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Other_main_strash : public Base_player
{
public:
	explicit Other_main_strash();
	~Other_main_strash();
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Other_meshnik : public Base_player
{
public:
	explicit Other_meshnik();
	~Other_meshnik();
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
class Other_zashitnik : public Base_player
{
public:
	explicit Other_zashitnik();
	~Other_zashitnik();
};
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

#endif // BASE_PLAYER_H
