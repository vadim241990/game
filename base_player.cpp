#include "base_player.h"
#include "global_settings.h"

Base_player::Base_player(QObject *parent) : QObject(parent)
{
    this->bonus_bron = 0;
    this->bonus_damage = 0;
    this->bonus_inichiativa = 0;
    this->bonus_life = 0;
}

Base_player::~Base_player()
{

}

QString Base_player::attack(int x, int y,QList<Base_player *> list)
{
    return "";                //заглушка
}

int Base_player::set_point_X(int number) // от 0 до 3
{
	if((number < 0) || (number > 3))
		return -1;
		
	this->point_X = number;
	return 0;
}

int Base_player::get_point_X()
{
	return this->point_X;
}

int Base_player::set_point_Y(int number) //от 0 до 2
{
	if((number < 0) || (number > 2))
		return -1;
	
	this->point_Y = number;
	return 0;
}

int Base_player::get_point_Y()
{
	return this->point_Y;
}

int Base_player::get_inichiativa()
{
    return this->inichiativa;
}

QString Base_player::get_name()
{
    return this->name;
}

QString Base_player::get_name_id()
{
    return this->name_id;
}

int Base_player::get_life()
{
    return this->life;
}

int Base_player::get_real_life()
{
    return this->real_life;
}

void Base_player::set_real_life(int number)
{
    this->real_life = number;
}

QString Base_player::get_shel()
{
    return this->shel;
}

QString Base_player::get_shel_attack()
{
    return this->shel_attack;
}

QString Base_player::get_zashita()
{
    return this->zashita;
}

QString Base_player::get_immunitet()
{
    return this->immunitet;
}

int Base_player::get_damage()
{
    return this->damage;
}

int Base_player::get_bron()
{
    return this->bron;
}

QString Base_player::get_type_damage()
{
    return this->type_damage;
}

int Base_player::get_ver_damage()
{
    return this->ver_damage;
}

QString Base_player::get_description()
{
    return this->description;
}

void Base_player::set_bonus_damage(int value)
{
    this->bonus_damage = value;
}

int Base_player::get_bonus_damage()
{
    return this->bonus_damage;
}

void Base_player::set_bonus_life(int value)
{
    this->bonus_life = value;
}

int Base_player::get_bonus_life()
{
    return this->bonus_life;
}

void Base_player::set_bonus_bron(int value)
{
    this->bonus_bron = value;
}

int Base_player::get_bonus_bron()
{
    return this->bonus_bron;
}

void Base_player::set_bonus_inichiativa(int value)
{
    this->bonus_inichiativa = value;
}

int Base_player::get_bonus_inichiativa()
{
    return this->bonus_inichiativa;
}

Base_player * Base_player::seatsh_player(QList<Base_player *> list,int x,int y)
{
    for(int i = 0; i < list.size(); i++) //поиск нужного игрока
    {
        if((list[i]->get_point_X() == x) && (list[i]->get_point_Y() == y))
        {
            return list[i];
        }
    }
    return nullptr;
}

/**
 * @brief help_attack_in_one - шаблон для удара в одну цель
 *
 * @param [in] image - картинка удара
 *
 * @return строку для отображения в интерфейсе
 */
QString Base_player::help_attack_in_one(QList<Base_player *> list,int x,int y,QString image)
{
    Result result;
    QString res = "";
    QString push_back_res = "false$";
    QString pop_back = "";
    QString def = "";

    Base_player * player = this->seatsh_player(list,x,y);

    if(this->immunitet_def(player) == true)
        def = "Иммунитет$";
    if(this->zashita_def(player) == true)
        def = "Защита$";
    if(this->damage_popal() == false)
        def = "Промах$";

    if(def == "")
    {
        result = this->result_damage(player);
        if(result.kill == true)  //нанесен ли смертельный урон(смерть - true)
        {
            //"*" -разделитель координат //"@" - разделитель отрядов //"^" - разделитель на направление интерфейс и реализация
            pop_back = QString::number(x) + "*" + QString::number(y) + "*" + "@" + "^"; //строка для обработки удаления отряда
            push_back_res = "true";
            push_back_res += "$";
        }
    }

    res += base_res_stroka(player);
    res += image + "$";   //картинка удара
    res += push_back_res;
    if(def == "")
        res += QString::number(result.uron) + "$";
    else
        res += def;

    if(pop_back != "")
        res = pop_back + res;

    res += "#"; //конец
    return res;
}

/**
 * @brief help_attack_in_all - шаблон для удара по всей команде
 *
 * @param [in] image - картинка удара
 *
 * @return строку для отображения в интерфейсе
 */
QString Base_player::help_attack_in_all(QList<Base_player *> list,int x,int y,QString image)
{
    Result result;
    QString res = "";
    QString push_back_res;
    QString pop_back = "";
    QString def;
    Base_player * player;
    int min_x, max_x;
    int min_y, max_y;

    if((x >= 2) && (y >= 0)) //удар по красной каманде
    {
        min_x = 2;
        max_x = 4;
        min_y = 0;
        max_y = 3;
    }
    else    //удар по синей каманде
    {
        min_x = 0;
        max_x = 2;
        min_y = 0;
        max_y = 3;
    }

    for(int koord_x = min_x; koord_x < max_x; koord_x++)
    {
        for(int koord_y = min_y; koord_y < max_y; koord_y++)
        {
            def = "";
            push_back_res = "false$";
            player = this->seatsh_player(list,koord_x,koord_y);
            if(player == nullptr)
                continue;

            if(this->immunitet_def(player) == true)
                def = "Иммунитет$";
            if(this->zashita_def(player) == true)
                def = "Защита$";
            if(this->damage_popal() == false)
                def = "Промах$";

            if(def == "")
            {
                result = this->result_damage(player);
                if(result.kill == true)  //нанесен ли смертельный урон(смерть - true)
                {
                    //"*" -разделитель координат //"@" - разделитель отрядов //"^" - разделитель на направление интерфейс и реализация
                    pop_back += QString::number(koord_x) + "*" + QString::number(koord_y) + "*" + "@"; //строка для обработки удаления отряда
                    push_back_res = "true";
                    push_back_res += "$";
                }
            }

            res += base_res_stroka(player);
            res += image + "$";   //картинка удара
            res += push_back_res;
            if(def == "")
                res += QString::number(result.uron) + "$";
            else
                res += def;

            res += "#"; //конец
        }
    }

    if(pop_back != "")
    {
        pop_back += "^";
        res = pop_back + res;
    }

    return res;
}

/**
 * @brief veroatnost - вспомогательная функция вероятности попадения
 *
 * @param [in] procent_good_result - процент для положительного исхода
 *
 * @return false - если не попал иначе true
 */
bool Base_player::veroatnost(int procent_good_result)
{
    int static number = 0;
    qsrand(static_cast<quint64>(QTime::currentTime().msecsSinceStartOfDay()));
    QVector<int> arr;
    for(int i = 0; i < 6; i++)
        arr.push_back(qrand());

    int res = arr.at(number) % 100;
    number++;
    if(number == 6)
        number = 0;

    if(res <= procent_good_result)
        return true;
    else
        return false;
}

/**
 * @brief damage_popal - попал ли в цель рандом
 *
 * @return false - если не попал иначе true
 */
bool Base_player::damage_popal()
{
    int static number = 0;
    qsrand(static_cast<quint64>(QTime::currentTime().msecsSinceStartOfDay()));
    QVector<int> arr;
    for(int i = 0; i < 6; i++)
        arr.push_back(qrand());

    int res = arr.at(number) % 100;
    number++;
    if(number == 6)
        number = 0;

    if(res <= this->ver_damage)
        return true;
    else
        return false;
}

/**
 * @brief immunitet_def - проверка наличия иммунитета
 *
 * @param [in] player отряд кого бьют
 *
 * @return false - если нет иммунитета иначе true
 */
bool Base_player::immunitet_def(Base_player * player)
{
    int len = 0;
    int start_index;
    int end_index = 0;
    QVector<QString> immunitet;

    QString stroka = player->get_immunitet();
    if(stroka == "Нет")
        return false;

    while(1) //перезапись в отдельные строки
    {
      start_index = 0;
      end_index = stroka.indexOf(";",start_index);
      if(end_index == -1)
      {
          immunitet.push_back(stroka);
          break;
      }

      len = end_index - start_index;
      immunitet.push_back(stroka.mid(start_index,len));
      start_index = end_index + 1;
      stroka = stroka.mid(start_index,stroka.length() - start_index);
    }

    for(int i = 0; i < immunitet.size();i++)
    {
        if(immunitet[i] == this->type_damage)
            return true;
    }
    return false;
}

/**
 * @brief zashita_def - проверка защиты
 *
 * @param [in] player отряд кого бьют
 *
 * @return false - если нет защиты или она не сработала иначе true
 */
bool Base_player::zashita_def(Base_player * player)
{
    int static number_zashita = 0;
    int len = 0;
    int start_index;
    int end_index = 0;
    int res;
    QVector<QString> zashita;
    QVector<int> arr;
    qsrand(static_cast<quint64>(QTime::currentTime().msecsSinceStartOfDay()));
    for(int i = 0; i < 6; i++)
        arr.push_back(qrand());

    QString stroka = player->get_zashita();
    if(stroka == "Нет")
        return false;

    while(1) //перезапись в отдельные строки
    {
      start_index = 0;
      end_index = stroka.indexOf(";",start_index);
      if(end_index == -1)
      {
          zashita.push_back(stroka);
          break;
      }

      len = end_index - start_index;
      zashita.push_back(stroka.mid(start_index,len));
      start_index = end_index + 1;
      stroka = stroka.mid(start_index,stroka.length() - start_index);
    }

    for(int i = 0; i < zashita.size();i++)
    {
        if(zashita[i] == this->type_damage) //если есть защита 50% вероятность блокировать весь урон
        {
            res = arr.at(number_zashita) % 2;
            number_zashita++;
            if(number_zashita == 6)
                number_zashita = 0;

            if(res == 0)
                return true;
            else
                return false;
        }
    }
    return false;
}

/**
 * @brief base_res_stroka - формирование базовой строки для парсинга в GUI
 *
 * @param [in] player отряд кого бьют
 *
 * @return
 */
QString Base_player::base_res_stroka(Base_player * player)
{
    QString res = "";
    res += QString::number(player->get_point_X())   + "$";
    res += QString::number(player->get_point_Y())   + "$";
    res += QString::number(player->get_life())      + "$";
    res += QString::number(player->get_real_life()) + "$";
    return res;
}

/**
 * @brief result_damage - расчет урона
 *
 * @param [in] player отряд кого бьют
 *
 * @return true - если труп иначе false
 */
Result Base_player::result_damage(Base_player * player)
{
    Result res;
    int life = player->get_real_life();
    int def = player->get_bron();
    int uron = this->get_damage();
    uron = uron * ((double)(100 + this->get_bonus_damage())/100); //коректировка с учотом бонусов

    // для упрощения завел переменные
    res.uron = (((double)(100 - def)/100) * uron); //TODO добавить просмотр эффектов
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

/**
 * @brief create_unit - чтение нужного xml по имени(заполняем базовые данные юнита)
 *
 * @param [in] name имя юнита
 * @param [in] header название искомого тега в файле xml
 * @param [in] need_level (true) если у юнита есть градация по уровням
 *
 * @return нет возврата
 */
void Base_player::create_unit(QString name,QString header,bool need_level)
{
  global_settings * global = global_settings::get_global_settings();
  if(global == nullptr)
    return;
  
  QString address = global->get_address_xml(name);
  if(address == "")
    return;

  int res;
  QString stroka;
  if(need_level == false)
    stroka = global->read_XML(address,header,0);
  else
  {
      int number = global->get_level_team();
      if(number < 5)
        res = 0;
      else if(number < 10)
        res = 1;
      else if(number < 15)
        res = 2;
      else if(number < 20)
        res = 3;
      else
        res = 4;
		
      stroka = global->read_XML(address,header,res);
  }
	
  
  QVector<QString> massiv;
  int len = 0;
  int start_index = 0;
  int end_index = 0;
  
  while(1) //перезапись в отдельные строки
  {
    end_index = stroka.indexOf("#",start_index);
    if(end_index == -1)
      break;
    
    len = end_index - start_index;
    massiv.push_back(stroka.mid(start_index,len));
    start_index = end_index + 1;
  }
  
  this->name_id = name;
  this->name = massiv.at(0);
  this->type_damage = massiv.at(1);

  //обработка урона(герои и все остальные)
  if(name == "Герой маг")
  {
      this->damage = massiv.at(3).toInt() + global->get_add_damage_for_geroy("Маг");
      this->life = massiv.at(4).toInt() + global->get_add_life_for_geroy("Маг");
      create_geroy_skill(massiv);
  }
  else if(name == "Герой воин")
  {
      this->damage = massiv.at(3).toInt() + global->get_add_damage_for_geroy("Воин");
      this->life = massiv.at(4).toInt() + global->get_add_life_for_geroy("Воин");
      create_geroy_skill(massiv);
  }
  else if(name == "Герой лучник")
  {
      this->damage = massiv.at(3).toInt() + global->get_add_damage_for_geroy("Лучник");
      this->life = massiv.at(4).toInt() + global->get_add_life_for_geroy("Лучник");
      create_geroy_skill(massiv);
  }
  else
  {
      this->damage = massiv.at(3).toInt();
      this->life = massiv.at(4).toInt();
  }

  if(need_level == true) //true - создается дружественный отряд для героя
  {
      if(global->get_geroy_skill("inishiativa_2") == true)
          this->set_bonus_inichiativa(40);
      else if(global->get_geroy_skill("inishiativa_1") == true)
          this->set_bonus_inichiativa(15);
  }

  this->ver_damage = massiv.at(2).toInt();

  this->real_life = this->life;
  this->bron = massiv.at(5).toInt();
  this->inichiativa = massiv.at(6).toInt() * (double)(100 + this->get_bonus_inichiativa())/100;
  this->shel = massiv.at(7);
  
  if(massiv.at(8) == "")
    this->zashita = "Нет";
  else
    this->zashita = massiv.at(8);
  
  if(massiv.at(9) == "")
    this->immunitet = "Нет";
  else
    this->immunitet = massiv.at(9);
  
  this->shel_attack = massiv.at(10);
  this->description = massiv.at(11);
}

void Base_player::create_geroy_skill(QVector<QString>& massiv)
{
    global_settings * global = global_settings::get_global_settings();
    if(global == nullptr)
      return;

    QString immunitet_stroka = "";
    QString zashita_stroka   = "";

    if(global->get_geroy_skill("toshnost_2") == true)
        massiv[2] = QString::number(massiv[2].toInt() + 20);
    else if(global->get_geroy_skill("toshnost_1") == true)
        massiv[2] = QString::number(massiv[2].toInt() + 10);

    if(global->get_geroy_skill("bron_2") == true)
        massiv[5] = QString::number(massiv[5].toInt() + 25);
    else if(global->get_geroy_skill("bron_1") == true)
        massiv[5] = QString::number(massiv[5].toInt() + 10);

    if(global->get_geroy_skill("bron_life_1") == true)
        this->life = (static_cast<float>(this->life) * static_cast<float>(1.2));

    if(global->get_geroy_skill("damage_1") == true)
        this->set_bonus_damage(10);

    if(global->get_geroy_skill("inishiativa_2") == true)
        this->set_bonus_inichiativa(40);
    else if(global->get_geroy_skill("inishiativa_1") == true)
        this->set_bonus_inichiativa(15);

    if(global->get_geroy_skill("def_fier_2") == true)
    {
        if(immunitet_stroka == "")     immunitet_stroka = "Огонь";
        else                            immunitet_stroka += ";Огонь";
    }
    else if(global->get_geroy_skill("def_fier_1") == true)
    {
        if(zashita_stroka == "")   zashita_stroka = "Огонь";
        else                        zashita_stroka += ";Огонь";
    }

    if(global->get_geroy_skill("def_cold_2") == true)
    {
        if(immunitet_stroka == "")     immunitet_stroka = "Холод";
        else                            immunitet_stroka += ";Холод";
    }
    else if(global->get_geroy_skill("def_cold_1") == true)
    {
        if(zashita_stroka == "")   zashita_stroka = "Холод";
        else                        zashita_stroka += ";Холод";
    }

    if(global->get_geroy_skill("def_electriciti_2") == true)
    {
        if(immunitet_stroka == "")     immunitet_stroka = "Молния";
        else                            immunitet_stroka += ";Молния";
    }
    else if(global->get_geroy_skill("def_electriciti_1") == true)
    {
        if(zashita_stroka == "")   zashita_stroka = "Молния";
        else                        zashita_stroka += ";Молния";
    }

    if(global->get_geroy_skill("def_poison_2") == true)
    {
        if(immunitet_stroka == "")     immunitet_stroka = "Яд";
        else                            immunitet_stroka += ";Яд";
    }
    else if(global->get_geroy_skill("def_poison_1") == true)
    {
        if(zashita_stroka == "")   zashita_stroka = "Яд";
        else                        zashita_stroka += ";Яд";
    }

    massiv[8] = zashita_stroka;
    massiv[9] = immunitet_stroka;
}

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Heroes_voin::Heroes_voin()
{
  QString name = "Герой воин";
  this->create_unit(name,"voin",false);
}

Heroes_voin::~Heroes_voin()
{
	
}

QString Heroes_voin::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/blood.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Heroes_mag::Heroes_mag()
{
  QString name = "Герой маг";
  this->create_unit(name,"mag",false);
}

QString Heroes_mag::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/fier.png";
    QString res = this->help_attack_in_all(list,x,y,image);
    return res;
}

Heroes_mag::~Heroes_mag()
{
  
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Heroes_luchnik::Heroes_luchnik()
{
  QString name = "Герой лучник";
  this->create_unit(name,"luchnik",false);
}

QString Heroes_luchnik::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/strela.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}

Heroes_luchnik::~Heroes_luchnik()
{
  
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_angel::Team20_angel()
{
	QString name = "Team20 Ангел";
	this->create_unit(name,"angel",true);
}

QString Team20_angel::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/krulo.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}

Team20_angel::~Team20_angel()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_arbaletshik::Team20_arbaletshik()
{
	QString name = "Team20 Арбалетчик";
	this->create_unit(name,"arbaletshik",true);
}

Team20_arbaletshik::~Team20_arbaletshik()
{

}

Result Team20_arbaletshik::result_damage(Base_player * player)
{
    Result res;
    int life = player->get_real_life();
    int def = player->get_bron();
    int uron = this->get_damage();
    int uron_add = (player->get_life()/100) * 1; //1 на первом уровне потом TODO

    res.uron = (((double)(100 - def)/100) * (uron + uron_add));

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

QString Team20_arbaletshik::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/bolt.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_cold::Team20_cold()
{
	QString name = "Team20 Лезвие льда";
	this->create_unit(name,"cold",true);
}

QString Team20_cold::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/led.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}

Team20_cold::~Team20_cold()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_dark_mag::Team20_dark_mag()
{
	QString name = "Team20 Маг тьмы";
	this->create_unit(name,"dark_mag",true);
}

Team20_dark_mag::~Team20_dark_mag()
{
	
}

QString Team20_dark_mag::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/dark_mag.png";
    QString res = this->help_attack_in_all(list,x,y,image);
    return res;
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_elemental_cold::Team20_elemental_cold()
{
	QString name = "Team20 Элементаль холода";
	this->create_unit(name,"elemental_cold",true);
}

Team20_elemental_cold::~Team20_elemental_cold()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_elemental_elektrisiti::Team20_elemental_elektrisiti()
{
	QString name = "Team20 Элементаль молний";
	this->create_unit(name,"elemental_elektrisiti",true);
}

Team20_elemental_elektrisiti::~Team20_elemental_elektrisiti()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_fier::Team20_fier()
{
	QString name = "Team20 Владыка";
	this->create_unit(name,"fier",true);
}

QString Team20_fier::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/fier_mesh.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}

Result Team20_fier::result_damage(Base_player * player)
{
    Result res;
    int life = player->get_real_life();
    int def = player->get_bron();
    int uron = this->get_damage();

    if(player->get_type_damage() == "Холод")
        res.uron = (((double)(100 - def)/100) * (uron * 1.5));
    else
        res.uron = (((double)(100 - def)/100) * uron);

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

Team20_fier::~Team20_fier()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_fire_mag::Team20_fire_mag()
{
	QString name = "Team20 Маг огня";
	this->create_unit(name,"fier_mag",true);
}

Team20_fire_mag::~Team20_fire_mag()
{
	
}

QString Team20_fire_mag::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/fier_mag.png";
    QString res = this->help_attack_in_all(list,x,y,image);
    return res;
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_golem::Team20_golem()
{
	QString name = "Team20 Голем";
	this->create_unit(name,"golem",true);
}

Team20_golem::~Team20_golem()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_lekar::Team20_lekar()
{
	QString name = "Team20 Лекарь";
	this->create_unit(name,"lekar",true);
}

Team20_lekar::~Team20_lekar()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_luchnik::Team20_luchnik()
{
	QString name = "Team20 Лучник";
	this->create_unit(name,"luchnik",true);
}

Team20_luchnik::~Team20_luchnik()
{
	
}

QString Team20_luchnik::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/strela_2.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_molniy_mag::Team20_molniy_mag()
{
	QString name = "Team20 Маг молний";
	this->create_unit(name,"molniy_mag",true);
}

Team20_molniy_mag::~Team20_molniy_mag()
{
	
}

QString Team20_molniy_mag::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/molniy.png";
    QString res = this->help_attack_in_all(list,x,y,image);
    return res;
}

Result Team20_molniy_mag::result_damage(Base_player * player)
{
    Result res;
    int life = player->get_real_life();
    int def = player->get_bron();
    int uron = this->get_damage();

    if(this->veroatnost(5) == true)
        uron = uron * 2;

    res.uron = (((double)(100 - def)/100) * uron);

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
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_ogr::Team20_ogr()
{
	QString name = "Team20 Огр";
	this->create_unit(name,"ogr",true);
}

QString Team20_ogr::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/dubina.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}

Team20_ogr::~Team20_ogr()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_paralish::Team20_paralish()
{
	QString name = "Team20 Призрак";
	this->create_unit(name,"paralish",true);
}

Team20_paralish::~Team20_paralish()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_proklynaet::Team20_proklynaet()
{
	QString name = "Team20 Шаман";
	this->create_unit(name,"proklynaet",true);
}

Team20_proklynaet::~Team20_proklynaet()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_shelitel::Team20_shelitel()
{
	QString name = "Team20 Целитель";
	this->create_unit(name,"shelitel",true);
}

Team20_shelitel::~Team20_shelitel()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_simbiot::Team20_simbiot()
{
	QString name = "Team20 Симбиот";
	this->create_unit(name,"simbiot",true);
}

Team20_simbiot::~Team20_simbiot()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_skelet::Team20_skelet()
{
    QString name = "Team20 Скелет";
	this->create_unit(name,"skelet",true);
}

QString Team20_skelet::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/mesh_skelet.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}

Team20_skelet::~Team20_skelet()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_vampir::Team20_vampir()
{
	QString name = "Team20 Вампир";
	this->create_unit(name,"vampir",true);
}

Team20_vampir::~Team20_vampir()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Team20_vsadnik::Team20_vsadnik()
{
	QString name = "Team20 Всадник смерти";
	this->create_unit(name,"vsadnik",true);
}

Team20_vsadnik::~Team20_vsadnik()
{
	
}

QString Team20_vsadnik::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/kosa.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Other_goblin_lushnik::Other_goblin_lushnik()
{
	QString name = "Other Гоблин лучник";
	this->create_unit(name,"goblin_lushnik",false);
}

QString Other_goblin_lushnik::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/strela_goblin.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}

Other_goblin_lushnik::~Other_goblin_lushnik()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Other_goblin_voin::Other_goblin_voin()
{
	QString name = "Other Гоблин";
	this->create_unit(name,"goblin_voin",false);
}

QString Other_goblin_voin::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/mesh_goblin.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}

Other_goblin_voin::~Other_goblin_voin()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Other_krestyanin::Other_krestyanin()
{
	QString name = "Other Крестьянин";
	this->create_unit(name,"krestyanin",false);
}

QString Other_krestyanin::attack(int x, int y,QList<Base_player *> list)
{
    QString image = "file:///" + QApplication::applicationDirPath() + "/image/battle/image_damage/vily.png";
    QString res = this->help_attack_in_one(list,x,y,image);
    return res;
}

Other_krestyanin::~Other_krestyanin()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Other_lushnik::Other_lushnik()
{
	QString name = "Other Лучник";
	this->create_unit(name,"lushnik",false);
}

Other_lushnik::~Other_lushnik()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Other_main_l1::Other_main_l1()
{
	QString name = "Other Тал";
	this->create_unit(name,"main",false);
}

Other_main_l1::~Other_main_l1()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Other_main_strash::Other_main_strash()
{
	QString name = "Other Страж";
	this->create_unit(name,"main_strash",false);
}

Other_main_strash::~Other_main_strash()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Other_meshnik::Other_meshnik()
{
	QString name = "Other Мечник";
	this->create_unit(name,"meshnik",false);
}

Other_meshnik::~Other_meshnik()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
Other_zashitnik::Other_zashitnik()
{
	QString name = "Other Прислужник";
	this->create_unit(name,"zashitnik",false);
}

Other_zashitnik::~Other_zashitnik()
{
	
}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
