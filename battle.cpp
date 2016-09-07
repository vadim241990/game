#include "battle.h"

Battle::Battle(QObject *parent) : QObject(parent)
{
  
}

Battle::~Battle()
{
    this->clear();
}

int Battle::get_many_za_boy()
{
   return this->many_za_boy;
}

void Battle::set_name_battle(QString name)
{
    this->name_battle = name;
}

QString Battle::get_name_battle()
{
    return this->name_battle;
}

void Battle::clear()
{
    for(int i = 0; i < this->all_team.size(); i++)
    {
        delete this->all_team[i];
    }
    this->all_team.clear();
    this->red_team.clear();
    this->blue_team.clear();

    this->many_za_boy = 0;
    this->name_battle = "";
}
/////////////////////////private functions
/////////////////////////
/////////////////////////
QString Battle::parsing_kill(QString res)
{
    QString res_2 = "";
    int len = 0;
    int start_index = 0;
    int end_index = 0;
    int koord_x = 0;
    int koord_y = 0;
    bool red_is_otrad = false;
    QVector<QString> team;

    end_index = res.indexOf("^",start_index);
    if(end_index == -1)
    {
        res += "!void";
        return res; // удалять некого
    }

    else
        res_2 = res.right(res.size() - (end_index + 1));

    while(1)
    {
      end_index = res.indexOf("@",start_index);
      if(end_index == -1)
          break;

      len = end_index - start_index;
      team.push_back(res.mid(start_index,len));
      start_index = end_index + 1;
    }

    for(int i = 0; i < team.size(); i++)
    {
        koord_x = team.at(i).left(1).toInt();
        koord_y = team.at(i).mid(2,1).toInt();

        for(int z = 0; z < this->all_team.size(); z++) //поиск в списке всех игроков
        {
            if((koord_x == this->all_team[z]->get_point_X()) && (koord_y == this->all_team[z]->get_point_Y()))
            {//нашли в общем списке передаем дальше
                red_is_otrad = false;
                for(int t = 0; t < this->red_team.size();t++) //из красной команды
                {
                    if((this->red_team[t]->get_point_X() == this->all_team[z]->get_point_X()) && (this->red_team[t]->get_point_Y() == this->all_team[z]->get_point_Y()))
                    {
                        delete this->red_team[t];
                        this->red_team.removeAt(t);
                        this->all_team.removeAt(z);
                        red_is_otrad = true;

                        if(this->red_team.size() == 0)
                            res_2 += "!win";

                        break;
                    }
                }

                if(red_is_otrad == true)
                    break;

                for(int v = 0; v < this->blue_team.size(); v++) //из синей команды
                {
                    if((this->blue_team[v]->get_point_X() == this->all_team[z]->get_point_X()) && (this->blue_team[v]->get_point_Y() == this->all_team[z]->get_point_Y()))
                    {
                        delete this->blue_team[v];
                        this->blue_team.removeAt(v);
                        this->all_team.removeAt(z);

                        if(this->blue_team.size() == 0)
                            res_2 += "!game_over";

                        break;
                    }
                }
            }
        }
    }

    return res_2;
}
/////////////////////////end private functions
/////////////////////////
/////////////////////////

int Battle::get_first_in_osheredi_x()
{
    return this->all_team[0]->get_point_X();
}

int Battle::get_first_in_osheredi_y()
{
    return this->all_team[0]->get_point_Y();
}

QString Battle::get_first_in_osheredi_shel()
{
    return this->all_team[0]->get_shel();
}

QString Battle::get_first_in_osheredi_shel_attack()
{
    return this->all_team[0]->get_shel_attack();
}

QString Battle::get_first_name()
{
    return this->all_team[0]->get_name_id();
}

/**
 * @brief new_battle - создание нового поля боя
 *
 * @param [in] text строка с игроками для парсинга
 *
 * @return нету
 */
void Battle::new_battle(QString text)
{
  QString name;
  int len = 0;
  int start_index = 0;
  int end_index = 0;
  
  end_index = text.indexOf("@",start_index);
  if(end_index == -1)
	return;
	
  QString left = text.left(end_index);// парсим левую часть
  QString right = text.mid(end_index+1,text.size() - (end_index+1)); //парси правую часть
  
  for(int i = 0; i < 6; i++)
  {
    end_index = left.indexOf("#",start_index);
    if(end_index == -1)
      return;
    
    len = end_index - start_index;
    name = left.mid(start_index,len);
    this->fabrica_players(name,i,true);
    start_index = end_index + 1;
  }
  
  start_index = 0; //сбросим показатели
  end_index = 0;
  len = 0;
  
  for(int j = 6; j < 12; j++)
  {
    end_index = right.indexOf("#",start_index);
    if(end_index == -1)
      return;
    
    len = end_index - start_index;
    name = right.mid(start_index,len);
    this->fabrica_players(name,j,false);
    start_index = end_index + 1;
  }

  start_index = right.indexOf("$",0);  //запись стоимости боя(опыт) при победе
  start_index++;
  end_index = right.length();
  len = end_index - start_index;
  this->many_za_boy = right.mid(start_index,len).toInt();
  
  this->all_team += this->blue_team;
  this->all_team += this->red_team;
  this->sort_all_team();
}
/**
 * @brief fabrica_players - создание игроков
 *
 * @param [in] name имя игрока
 * @param [in] index номер отряда от 0 до 5(включительно)
 * @param [in] my_team (true команда героя)(false соперник)
 *
 * @return нету
 */
void Battle::fabrica_players(QString name,int index,bool my_team)
{
  Base_player * player;
  int x;
  int y;
  if(name == "void")
    return;
		
  if(my_team == true)
  {
    if(index == 0)      {x = 0; y = 0;}
    else if(index == 1)	{x = 1; y = 0;}
    else if(index == 2)	{x = 0; y = 1;}
    else if(index == 3)	{x = 1; y = 1;}
    else if(index == 4)	{x = 0; y = 2;}
    else if(index == 5)	{x = 1; y = 2;}
    
    if(name == "Скелет")                player = new Team20_skelet();
    else if(name == "Огр")              player = new Team20_ogr();
    else if(name == "Лезвие льда")      player = new Team20_cold();
    else if(name == "Владыка")          player = new Team20_fier();
    else if(name == "Всадник смерти")	player = new Team20_vsadnik();
    else if(name == "Арбалетчик")       player = new Team20_arbaletshik();
    else if(name == "Маг тьмы")         player = new Team20_dark_mag();
    else if(name == "Маг огня")         player = new Team20_fire_mag();
    else if(name == "Лучник")           player = new Team20_luchnik();
    else if(name == "Маг молний")       player = new Team20_molniy_mag();
    else if(name == "Лекарь")           player = new Team20_lekar();
    else if(name == "Целитель")         player = new Team20_shelitel();
    else if(name == "Призрак")          player = new Team20_paralish();
    else if(name == "Шаман")            player = new Team20_proklynaet();
    else if(name == "Симбиот")          player = new Team20_simbiot();
    else if(name == "Темный ангел")     player = new Team20_angel();
    else if(name == "Элементаль холода")player = new Team20_elemental_cold();
    else if(name == "Голем")            player = new Team20_golem();
    else if(name == "Вампир")           player = new Team20_vampir();
    else if(name == "Элементаль молний")player = new Team20_elemental_elektrisiti();
    else
    { //значит герой
      int value = name.indexOf(":");
      QString res = name.left(value);

      if(res == "Воин")          player = new Heroes_voin();
      else if(res == "Маг")      player = new Heroes_mag();
      else if(res == "Лучник")   player = new Heroes_luchnik();
    }
      
    player->set_point_X(x);
    player->set_point_Y(y);
    this->blue_team.push_back(player);
  }
  else
  {
    if(index == 6)          {x = 2; y = 0;}
    else if(index == 7)		{x = 3; y = 0;}
    else if(index == 8)		{x = 2; y = 1;}
    else if(index == 9)		{x = 3; y = 1;}
    else if(index == 10)	{x = 2; y = 2;}
    else if(index == 11)	{x = 3; y = 2;}
    
    if(name == "Other Крестьянин")          player = new Other_krestyanin();
    else if(name == "Other Гоблин")         player = new Other_goblin_voin();
    else if(name == "Other Гоблин лучник")	player = new Other_goblin_lushnik();
    else if(name == "Other Мечник")         player = new Other_meshnik();
    else if(name == "Other Лучник")         player = new Other_lushnik();
    else if(name == "Other Страж")          player = new Other_main_strash();
    else if(name == "Other Прислужник")		player = new Other_zashitnik();
    else if(name == "Other Тал")            player = new Other_main_l1();
    
    player->set_point_X(x);
    player->set_point_Y(y);
    this->red_team.push_back(player);
  }
}

/**
 * @brief damage - произвести удар
 *
 * @param [in] x координата x кого ударили
 * @param [in] y координата y кого ударили
 *
 * @return строку результата
 */
QString Battle::damage(int x,int y)
{
    QString res = this->all_team[0]->attack(x,y,this->all_team);
    return parsing_kill(res);
}

/**
 * @brief sort_all_team - сортировка всех игроков по инициативе
 *
 * @return нету
 */

bool caseOtrad(Base_player *otrad_1,Base_player *otrad_2)
{
    return (otrad_1->get_inichiativa() > otrad_2->get_inichiativa());
}

void Battle::sort_all_team()
{
    qSort(this->all_team.begin(),this->all_team.end(),caseOtrad);
}

/**
 * @brief get_stroka_all_team - возрат строки с именами всех в очереди
 *
 * @return строку с именами всех отрядов в очереди
 */
QString Battle::get_stroka_all_team()
{
    QString stroka = "";
    for(int i = 0; i < this->all_team.size();i++)
    {
        stroka += this->all_team[i]->get_name_id();
        stroka += "#";
    }
    return stroka;
}

/**
 * @brief get_stroka_all_team_start - возвращает строку с именами,коорд и жизнями для инициализации
 *
 * @return строку
 */
QString Battle::get_stroka_all_team_start()
{
    QString stroka = "";
    for(int i = 0; i < this->all_team.size();i++)
    {
        stroka += this->all_team[i]->get_name_id();

        stroka += ":" + QString::number(this->all_team[i]->get_point_X());
        stroka += ":" + QString::number(this->all_team[i]->get_point_Y());
        stroka += ":" + QString::number(this->all_team[i]->get_life()) + ":";
        stroka += "#";
    }
    return stroka;
}

/**
 * @brief select_oshered - ищет отряд по координатам в очереди ходов
 *
 * @return номер в очереди (-1 если нету)
 */
int Battle::select_oshered(int x,int y)
{
    for(int i = 0; i < this->all_team.size(); i++)
    {
        if((this->all_team[i]->get_point_X() == x) && (this->all_team[i]->get_point_Y() == y))
            return i;
    }
    return -1;
}

/**
 * @brief perehod_hoda - переход хода другому юниту
 *
 * @return ничего
 */
void Battle::perehod_hoda()
{
    if(this->all_team.size() > 1)
    {
        this->all_team.move(0,this->all_team.size() - 1);
    }
}

/**
 * @brief hod_pc - компьютерный ход
 *
 * @return строку с результатами для отображения в UI
 */
//Тупой_1 - бьет случайным образом без всяких расчетов
//Легкий - бьет отряд с меньшим числом здоровья(расчет без учета команды)
QString Battle::hod_pc()
{
    int x = this->get_first_in_osheredi_x();
    int y = this->get_first_in_osheredi_y();
    QString name = this->get_first_name();
    QString name_AI;

    if((name == "Other Гоблин лучник") || (name == "Other Гоблин"))
        name_AI = "Тупой_1";
    else if(name == "Other Крестьянин")
        name_AI = "Легкий";

    QList<Base_player *> can_damage = help_can_damage();  //список кого можно ударить

    int res = this->help_hod_pc(name_AI,can_damage); // выбор конкретного бойца для удара

    Base_player * player;
    for(int i = 0; i < this->red_team.size();i++)
    {
        if((this->red_team[i]->get_point_X() == x) && (this->red_team[i]->get_point_Y() == y))
            player = this->red_team[i];
    }

    QString result = player->attack(can_damage[res]->get_point_X(),can_damage[res]->get_point_Y(),this->all_team);
    return parsing_kill(result);
}

int Battle::help_hod_pc(QString name_AI,QList<Base_player *> & other_team)
{
    int res = 0;
    int size = other_team.size();

    if(name_AI == "Тупой_1")
    {
        qsrand(static_cast<quint64>(QTime::currentTime().msecsSinceStartOfDay()));
        res = qrand() % size;
        return res;
    }
    else if(name_AI == "Легкий")
    {
        if(size == 1)
            return 0;

        int number;
        for(int i = 0; i < other_team.size(); i++)
        {
            if(i == 0) //первый заход сохраняем для проверки
            {
                number = other_team[i]->get_real_life();
                res = 0;
                continue;
            }

            if(number > other_team[i]->get_real_life())
            {
                number = other_team[i]->get_real_life();
                res = i;
            }
        }
    }

    return res;
}

QList<Base_player *> Battle::help_can_damage()
{
    int x = this->get_first_in_osheredi_x();
    int y = this->get_first_in_osheredi_y();
    QString shel = this->get_first_in_osheredi_shel();
    QString shel_attack = this->get_first_in_osheredi_shel_attack();
    QList<Base_player *> can_damage;

    if(shel_attack == "1-2-ряд")
        can_damage = this->blue_team;
    else if(shel_attack == "1-ряд")
    {
        if(shel == "6")
        {
            can_damage = this->blue_team;
        }
        else
        {
            if(x == 2) //не задний ряд
            {
                if(y == 1) // если отряд стоит в центре
                {
                    for(int i = 0; i < this->blue_team.size();i++)
                    {
                        if(this->blue_team[i]->get_point_X() == 1)
                            can_damage.push_back(this->blue_team[i]);
                    }

                    if(can_damage.size() == 0) //если первый ряд пустой
                    {
                        for(int i = 0; i < this->blue_team.size();i++)
                        {
                            if(this->blue_team[i]->get_point_X() == 0)
                                can_damage.push_back(this->blue_team[i]);
                        }
                    }
                }
                else if(y == 0)  // если отряд стоит на верху
                {
                    for(int i = 0; i < this->blue_team.size();i++)
                    {
                        if(this->blue_team[i]->get_point_X() == 1 && (this->blue_team[i]->get_point_Y() == 0 || this->blue_team[i]->get_point_Y() == 1))
                            can_damage.push_back(this->blue_team[i]);
                    }

                    if(can_damage.size() == 0) // если 2 отряда в первом ряду отсутствуют идем дальше
                    {
                        for(int i = 0; i < this->blue_team.size();i++)
                        {
                            if((this->blue_team[i]->get_point_X() == 1) && (this->blue_team[i]->get_point_Y() == 2))
                                can_damage.push_back(this->blue_team[i]);
                        }

                        if(can_damage.size() == 0) // если в первом ряду никого нет идем дальше
                        {
                            for(int i = 0; i < this->blue_team.size();i++)
                            {
                                if(this->blue_team[i]->get_point_X() == 0 && (this->blue_team[i]->get_point_Y() == 0 || this->blue_team[i]->get_point_Y() == 1))
                                    can_damage.push_back(this->blue_team[i]);
                            }

                            if(can_damage.size() == 0)  // если 2 отряда во 2 ряду отсутствуют идем дальше
                            {
                                for(int i = 0; i < this->blue_team.size();i++)
                                {
                                    if((this->blue_team[i]->get_point_X() == 0) && (this->blue_team[i]->get_point_Y() == 2))
                                        can_damage.push_back(this->blue_team[i]);
                                }
                            }
                        }
                    }
                }
                else if(y == 2) // если отряд стоит внизу
                {
                    for(int i = 0; i < this->blue_team.size();i++)
                    {
                        if(this->blue_team[i]->get_point_X() == 1 && (this->blue_team[i]->get_point_Y() == 2 || this->blue_team[i]->get_point_Y() == 1))
                            can_damage.push_back(this->blue_team[i]);
                    }

                    if(can_damage.size() == 0) // если 2 отряда в первом ряду отсутствуют идем дальше
                    {
                        for(int i = 0; i < this->blue_team.size();i++)
                        {
                            if((this->blue_team[i]->get_point_X() == 1) && (this->blue_team[i]->get_point_Y() == 0))
                                can_damage.push_back(this->blue_team[i]);
                        }

                        if(can_damage.size() == 0) // если в первом ряду никого нет идем дальше
                        {
                            for(int i = 0; i < this->blue_team.size();i++)
                            {
                                if(this->blue_team[i]->get_point_X() == 0 && (this->blue_team[i]->get_point_Y() == 2 || this->blue_team[i]->get_point_Y() == 1))
                                    can_damage.push_back(this->blue_team[i]);
                            }

                            if(can_damage.size() == 0)  // если 2 отряда во 2 ряду отсутствуют идем дальше
                            {
                                for(int i = 0; i < this->blue_team.size();i++)
                                {
                                    if((this->blue_team[i]->get_point_X() == 0) && (this->blue_team[i]->get_point_Y() == 0))
                                        can_damage.push_back(this->blue_team[i]);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    return can_damage;
}

/**
 * @brief get_full_info_otrad - возврат полной информации о характеристиках отряда на текущий момент
 *
 * @param [in] x координата x кого отобразить
 * @param [in] y координата y кого отобразить
 *
 * @return строку результата
 */
QString Battle::get_full_info_otrad(int x,int y)
{
    int number = select_oshered(x,y);
    QString res = "";

    res += this->all_team[number]->get_name();
    res += "#";
    res += this->all_team[number]->get_type_damage();
    res += "#";
    res += QString::number(this->all_team[number]->get_ver_damage());
    res += "#";
    res += QString::number(this->all_team[number]->get_damage());
    res += "#";
    res += QString::number(this->all_team[number]->get_real_life()) +"/"+ QString::number(this->all_team[number]->get_life());
    res += "#";
    res += QString::number(this->all_team[number]->get_bron());
    res += "#";
    res += QString::number(this->all_team[number]->get_inichiativa());
    res += "#";
    res += this->all_team[number]->get_shel();
    res += "#";
    res += this->all_team[number]->get_zashita();
    res += "#";
    res += this->all_team[number]->get_immunitet();
    res += "#";
    res += this->all_team[number]->get_shel_attack();
    res += "#";
    res += this->all_team[number]->get_description();
    res += "#";

    return res;
}
