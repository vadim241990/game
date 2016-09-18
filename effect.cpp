#include "effect.h"
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
 * @brief processing_type_damage - формирование строки для типа DAMAGE
 *
 * @param [in] player - указатель на отряд с этим эффектом
 * @param [in] image - строка с адресом картинки
 *
 * @return сформированную строку с результатами последствий от DAMAGE
 */
QString Effect::processing_type_damage(Base_player * player, QString image, int damage)
{
    QString res;
    QString pop_back = "";
    QString push_back_res = "false$";

    Result message = this->result_damage(player,damage);

    if(message.kill == true)  //нанесен ли смертельный урон(смерть - true)
    {
        //"*" -разделитель координат //"@" - разделитель отрядов //"^" - разделитель на направление интерфейс и реализация
        pop_back = QString::number(player->get_point_X()) + "*" + QString::number(player->get_point_Y()) + "*" + "@" + "^"; //строка для обработки удаления отряда
        push_back_res = "true$";
    }

    res = "DAMAGE$";
    res += player->base_res_stroka(player);
    res += image + "$";   //картинка удара
    res += push_back_res;
    res += QString::number(message.uron) + "$";

    if(pop_back != "")
        res = pop_back + res;

    res += "#"; //конец

    return res;
}

/**
 * @brief processing_type_paralish - формирование строки для типа PARALISH
 *
 * @param [in] image - строка с адресом картинки
 *
 * @return сформированную строку с результатами от PARALISH
 */
QString Effect::processing_type_paralish(Base_player * player, QString image)
{
    QString res = "PARALISH$";
    res += player->base_res_stroka(player);
    res += image + "#";
    return res;
}

/**
 * @brief result_damage - формирование последствий от применения эффекта с типом DAMAGE
 *
 * @param [in] player - указатель на отряд с этим эффектом
 * @param [in] damage - какой урон наносит эффект
 *
 * @return результат убит ли отряд и сколько нанесено урона
 */
Result Effect::result_damage(Base_player * player,int damage)
{
    Result res;
    int life = player->get_real_life();
    int def = player->get_bron();

    // для упрощения завел переменные
    res.uron = (((double)(100 - def)/100) * damage);
    life -= res.uron;
    if(life <= 0)
    {
        life = 0;
        player->set_real_life(life);
        res.kill = true;
        return res;
    }

    player->set_real_life(life);
    res.kill = false;
    return res;
}

QString Effect::use_effect(Base_player * player)
{

}

/////////////////////////////////////
/////////////////////////////////////
/////////////////////////////////////

Effect_deferred_damage::Effect_deferred_damage(int number_hod,int damage)
{
    this->set_name("Возмездие");
    this->set_job(job_effect::BEGIN_HOD);
    this->set_type(type_effect::DAMAGE);
    this->schetchik = number_hod;
    this->damage = damage;
    this->set_ready(true);
}

Effect_deferred_damage::~Effect_deferred_damage()
{

}

QString Effect_deferred_damage::use_effect(Base_player * player)
{
    QString res = "";

    if(this->schetchik == 0)
    {
        //сменить картинку TODO
        QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/led.png";
        res = this->processing_type_damage(player,image,this->damage);
        this->set_ready(false);
    }
    else
    {
        this->schetchik--;
    }

    return res;
}

/////////////////////////////////////
/////////////////////////////////////
/////////////////////////////////////

Effect_paralish::Effect_paralish(int dlitelnost)
{
    this->set_name("Паралич");
    this->set_job(job_effect::BEGIN_HOD);
    this->set_type(type_effect::PARALISH);
    this->dlitelnost = dlitelnost;
    this->set_ready(true);
}

Effect_paralish::~Effect_paralish()
{

}

QString Effect_paralish::use_effect(Base_player * player)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/led.png";
    QString res = this->processing_type_paralish(player,image);

    this->dlitelnost--;
    if(this->dlitelnost <= 0)
        this->set_ready(false);

    return res;
}

/////////////////////////////////////
/////////////////////////////////////
/////////////////////////////////////

Effect_oslablenie::Effect_oslablenie(QString name,int dlitelnost,int o_uron,int o_bron,int o_toshnost,int o_inishiativa, \
int pro_uron,int pro_bron,int pro_toshnost,int pro_inishiativa)
{
    this->set_name(name);
    this->dlitelnost = dlitelnost;
    this->oslab_uron = o_uron;
    this->oslab_bron = o_bron;
    this->oslab_toshnost = o_toshnost;
    this->oslab_inishiativa = o_inishiativa;
    this->oslab_in_pro_uron = pro_uron;
    this->oslab_in_pro_bron = pro_bron;
    this->oslab_in_pro_toshnost = pro_toshnost;
    this->oslab_in_pro_inishiativa = pro_inishiativa;
}

Effect_oslablenie::Effect_oslablenie(QString name,int dlitelnost,bool type,int uron,int bron,int toshnost,int inishiativa)
{
    this->set_name(name);
    this->dlitelnost = dlitelnost;

    if(type == true)
    {
        this->oslab_in_pro_uron = uron;
        this->oslab_in_pro_bron = bron;
        this->oslab_in_pro_toshnost = toshnost;
        this->oslab_in_pro_inishiativa = inishiativa;
        this->oslab_uron = 0;
        this->oslab_bron = 0;
        this->oslab_toshnost = 0;
        this->oslab_inishiativa = 0;
    }
    else
    {
        this->oslab_uron = uron;
        this->oslab_bron = bron;
        this->oslab_toshnost = toshnost;
        this->oslab_inishiativa = inishiativa;
        this->oslab_in_pro_uron = 0;
        this->oslab_in_pro_bron = 0;
        this->oslab_in_pro_toshnost = 0;
        this->oslab_in_pro_inishiativa = 0;
    }
}

Effect_oslablenie::~Effect_oslablenie()
{

}

QString Effect_oslablenie::use_effect(Base_player * player)
{
    //TODO
}
