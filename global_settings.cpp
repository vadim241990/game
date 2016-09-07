#include "global_settings.h"

global_settings* global_settings::address = nullptr;
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
global_settings * global_settings::global_settings_public(QApplication * app)
{
    if(address == nullptr)
    {
        address = new global_settings(app);
    }
    return address;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
global_settings * global_settings::get_global_settings()
{
	if(address != nullptr)
		return address;
		
	return nullptr;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
global_settings::global_settings(QApplication * app,QObject *parent) : QObject(parent)
{
    int max_level_geroy = 30;
    this->app = app;
    this->level_game = 0;
    this->number_date = 0;

    for(int i = 0; i < 3;i++)
    {
        for(int z = 0;z < 2; z++)
        {
            this->position_otrad[z][i] = "";
        }
    }

    for(int j = 0; j < 10;j++)
    {
        this->seath_otrad.push_back(false);
    }

    this->point_1 = 0;
    this->point_2 = 0;
    this->point_3 = 0;
    this->point_sila = 0;
    this->point_lovkost = 0;
    this->point_life = 0;
    this->point_energy = 0;

    for(int z = 0; z < max_level_geroy; z++)
    {
        this->books_magic.push_back("");
    }

    this->geroy_skill.insert("damage_1",false); //10% к урону
    this->geroy_skill.insert("damage_poison_1",false); //урон от яда
    this->geroy_skill.insert("damage_vampir_1",false); //реген от урона
    this->geroy_skill.insert("damage_2",false); //30% к урону
    this->geroy_skill.insert("damage_all_team_1",false); //15% к урону команды
    this->geroy_skill.insert("damage_ushas_1",false); //вероятность парализовать
    this->geroy_skill.insert("damage_poison_2",false); // увеличение урона от яда
    this->geroy_skill.insert("damage_vampir_2",false); // увеличение регена от урона
    this->geroy_skill.insert("damage_all_team_2",false); //увеличение урона команды до 25%
    this->geroy_skill.insert("damage_ushas_2",false); // увеличение вероятности парализовать

    this->geroy_skill.insert("bron_1",false); // 10 к броне
    this->geroy_skill.insert("bron_2",false); // 25 к броне
    this->geroy_skill.insert("bron_life_1",false); // 20% к максимуму жизни
    this->geroy_skill.insert("bron_3",false); // 40 к броне
    this->geroy_skill.insert("bron_life_2",false); // 50% к максимуму жизни
    this->geroy_skill.insert("bron_regen_1",false); // реген 5% за ход
    this->geroy_skill.insert("bron_4",false); // 60 к броне
    this->geroy_skill.insert("bron_life_3",false); //75% к максимуму жизни
    this->geroy_skill.insert("bron_regen_2",false); //усиление регенерации
    this->geroy_skill.insert("bron_shit_1",false); //наложение защитного щита

    this->geroy_skill.insert("inishiativa_1",false); // 15% увеличение инициативы
    this->geroy_skill.insert("def_poison_1",false); // защита от яда
    this->geroy_skill.insert("def_electriciti_1",false); // защита от молнии
    this->geroy_skill.insert("inishiativa_2",false); // увеличение инициативы
    this->geroy_skill.insert("def_poison_2",false); // иммунитет от яда
    this->geroy_skill.insert("def_electriciti_2",false); // иммунитет от молнии

    this->geroy_skill.insert("toshnost_1",false); //на 10 повывает точность героя
    this->geroy_skill.insert("def_fier_1",false); //защита от огня
    this->geroy_skill.insert("def_cold_1",false); //защита от холода
    this->geroy_skill.insert("toshnost_2",false); //повышает точность до 20
    this->geroy_skill.insert("def_fier_2",false); //иммунитет к огню
    this->geroy_skill.insert("def_cold_2",false); //иммунитет к холоду

    this->building.insert("gold_1",false);    //building
    this->building.insert("gold_2",false);
    this->building.insert("gold_3",false);
    this->building.insert("gold_4",false);
    this->building.insert("gold_5",false);

    this->building.insert("ruda_1",false);
    this->building.insert("ruda_2",false);
    this->building.insert("ruda_3",false);

    this->building.insert("razvedka",false);

    this->building.insert("skelet_1",false);   //tank
    this->building.insert("skelet_2",false);
    this->building.insert("skelet_3",false);
    this->building.insert("skelet_4",false);
    this->building.insert("skelet_5",false);

    this->building.insert("ogr_1",false);
    this->building.insert("ogr_2",false);
    this->building.insert("ogr_3",false);
    this->building.insert("ogr_4",false);
    this->building.insert("ogr_5",false);

    this->building.insert("boez_cold_1",false);
    this->building.insert("boez_cold_2",false);
    this->building.insert("boez_cold_3",false);
    this->building.insert("boez_cold_4",false);
    this->building.insert("boez_cold_5",false);

    this->building.insert("boez_fier_1",false);
    this->building.insert("boez_fier_2",false);
    this->building.insert("boez_fier_3",false);
    this->building.insert("boez_fier_4",false);
    this->building.insert("boez_fier_5",false);

    this->building.insert("boez_vsadnik_1",false);
    this->building.insert("boez_vsadnik_2",false);
    this->building.insert("boez_vsadnik_3",false);
    this->building.insert("boez_vsadnik_4",false);
    this->building.insert("boez_vsadnik_5",false);

    this->building.insert("arbaletshik_1",false);   //killer
    this->building.insert("arbaletshik_2",false);
    this->building.insert("arbaletshik_3",false);
    this->building.insert("arbaletshik_4",false);
    this->building.insert("arbaletshik_5",false);

    this->building.insert("dark_mag_1",false);
    this->building.insert("dark_mag_2",false);
    this->building.insert("dark_mag_3",false);
    this->building.insert("dark_mag_4",false);
    this->building.insert("dark_mag_5",false);

    this->building.insert("fire_mag_1",false);
    this->building.insert("fire_mag_2",false);
    this->building.insert("fire_mag_3",false);
    this->building.insert("fire_mag_4",false);
    this->building.insert("fire_mag_5",false);

    this->building.insert("luchnik_1",false);
    this->building.insert("luchnik_2",false);
    this->building.insert("luchnik_3",false);
    this->building.insert("luchnik_4",false);
    this->building.insert("luchnik_5",false);

    this->building.insert("molniy_mag_1",false);
    this->building.insert("molniy_mag_2",false);
    this->building.insert("molniy_mag_3",false);
    this->building.insert("molniy_mag_4",false);
    this->building.insert("molniy_mag_5",false);

    this->building.insert("heal_1_1",false);   //heal
    this->building.insert("heal_2_1",false);
    this->building.insert("heal_3_1",false);
    this->building.insert("heal_4_1",false);
    this->building.insert("heal_5_1",false);

    this->building.insert("heal_1_6",false);
    this->building.insert("heal_2_6",false);
    this->building.insert("heal_3_6",false);
    this->building.insert("heal_4_6",false);
    this->building.insert("heal_5_6",false);

    this->building.insert("paralish_1",false);
    this->building.insert("paralish_2",false);
    this->building.insert("paralish_3",false);
    this->building.insert("paralish_4",false);
    this->building.insert("paralish_5",false);

    this->building.insert("proklynaet_1",false);
    this->building.insert("proklynaet_2",false);
    this->building.insert("proklynaet_3",false);
    this->building.insert("proklynaet_4",false);
    this->building.insert("proklynaet_5",false);

    this->building.insert("simbiot_1",false);
    this->building.insert("simbiot_2",false);
    this->building.insert("simbiot_3",false);
    this->building.insert("simbiot_4",false);
    this->building.insert("simbiot_5",false);

    this->building.insert("angel_1",false);    //other_team
    this->building.insert("angel_2",false);
    this->building.insert("angel_3",false);
    this->building.insert("angel_4",false);
    this->building.insert("angel_5",false);

    this->building.insert("elemental_cold_1",false);
    this->building.insert("elemental_cold_2",false);
    this->building.insert("elemental_cold_3",false);
    this->building.insert("elemental_cold_4",false);
    this->building.insert("elemental_cold_5",false);

    this->building.insert("golem_1",false);
    this->building.insert("golem_2",false);
    this->building.insert("golem_3",false);
    this->building.insert("golem_4",false);
    this->building.insert("golem_5",false);

    this->building.insert("vampir_1",false);
    this->building.insert("vampir_2",false);
    this->building.insert("vampir_3",false);
    this->building.insert("vampir_4",false);
    this->building.insert("vampir_5",false);

    this->building.insert("elemental_elektrisiti_1",false);
    this->building.insert("elemental_elektrisiti_2",false);
    this->building.insert("elemental_elektrisiti_3",false);
    this->building.insert("elemental_elektrisiti_4",false);
    this->building.insert("elemental_elektrisiti_5",false);

    this->resurs.insert("gold",0); //ресурсы
    this->resurs.insert("ruda",0);

    this->exp_level.push_back(0);   // необходимый опыт для следующего уровня
    this->exp_level.push_back(100); // 2-уровень
    this->exp_level.push_back(250);
    this->exp_level.push_back(500);
    this->exp_level.push_back(1000); // 5-уровень
    this->exp_level.push_back(1750);
    this->exp_level.push_back(2500);
    this->exp_level.push_back(3500);
    this->exp_level.push_back(5000);
    this->exp_level.push_back(7000); // 10-уровень
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_point_1()
{
    return this->point_1;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_point_1(int number)
{
    if(number < 0)
        return;

    this->point_1 = number;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::add_point_1()
{
    this->point_1 += 5;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_point_2()
{
    return this->point_2;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_point_2(int number)
{
    if(number < 0)
        return;

    this->point_2 = number;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::add_point_2()
{
    this->point_3++;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_point_3()
{
    return this->point_3;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_point_3(int number)
{
    if(number < 0)
        return;

    this->point_3 = number;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::add_point_3()
{
    this->point_3++;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_point_sila()
{
    return this->point_sila;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_point_sila(int number)
{
    this->point_sila = number;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_point_lovkost()
{
    return this->point_lovkost;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_point_lovkost(int number)
{
    this->point_lovkost = number;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_point_life()
{
    return this->point_life;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_point_life(int number)
{
    this->point_life = number;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_point_energy()
{
    return this->point_energy;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_point_energy(int number)
{
    this->point_energy = number;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_books_magic_use()
{
    for(int i = 0; i < this->books_magic.size(); i++)
    {
        if(this->books_magic[i] == "")
            return i + 1; //1 - стартовый 1 уровень
    }
    return -1;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_books_magic(int index, QString value)
{
    if((index <= 30) && (index >= 0))
        this->books_magic[index] = value;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
QString global_settings::get_books_magic(int index)
{
    if((index <= 30) && (index >= 0))
        return this->books_magic[index];

    return "";
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
bool global_settings::get_geroy_skill(QString key)
{
    return this->geroy_skill.value(key);
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_geroy_skill(QString key,bool value)
{
    this->geroy_skill[key] = value;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::quit()
{
    this->app->quit();
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_exp_level(int value)
{
    return this->exp_level.at(value);
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_level_team()
{
    return this->level_team;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_level_team(int value)
{
    this->level_team = value;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_exp()
{
    return this->exp;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_exp(int value)
{
    this->exp = value;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
QString global_settings::get_result_battle()
{
    return this->result_battle;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_result_battle(QString text)
{
    this->result_battle = text;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_exp_level_size()
{
    return this->exp_level.size();
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_level_game()
{
    return this->level_game;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_level_game(int value)
{
    this->level_game = value;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
bool global_settings::get_seath_otrad(int number)
{
    if((number > this->seath_otrad.size()) || (number <= 0))
        return false;

    return this->seath_otrad[number - 1];
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_seath_otrad(int number,bool value)
{
    if((number > this->seath_otrad.size()) || (number <= 0))
        return;

    this->seath_otrad[number - 1] = value;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_number_date()
{
    return this->number_date;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_number_date(int value)
{
    this->number_date = value;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_map_job_size()
{
    return this->map_job.size();
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::add_map_job(QString value)
{
    this->map_job.push_back(value);
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
QString global_settings::get_map_job_at(int number)
{
    return this->map_job.at(number);
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_map_job_at(int number,QString value)
{
    this->map_job[number] = value;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
QString global_settings::get_name_geroy()
{
    return this->name_geroy;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_name_geroy(QString name)
{
    this->name_geroy = name;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
QString global_settings::get_image_geroy() //имя_реального_героя:имя_профиля_героя
{
    int index = this->name_geroy.indexOf(":");
    QString name = this->name_geroy.left(index);

    if(name == "Воин")          {return "/person/image/person/person_geroi_voin.jpg";}
    else if(name == "Маг")      {return "/person/image/person/person_geroi_mag.jpg"; }
    else                        {return "/person/image/person/person_geroi_lush.jpg";}
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////// 
bool global_settings::get_building(QString name)
{
    return this->building.value(name);
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_building(QString name,bool value)
{
    this->building[name] = value;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::add_can_buy_otrad(QString value)
{
    this->can_buy_otrad.push_back(value);
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
QString global_settings::get_can_buy_otrad(int number)
{
    return this->can_buy_otrad[number];
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::remove_can_buy_otrad(int number)
{
    this->can_buy_otrad.remove(number);
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_can_buy_otrad_size()
{
    return this->can_buy_otrad.size();
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::add_otrad(QString value)
{
    this->otrad.push_back(value);
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
QString global_settings::get_otrad(int number)
{
    return this->otrad.at(number);
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_index_otrad(QString name)
{
    for(int i = 0; i < this->otrad.size(); i++)
    {
        if(name == this->otrad.at(i))
            return i;
    }
    return -1;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_otrad_size()
{
    return this->otrad.size();
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_resurs(QString name)
{
    return this->resurs.value(name);
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::set_resurs(QString name,int value)
{
    this->resurs[name] = value;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_first_in_osheredi_x()
{
    return bat.get_first_in_osheredi_x();
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_first_in_osheredi_y()
{
    return bat.get_first_in_osheredi_y();
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
QString global_settings::get_first_in_osheredi_shel_attack()
{
    return this->bat.get_first_in_osheredi_shel_attack();
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
QString global_settings::get_first_in_osheredi_shel()
{
    return this->bat.get_first_in_osheredi_shel();
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
int global_settings::get_many_za_battle()
{
    return this->bat.get_many_za_boy();
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::remove_battle()
{
    this->bat.clear();
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::job_ready()
{
    for(int i = 0; i < this->get_map_job_size(); i++)
    {
        if(this->get_map_job_at(i) == this->bat.get_name_battle())
        {
            this->set_map_job_at(i,"");
            return;
        }
    }
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::add_position_otrad(QString name,int x,int y)
{
    if((x < 0) || (x > 1))
        return;

    if((y < 0) || (y > 2))
        return;

    for(int i = 0; i < 2;i++)  //чистим совпадения имени
    {
        for(int j = 0; j < 3;j++)
        {
            if(this->position_otrad[i][j] == name)
                this->position_otrad[i][j] = "";
        }
    }

    this->position_otrad[x][y] = name;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::rotation_position_otrad(int x,int y,int x1,int y1)
{
    if((x < 0) || (x > 1) || (x1 < 0) || (x1 > 1))
        return;

    if((y < 0) || (y > 2) || (y1 < 0) || (y1 > 2))
        return;

    QString name = this->position_otrad[x][y];
    this->position_otrad[x][y] = this->position_otrad[x1][y1];
    this->position_otrad[x1][y1] = name;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
QString global_settings::get_position_otrad(int x,int y)
{
    if((x < 0) || (x > 1))
        return "";

    if((y < 0) || (y > 2))
        return "";

    return this->position_otrad[x][y];
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
bool global_settings::position_otrad_size_more_zero()
{
    for(int i = 0; i < 3;i++)
    {
        for(int z = 0;z < 2; z++)
        {
            if(this->position_otrad[z][i] != "")
                return true;
        }
    }

    return false;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
QString global_settings::get_sourse_otrad(QString name, int level)
{
	QString path = "file:///" + QApplication::applicationDirPath();
    if(name == "Герой воин")                            return path + "/image/person/person_geroi_voin.jpg";
    else if(name == "Герой маг")                        return path + "/image/person/person_geroi_mag.jpg";
    else if(name == "Герой лучник")                     return path + "/image/person/person_geroi_lush.jpg";
    else if((name == "Скелет") || (name == "Team20 Скелет"))
    {
        if((level >= 25) && (this->building["skelet_5"] == true))			return path + "/image/boez/boez_skelet_5.jpg";
        else if((level >= 17) && (this->building["skelet_4"] == true))		return path + "/image/boez/boez_skelet_4.jpg";
        else if((level >= 10) && (this->building["skelet_3"] == true))		return path + "/image/boez/boez_skelet_3.jpg";
        else if((level >= 5) && (this->building["skelet_2"] == true))		return path + "/image/boez/boez_skelet_2.jpg";
        else if((level >= 1) && (this->building["skelet_1"] == true))		return path + "/image/boez/boez_skelet_1.jpg";
    }
    else if((name == "Огр") || (name == "Team20 Огр"))
    {
        if((level >= 25) && (this->building["ogr_5"] == true))				return path + "/image/boez/boez_ogr_5.jpg";
        else if((level >= 17) && (this->building["ogr_4"] == true))			return path + "/image/boez/boez_ogr_4.jpg";
        else if((level >= 10) && (this->building["ogr_3"] == true))			return path + "/image/boez/boez_ogr_3.jpg";
        else if((level >= 5) && (this->building["ogr_2"] == true))			return path + "/image/boez/boez_ogr_2.jpg";
        else if((level >= 1) && (this->building["ogr_1"] == true))			return path + "/image/boez/boez_ogr_1.jpg";
    }
    else if((name == "Лезвие льда") || (name == "Team20 Лезвие льда"))
    {
        if((level >= 25) && (this->building["boez_cold_5"] == true))		return path + "/image/boez/boez_cold_5.jpg";
        else if((level >= 17) && (this->building["boez_cold_4"] == true))	return path + "/image/boez/boez_cold_4.jpg";
        else if((level >= 10) && (this->building["boez_cold_3"] == true))	return path + "/image/boez/boez_cold_3.jpg";
        else if((level >= 5) && (this->building["boez_cold_2"] == true))	return path + "/image/boez/boez_cold_2.jpg";
        else if((level >= 1) && (this->building["boez_cold_1"] == true))	return path + "/image/boez/boez_cold_1.jpg";
    }
    else if((name == "Владыка") || (name == "Team20 Владыка"))
    {
        if((level >= 25) && (this->building["boez_fier_5"] == true))		return path + "/image/boez/boez_fier_5.jpg";
        else if((level >= 17) && (this->building["boez_fier_4"] == true))	return path + "/image/boez/boez_fier_4.jpg";
        else if((level >= 10) && (this->building["boez_fier_3"] == true))	return path + "/image/boez/boez_fier_3.jpg";
        else if((level >= 5) && (this->building["boez_fier_2"] == true))	return path + "/image/boez/boez_fier_2.jpg";
        else if((level >= 1) && (this->building["boez_fier_1"] == true))	return path + "/image/boez/boez_fier_1.jpg";
    }
    else if((name == "Всадник смерти") || (name == "Team20 Всадник смерти"))
    {
        if((level >= 25) && (this->building["boez_vsadnik_5"] == true))		return path + "/image/boez/boez_vsadnik_5.jpg";
        else if((level >= 17) && (this->building["boez_vsadnik_4"] == true))return path + "/image/boez/boez_vsadnik_4.jpg";
        else if((level >= 10) && (this->building["boez_vsadnik_3"] == true))return path + "/image/boez/boez_vsadnik_3.jpg";
        else if((level >= 5) && (this->building["boez_vsadnik_2"] == true)) return path + "/image/boez/boez_vsadnik_2.jpg";
        else if((level >= 1) && (this->building["boez_vsadnik_1"] == true)) return path + "/image/boez/boez_vsadnik_1.jpg";
    }
    else if((name == "Арбалетчик") || (name == "Team20 Арбалетчик"))
    {
        if((level >= 25) && (this->building["arbaletshik_5"] == true))		return path + "/image/killers/arbaletshik_5.jpg";
        else if((level >= 17) && (this->building["arbaletshik_4"] == true)) return path + "/image/killers/arbaletshik_4.jpg";
        else if((level >= 10) && (this->building["arbaletshik_3"] == true))	return path + "/image/killers/arbaletshik_3.jpg";
        else if((level >= 5) && (this->building["arbaletshik_2"] == true))	return path + "/image/killers/arbaletshik_2.jpg";
        else if((level >= 1) && (this->building["arbaletshik_1"] == true))	return path + "/image/killers/arbaletshik_1.jpg";
    }
    else if((name == "Маг тьмы") || (name == "Team20 Маг тьмы"))
    {
        if((level >= 25) && (this->building["dark_mag_5"] == true))			return path + "/image/killers/dark_mag_5.jpg";
        else if((level >= 17) && (this->building["dark_mag_4"] == true))	return path + "/image/killers/dark_mag_4.jpg";
        else if((level >= 10) && (this->building["dark_mag_3"] == true))	return path + "/image/killers/dark_mag_3.jpg";
        else if((level >= 5) && (this->building["dark_mag_2"] == true))		return path + "/image/killers/dark_mag_2.jpg";
        else if((level >= 1) && (this->building["dark_mag_1"] == true))		return path + "/image/killers/dark_mag_1.jpg";
    }
    else if((name == "Маг огня") || (name == "Team20 Маг огня"))
    {
        if((level >= 25) && (this->building["fire_mag_5"] == true))			return path + "/image/killers/fire_mag_5.jpg";
        else if((level >= 17) && (this->building["fire_mag_4"] == true))	return path + "/image/killers/fire_mag_4.jpg";
        else if((level >= 10) && (this->building["fire_mag_3"] == true))	return path + "/image/killers/fire_mag_3.jpg";
        else if((level >= 5) && (this->building["fire_mag_2"] == true))		return path + "/image/killers/fire_mag_2.jpg";
        else if((level >= 1) && (this->building["fire_mag_1"] == true))		return path + "/image/killers/fire_mag_1.jpg";
    }
    else if((name == "Лучник") || (name == "Team20 Лучник"))
    {
        if((level >= 25) && (this->building["luchnik_5"] == true))			return path + "/image/killers/luchnik_5.jpg";
        else if((level >= 17) && (this->building["luchnik_4"] == true))		return path + "/image/killers/luchnik_4.jpg";
        else if((level >= 10) && (this->building["luchnik_3"] == true))		return path + "/image/killers/luchnik_3.jpg";
        else if((level >= 5) && (this->building["luchnik_2"] == true))		return path + "/image/killers/luchnik_2.jpg";
        else if((level >= 1) && (this->building["luchnik_1"] == true))		return path + "/image/killers/luchnik_1.jpg";
    }
    else if((name == "Маг молний") || (name == "Team20 Маг молний"))
    {
        if((level >= 25) && (this->building["molniy_mag_5"] == true))		return path + "/image/killers/molniy_mag_5.jpg";
        else if((level >= 17) && (this->building["molniy_mag_4"] == true))	return path + "/image/killers/molniy_mag_4.jpg";
        else if((level >= 10) && (this->building["molniy_mag_3"] == true))	return path + "/image/killers/molniy_mag_3.jpg";
        else if((level >= 5) && (this->building["molniy_mag_2"] == true))	return path + "/image/killers/molniy_mag_2.jpg";
        else if((level >= 1) && (this->building["molniy_mag_1"] == true))	return path + "/image/killers/molniy_mag_1.jpg";
    }
    else if((name == "Лекарь") || (name == "Team20 Лекарь"))
    {
        if((level >= 25) && (this->building["heal_5_1"] == true))			return path + "/image/heal/heal_5_1.jpg";
        else if((level >= 17) && (this->building["heal_4_1"] == true))		return path + "/image/heal/heal_4_1.jpg";
        else if((level >= 10) && (this->building["heal_3_1"] == true))		return path + "/image/heal/heal_3_1.jpg";
        else if((level >= 5) && (this->building["heal_2_1"] == true))		return path + "/image/heal/heal_2_1.jpg";
        else if((level >= 1) && (this->building["heal_1_1"] == true))		return path + "/image/heal/heal_1_1.jpg";
    }
    else if((name == "Целитель") || (name == "Team20 Целитель"))
    {
        if((level >= 25) && (this->building["heal_5_6"] == true))			return path + "/image/heal/heal_5_6.jpg";
        else if((level >= 17) && (this->building["heal_4_6"] == true))		return path + "/image/heal/heal_4_6.jpg";
        else if((level >= 10) && (this->building["heal_3_6"] == true))		return path + "/image/heal/heal_3_6.jpg";
        else if((level >= 5) && (this->building["heal_2_6"] == true))		return path + "/image/heal/heal_2_6.jpg";
        else if((level >= 1) && (this->building["heal_1_6"] == true))		return path + "/image/heal/heal_1_6.jpg";
    }
    else if((name == "Призрак") || (name == "Team20 Призрак"))
    {
        if((level >= 25) && (this->building["paralish_5"] == true))			return path + "/image/heal/paralish_5.jpg";
        else if((level >= 17) && (this->building["paralish_4"] == true))	return path + "/image/heal/paralish_4.jpg";
        else if((level >= 10) && (this->building["paralish_3"] == true))	return path + "/image/heal/paralish_3.jpg";
        else if((level >= 5) && (this->building["paralish_2"] == true))		return path + "/image/heal/paralish_2.jpg";
        else if((level >= 1) && (this->building["paralish_1"] == true))		return path + "/image/heal/paralish_1.jpg";
    }
    else if((name == "Шаман") || (name == "Team20 Шаман"))
    {
        if((level >= 25) && (this->building["proklynaet_5"] == true))		return path + "/image/heal/proklynaet_5.jpg";
        else if((level >= 17) && (this->building["proklynaet_4"] == true))	return path + "/image/heal/proklynaet_4.jpg";
        else if((level >= 10) && (this->building["proklynaet_3"] == true))	return path + "/image/heal/proklynaet_3.jpg";
        else if((level >= 5) && (this->building["proklynaet_2"] == true))	return path + "/image/heal/proklynaet_2.jpg";
        else if((level >= 1) && (this->building["proklynaet_1"] == true))	return path + "/image/heal/proklynaet_1.jpg";
    }
    else if((name == "Симбиот") || (name == "Team20 Симбиот"))
    {
        if((level >= 25) && (this->building["simbiot_5"] == true))			return path + "/image/heal/simbiot_5.jpg";
        else if((level >= 17) && (this->building["simbiot_4"] == true))		return path + "/image/heal/simbiot_4.jpg";
        else if((level >= 10) && (this->building["simbiot_3"] == true))		return path + "/image/heal/simbiot_3.jpg";
        else if((level >= 5) && (this->building["simbiot_2"] == true))		return path + "/image/heal/simbiot_2.jpg";
        else if((level >= 1) && (this->building["simbiot_1"] == true))		return path + "/image/heal/simbiot_1.jpg";
    }
    else if((name == "Темный ангел") || (name == "Team20 Ангел"))
    {
        if((level >= 25) && (this->building["angel_5"] == true))			return path + "/image/other_team/angel_5.jpg";
        else if((level >= 17) && (this->building["angel_4"] == true))		return path + "/image/other_team/angel_4.jpg";
        else if((level >= 10) && (this->building["angel_3"] == true))		return path + "/image/other_team/angel_3.jpg";
        else if((level >= 5) && (this->building["angel_2"] == true))		return path + "/image/other_team/angel_2.jpg";
        else if((level >= 1) && (this->building["angel_1"] == true))		return path + "/image/other_team/angel_1.jpg";
    }
    else if((name == "Элементаль холода") || (name == "Team20 Элементаль холода"))
    {
        if((level >= 25) && (this->building["elemental_cold_5"] == true))		return path + "/image/other_team/elemental_cold_5.jpg";
        else if((level >= 17) && (this->building["elemental_cold_4"] == true))	return path + "/image/other_team/elemental_cold_4.jpg";
        else if((level >= 10) && (this->building["elemental_cold_3"] == true))	return path + "/image/other_team/elemental_cold_3.jpg";
        else if((level >= 5) && (this->building["elemental_cold_2"] == true))	return path + "/image/other_team/elemental_cold_2.jpg";
        else if((level >= 1) && (this->building["elemental_cold_1"] == true))	return path + "/image/other_team/elemental_cold_1.jpg";
    }
    else if((name == "Голем") || (name == "Team20 Голем"))
    {
        if((level >= 25) && (this->building["golem_5"] == true))			return path + "/image/other_team/golem_5.jpg";
        else if((level >= 17) && (this->building["golem_4"] == true))		return path + "/image/other_team/golem_4.jpg";
        else if((level >= 10) && (this->building["golem_3"] == true))		return path + "/image/other_team/golem_3.jpg";
        else if((level >= 5) && (this->building["golem_2"] == true))		return path + "/image/other_team/golem_2.jpg";
        else if((level >= 1) && (this->building["golem_1"] == true))		return path + "/image/other_team/golem_1.jpg";
    }
    else if((name == "Вампир") || (name == "Team20 Вампир"))
    {
        if((level >= 25) && (this->building["vampir_5"] == true))			return path + "/image/other_team/vampir_5.jpg";
        else if((level >= 17) && (this->building["vampir_4"] == true))		return path + "/image/other_team/vampir_4.jpg";
        else if((level >= 10) && (this->building["vampir_3"] == true))		return path + "/image/other_team/vampir_3.jpg";
        else if((level >= 5) && (this->building["vampir_2"] == true))		return path + "/image/other_team/vampir_2.jpg";
        else if((level >= 1) && (this->building["vampir_1"] == true))		return path + "/image/other_team/vampir_1.jpg";
    }
    else if((name == "Элементаль молний") || (name == "Team20 Элементаль молний"))
    {
        if((level >= 25) && (this->building["elemental_elektrisiti_5"] == true))		return path + "/image/other_team/elemental_elektrisiti_5.jpg";
        else if((level >= 17) && (this->building["elemental_elektrisiti_4"] == true))	return path + "/image/other_team/elemental_elektrisiti_4.jpg";
        else if((level >= 10) && (this->building["elemental_elektrisiti_3"] == true))	return path + "/image/other_team/elemental_elektrisiti_3.jpg";
        else if((level >= 5) && (this->building["elemental_elektrisiti_2"] == true))	return path + "/image/other_team/elemental_elektrisiti_2.jpg";
        else if((level >= 1) && (this->building["elemental_elektrisiti_1"] == true))	return path + "/image/other_team/elemental_elektrisiti_1.jpg";
    }
    else if(name == "Other Гоблин лучник")   return path + "/image/taktic_game/level_1/goblin_lushnik.jpg";
    else if(name == "Other Гоблин")          return path + "/image/taktic_game/level_1/goblin_voin.jpg";
    else if(name == "Other Крестьянин")      return path + "/image/taktic_game/level_1/krestyanin.jpg";
    else if(name == "Other Лучник")          return path + "/image/taktic_game/level_1/lushnik.jpg";
    else if(name == "Other Тал")             return path + "/image/taktic_game/level_1/main.jpg";
    else if(name == "Other Страж")           return path + "/image/taktic_game/level_1/main_strash.jpg";
    else if(name == "Other Мечник")          return path + "/image/taktic_game/level_1/meshnik.jpg";
    else if(name == "Other Прислужник")      return path + "/image/taktic_game/level_1/zashitnik.jpg";

    return "";
}
/**
 * @brief get_address_xml - возврат адреса по имени юнита
 *
 * @param [in] name_unit имя юнита
 *
 * @return \c "***" - строку с адресом xml файла если успех
 * @return \c "" - провал
 */
QString global_settings::get_address_xml(QString name_unit)
{
  if(name_unit == "Герой воин")              		return QApplication::applicationDirPath() + "/XML/heroes/xml_heroes_voin.xml";
  else if(name_unit == "Герой маг")          		return QApplication::applicationDirPath() + "/XML/heroes/xml_heroes_mag.xml";
  else if(name_unit == "Герой лучник")       		return QApplication::applicationDirPath() + "/XML/heroes/xml_heroes_luchnik.xml";
  else if(name_unit == "Team20 Ангел")       		return QApplication::applicationDirPath() + "/XML/xml_angel.xml";
  else if(name_unit == "Team20 Арбалетчик")  		return QApplication::applicationDirPath() + "/XML/xml_arbaletshik.xml";
  else if(name_unit == "Team20 Лезвие льда")   		return QApplication::applicationDirPath() + "/XML/xml_cold.xml";
  else if(name_unit == "Team20 Маг тьмы")           return QApplication::applicationDirPath() + "/XML/xml_dark_mag.xml";
  else if(name_unit == "Team20 Элементаль холода")  return QApplication::applicationDirPath() + "/XML/xml_elemental_cold.xml";
  else if(name_unit == "Team20 Элементаль молний")	return QApplication::applicationDirPath() + "/XML/xml_elemental_elektrisiti.xml";
  else if(name_unit == "Team20 Владыка")			return QApplication::applicationDirPath() + "/XML/xml_fier.xml";
  else if(name_unit == "Team20 Маг огня")			return QApplication::applicationDirPath() + "/XML/xml_fire_mag.xml";
  else if(name_unit == "Team20 Голем")				return QApplication::applicationDirPath() + "/XML/xml_golem.xml";
  else if(name_unit == "Team20 Лекарь")				return QApplication::applicationDirPath() + "/XML/xml_lekar.xml";
  else if(name_unit == "Team20 Лучник")				return QApplication::applicationDirPath() + "/XML/xml_luchnik.xml";
  else if(name_unit == "Team20 Маг молний")			return QApplication::applicationDirPath() + "/XML/xml_molniy_mag.xml";
  else if(name_unit == "Team20 Огр")				return QApplication::applicationDirPath() + "/XML/xml_ogr.xml";
  else if(name_unit == "Team20 Призрак")			return QApplication::applicationDirPath() + "/XML/xml_paralish.xml";
  else if(name_unit == "Team20 Шаман")              return QApplication::applicationDirPath() + "/XML/xml_proklynaet.xml";
  else if(name_unit == "Team20 Целитель") 			return QApplication::applicationDirPath() + "/XML/xml_shelitel.xml";
  else if(name_unit == "Team20 Симбиот")			return QApplication::applicationDirPath() + "/XML/xml_simbiot.xml";
  else if(name_unit == "Team20 Скелет")             return QApplication::applicationDirPath() + "/XML/xml_skelet.xml";
  else if(name_unit == "Team20 Вампир")				return QApplication::applicationDirPath() + "/XML/xml_vampir.xml";
  else if(name_unit == "Team20 Всадник смерти")		return QApplication::applicationDirPath() + "/XML/xml_vsadnik.xml";
  else if(name_unit == "Other Гоблин лучник")		return QApplication::applicationDirPath() + "/XML/other/xml_goblin_lushnik.xml";
  else if(name_unit == "Other Гоблин")				return QApplication::applicationDirPath() + "/XML/other/xml_goblin_voin.xml";
  else if(name_unit == "Other Крестьянин")			return QApplication::applicationDirPath() + "/XML/other/xml_krestyanin.xml";
  else if(name_unit == "Other Лучник")				return QApplication::applicationDirPath() + "/XML/other/xml_lushnik.xml";
  else if(name_unit == "Other Тал")					return QApplication::applicationDirPath() + "/XML/other/xml_main.xml";
  else if(name_unit == "Other Страж")				return QApplication::applicationDirPath() + "/XML/other/xml_main_strash.xml";
  else if(name_unit == "Other Мечник")				return QApplication::applicationDirPath() + "/XML/other/xml_meshnik.xml";
  else if(name_unit == "Other Прислужник")			return QApplication::applicationDirPath() + "/XML/other/xml_zashitnik.xml";
  
  return "";
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
QString global_settings::read_XML(QString name_file,QString name_unit,int number_level)
{
    QDomDocument dom;
    QDomElement domElement;
    QDomNodeList element;
    QDomNodeList list;
    QString string_all = "";

    QFile file(name_file);
    if(file.open(QIODevice::ReadWrite))
    {
        if(dom.setContent(&file))
        {
            domElement = dom.documentElement();
            list = domElement.elementsByTagName(name_unit);
            element = list.at(number_level).childNodes();

            for(int i = 0; i < element.count(); i++)
            {
                string_all += element.at(i).firstChild().toText().data();
                string_all += "#";
            }
        }
        file.close();
    }
    return string_all;
}
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
void global_settings::random_map_job()
{
    QVector<QString> name_job;
    int res = 0;

    qsrand(QTime(0,0,0).msecsTo(QTime::currentTime()));

    if(this->level_game == 1)
    {
        name_job.push_back("крестьяне");
        name_job.push_back("гоблины");
        name_job.push_back("стража");
        name_job.push_back("main");
    }

    int j = name_job.size();
    for(int i = 0; i < name_job.size();i++)
    {
        res = qrand() % j;
        this->add_map_job(name_job.at(res));
        name_job[res] = name_job[j-1];
        j--;
    }
}

/**
 * @brief new_battle - создание поля боя
 *
 * @param [in] select_job название миссии
 *
 * @return нет возврата
 */
void global_settings::new_battle(QString select_job)
{
	QString all_stroka = "";
	for(int i = 0; i < 3;i++)
	{
		for(int j = 0; j < 2; j++)
		{
			if(this->position_otrad[j][i] == "")
				all_stroka += "void";
			else
				all_stroka += this->position_otrad[j][i];
				
			all_stroka += "#";
		}
	}
	all_stroka += "@"; //разделительный символ между командами
	
	all_stroka += this->get_string_to_parsing(select_job);
	
    this->bat.new_battle(all_stroka);
    this->bat.set_name_battle(select_job);
}
/**
 * @brief get_string_to_parsing - создание строки для парсинга другой каманды
 *
 * @param [in] name название миссии
 *
 * @return собранную строку из расположений отрядов
 */
QString global_settings::get_string_to_parsing(QString name)
{
	QString res = "";
	if(this->level_game == 1)
	{
		if(name == "крестьяне")
            res = "Other Крестьянин#void#void#void#Other Крестьянин#void#$70";
		else if(name == "гоблины")
            res = "Other Гоблин#void#Other Гоблин#Other Гоблин лучник#void#void#$90";
		else if(name == "стража")
            res = "Other Мечник#void#void#Other Лучник#Other Страж#void#$150";
		else if(name == "main")
            res = "Other Прислужник#void#Other Прислужник#Other Тал#Other Прислужник#void#$210";
	}
	return res;
}
/**
 * @brief get_oshered_hodov - возрат строки с именами всех в очереди
 *
 * @return строку с именами всех отрядов в очереди
 */
QString global_settings::get_oshered_hodov()
{
    return this->bat.get_stroka_all_team();
}

/**
 * @brief get_oshered_hodov - возрат строку с именами, коорд и жизнями отрядов для инициализации боя
 *
 * @return строку
 */
QString global_settings::get_stroka_start_game()
{
    return this->bat.get_stroka_all_team_start();
}

/**
 * @brief damage - возрат строку c необходимыми данными для отрисовки
 *
 * @return строку
 */
QString global_settings::damage(int x,int y)
{
    return this->bat.damage(x,y);
}
/**
 * @brief select_oshered - ищет отряд по координатам в очереди ходов
 *
 * @return номер в очереди
 */
int global_settings::select_oshered(int x,int y)
{
    return this->bat.select_oshered(x,y);
}

/**
 * @brief perehod_hoda - переход хода другому юниту
 *
 * @return ничего
 */
void global_settings::perehod_hoda()
{
    this->bat.perehod_hoda();
}

/**
 * @brief hod_pc - делает ход пк
 *
 * @return строку с результатами удара
 */
QString global_settings::hod_pc()
{
    return this->bat.hod_pc();
}

/**
 * @brief get_full_info_otrad - возврат полной информации о характеристиках отряда на текущий момент
 *
 * @return строку с характеристиками
 */
QString global_settings::get_full_info_otrad(int x,int y)
{
    return this->bat.get_full_info_otrad(x,y);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
