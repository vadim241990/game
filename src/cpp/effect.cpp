#include "../include/effect.h"
/**
******************************************************************************
*  <P>Список основных методов базового класса(не включает методы аналоги свойств):
*  processing_type_damage   - формирование строки для типа DAMAGE
*  processing_type_paralish - формирование строки для типа PARALISH
*  result_damage            - формирование последствий от применения эффекта с типом DAMAGE
*  use_effect               - виртуальный метод для последующих реализаций эффекта
*  </P>
******************************************************************************
*/

Effect::Effect(QObject *parent) : QObject(parent)
{

}

Effect::~Effect()
{

}

void Effect::set_name(QString name)
{
    this->name = name;
}

QString Effect::get_name()
{
    return this->name;
}

void Effect::set_image(QString name)
{
    this->image = name;
}

QString Effect::get_image()
{
    return this->image;
}

void Effect::set_job(job_effect value)
{
    this->job = value;
}

job_effect Effect::get_job()
{
    return this->job;
}

void Effect::set_type(type_effect value)
{
    this->type = value;
}

type_effect Effect::get_type()
{
    return this->type;
}

void Effect::set_ready(bool value)
{
    this->ready = value;
}

bool Effect::get_ready()
{
    return this->ready;
}

/**
 * @brief Create_effect - создание эффекта
 *
 * @param [in] name - несколько разных имен могут относиться к одному классу
 *
 * @return указатель на Effect
 */
std::shared_ptr<Effect> Effect::Create_effect(QString name,QVector<int> &parametr)
{
    std::shared_ptr<Effect> eff(nullptr);

    if(name == "Паралич_1")
        eff = std::make_shared<Effect_paralish>(1);
    else if(name == "Ослабление_1")
        eff = std::make_shared<Effect_oslablenie>(name,2,parametr.at(0),parametr.at(1),parametr.at(2),parametr.at(3),parametr.at(4),parametr.at(5));
    else if(name == "Возмездие_1")
        eff = std::make_shared<Effect_deferred_damage>(3,80);

    return eff;
}

/////////////////////////////////////
/////////////////////////////////////
/////////////////////////////////////

Effect_deferred_damage::Effect_deferred_damage(int number_hod,int damage)
{
    this->set_name("Возмездие");
    this->set_image("file:///" + QApplication::applicationDirPath() + "/image/battle/image_effect/frostbite.png");
    this->set_job(job_effect::BEGIN_HOD);
    this->set_type(type_effect::DAMAGE);
    this->schetchik = number_hod;
    this->damage = damage;
    this->set_ready(true);
}

Effect_deferred_damage::~Effect_deferred_damage()
{
}

void Effect_deferred_damage::set_schetchik(int value)
{
    this->schetchik = value;
}

int Effect_deferred_damage::get_schetchik()
{
    return this->schetchik;
}

void Effect_deferred_damage::set_damage(int value)
{
    this->damage = value;
}

int Effect_deferred_damage::get_damage()
{
    return this->damage;
}

/////////////////////////////////////
/////////////////////////////////////
/////////////////////////////////////

Effect_paralish::Effect_paralish(int dlitelnost)
{
    this->set_name("Паралич");
    this->set_image("file:///" + QApplication::applicationDirPath() + "/image/battle/image_effect/shep.png");
    this->set_job(job_effect::BEGIN_HOD);
    this->set_type(type_effect::PARALISH);
    this->dlitelnost = dlitelnost;
    this->set_ready(true);
}

Effect_paralish::~Effect_paralish()
{

}

void Effect_paralish::set_dlitelnost(int number)
{
    this->dlitelnost = number;
}

int Effect_paralish::get_dlitelnost()
{
    return this->dlitelnost;
}

/////////////////////////////////////
/////////////////////////////////////
/////////////////////////////////////

Effect_oslablenie::Effect_oslablenie(QString name,int dlitelnost,int o_uron,int o_bron,int o_toshnost, \
int pro_uron,int pro_bron,int pro_toshnost)
{
    this->dlitelnost = dlitelnost;
    this->set_job(job_effect::BEGIN_HOD);
    this->set_type(type_effect::OSLABLENIE);
    this->set_ready(true);

    this->oslab_uron = 0;
    this->oslab_bron = 0;
    this->oslab_toshnost = 0;
    this->oslab_in_pro_uron = 0;
    this->oslab_in_pro_bron = 0;
    this->oslab_in_pro_toshnost = 0;

    if(name == "Ослабление_1")
    {
        this->set_name("Ослабление");
        this->use_oslab_in_pro_uron = pro_uron;
        this->oslab_in_pro_uron = 20;
        this->use_oslab_bron = o_bron;
        this->oslab_bron = 15;
    }
}

Effect_oslablenie::~Effect_oslablenie()
{

}

int Effect_oslablenie::get_dlitelnost()
{
    return this->dlitelnost;
}

void Effect_oslablenie::set_dlitelnost(int value)
{
    this->dlitelnost = value;
}

int Effect_oslablenie::get_use_oslab_uron()
{
    return this->use_oslab_uron;
}

int Effect_oslablenie::get_use_oslab_bron()
{
    return this->use_oslab_bron;
}

int Effect_oslablenie::get_use_oslab_toshnost()
{
    return this->use_oslab_toshnost;
}

int Effect_oslablenie::get_use_oslab_in_pro_uron()
{
    return this->use_oslab_in_pro_uron;
}
int Effect_oslablenie::get_use_oslab_in_pro_bron()
{
    return this->use_oslab_in_pro_bron;
}
int Effect_oslablenie::get_use_oslab_in_pro_toshnost()
{
    return this->use_oslab_in_pro_toshnost;
}

int Effect_oslablenie::get_oslab_uron()
{
    return this->oslab_uron;
}

int Effect_oslablenie::get_oslab_bron()
{
    return this->oslab_bron;
}

int Effect_oslablenie::get_oslab_toshnost()
{
    return this->oslab_toshnost;
}

int Effect_oslablenie::get_oslab_in_pro_uron()
{
    return this->oslab_in_pro_uron;
}

int Effect_oslablenie::get_oslab_in_pro_bron()
{
    return this->oslab_in_pro_bron;
}

int Effect_oslablenie::get_oslab_in_pro_toshnost()
{
    return this->oslab_in_pro_toshnost;
}
