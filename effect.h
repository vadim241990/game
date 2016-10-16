#ifndef EFFECT_H
#define EFFECT_H

#include <QObject>
#include <QApplication>
//////////////все классы выполняют роль структур(хранят данные)

//когда действует эффект
//ALWAYS - работает постоянно
//BEGIN_HOD - запускать когда ход к этому отряду пришел
enum job_effect  {ALWAYS,BEGIN_HOD};
enum type_effect {DAMAGE,PARALISH}; //как обрабатывать эффект

class Effect : public QObject
{
    Q_OBJECT

    QString name;

    QString image;

    job_effect job;

    type_effect type;

    bool ready; //false - если эффект прекращает свое действие иначе true

public:
    explicit Effect(QObject *parent = 0);
    ~Effect();

    static Effect * Create_effect(QString name);

    void set_name(QString name);
    QString get_name();

    void set_image(QString name);
    QString get_image();

    void set_job(job_effect value);
    job_effect get_job();

    void set_type(type_effect value);
    type_effect get_type();

    void set_ready(bool value);
    bool get_ready();

signals:

public slots:
};
/////////////////////////////////////
/////////////////////////////////////
/////////////////////////////////////

//class Effect_deferred_damage : public Effect
//{
//    int schetchik;
//    int damage;

//public:
//    explicit Effect_deferred_damage(int number_hod,int damage);
//    ~Effect_deferred_damage();
//};
/////////////////////////////////////
/////////////////////////////////////
/////////////////////////////////////

class Effect_paralish : public Effect
{
    int dlitelnost;

public:
    explicit Effect_paralish(int dlitelnost);
    ~Effect_paralish();

    void set_dlitelnost(int number);
    int get_dlitelnost();
};
/////////////////////////////////////
/////////////////////////////////////
/////////////////////////////////////

//class Effect_oslablenie : public Effect
//{
//    int dlitelnost;

//    int oslab_uron;                //в точных цифрах
//    int oslab_bron;                //
//    int oslab_inishiativa;         //
//    int oslab_toshnost;            //

//    int oslab_in_pro_uron;         //в процентах
//    int oslab_in_pro_bron;         //
//    int oslab_in_pro_inishiativa;  //
//    int oslab_in_pro_toshnost;     //

//public:
//    explicit Effect_oslablenie(QString name,int dlitelnost,int o_uron,int o_bron,int o_toshnost,int o_inishiativa, \
//int pro_uron,int pro_bron,int pro_toshnost,int pro_inishiativa);

//    //если type == true считаем в процентах
//    explicit Effect_oslablenie(QString name,int dlitelnost,bool type,int uron,int bron,int toshnost,int inishiativa);
//    ~Effect_oslablenie();
//};

#endif // EFFECT_H
