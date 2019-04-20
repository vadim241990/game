#include "gtest/gtest.h"
#include "global_settings.h"


TEST( InitGlobalSettings, InitDataIsValid )
{
    global_settings* settings = global_settings::global_settings_public( nullptr );
    ASSERT_EQ( 0, settings->get_level_game() );
    ASSERT_EQ( 0, settings->get_number_date() );
    ASSERT_EQ( 0, settings->get_point_1() );
    ASSERT_EQ( 0, settings->get_point_2() );
    ASSERT_EQ( 0, settings->get_point_3() );
    ASSERT_EQ( 0, settings->get_point_sila() );
    ASSERT_EQ( 0, settings->get_point_lovkost() );
    ASSERT_EQ( 0, settings->get_point_life() );
    ASSERT_EQ( 0, settings->get_point_energy() );

    ASSERT_EQ( false, settings->isGeroySkill( NameForSkill::DAMAGE_1 ) );
    ASSERT_EQ( false, settings->isGeroySkill( NameForSkill::DAMAGE_2 ) );
    ASSERT_EQ( false, settings->isGeroySkill( NameForSkill::ACCURACY_1 ) );
    ASSERT_EQ( false, settings->isGeroySkill( NameForSkill::PROTECT_1 ) );
    ASSERT_EQ( false, settings->isGeroySkill( NameForSkill::PROTECT_3 ) );
    ASSERT_EQ( false, settings->isGeroySkill( NameForSkill::FIRE_PROTECTION ) );
    ASSERT_EQ( false, settings->isGeroySkill( NameForSkill::POISON_PROTECTION ) );
}

int main(int argc, char *argv[])
{
    testing::InitGoogleTest( &argc, argv );
    return RUN_ALL_TESTS();
}
