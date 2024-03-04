<?php

namespace Unit\Domain\Gamification;

use Domain\Gamification\Models\GamificationReward;
use Tests\TestCase;

class GetRewardsUseCaseTest extends TestCase
{
    public function test_get_reward_score()
    {
        $rewards = $this->dummy_data_score();
        $this->assertEquals(1, count($rewards));
        $this->assertEquals(null, $rewards[0]['quiz_id']);
        $this->assertEquals(null, $rewards[0]['class_id']);
        $this->assertNotEquals(null, $rewards[0]['needed_score']);
        $this->assertEquals('score', $rewards[0]['reward_type']);
    }
    public function test_get_reward_lesson()
    {
        $rewards = $this->dummy_data_lesson();
        $this->assertEquals(1, count($rewards));
        $this->assertEquals(null, $rewards[0]['quiz_id']);
        $this->assertNotEquals(null, $rewards[0]['class_id']);
        $this->assertEquals(null, $rewards[0]['needed_score']);
        $this->assertEquals('lesson', $rewards[0]['reward_type']);
    }
    public function test_get_reward_quiz()
    {
        $rewards = $this->dummy_data_quiz();
        $this->assertEquals(1, count($rewards));
        $this->assertNotEquals(null, $rewards[0]['quiz_id']);
        $this->assertEquals(null, $rewards[0]['class_id']);
        $this->assertEquals(null, $rewards[0]['needed_score']);
        $this->assertEquals('quiz', $rewards[0]['reward_type']);
    }

    public function dummy_data_score()
    {
        return GamificationReward::factory(1)->make([
            'quiz_id' => null,
            'class_id' => null,
            'needed_score' => 10,
            'reward_type' => 'score',
        ]);
    }
    public function dummy_data_lesson()
    {
        return GamificationReward::factory(1)->make([
            'quiz_id' => null,
            'reward_type' => 'lesson',
            'needed_score' => null

        ]);
    }
    public function dummy_data_quiz()
    {
        return GamificationReward::factory(1)->make([
            'class_id' => null,
            'reward_type' => 'quiz',
            'needed_score' => null

        ]);
    }

}





