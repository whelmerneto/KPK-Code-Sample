<?php

namespace Database\Factories\Domain\Gamification\Models;

use Domain\Gamification\Models\GamificationReward;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<GamificationReward>
 */
class GamificationRewardFactory extends Factory
{
    protected $model = GamificationReward::class;

    public function definition()
    {
        return [
            'id' => $this->faker->numberBetween(1, 100),
            'tenant_id' => $this->faker->numberBetween(1, 100),
            'quiz_id' => $this->faker->numberBetween(1, 100),
            'class_id' => $this->faker->numberBetween(1, 100),
            'song' => $this->faker->randomElement(['lesson', 'quiz']),
            'name' => $this->faker->text,
            'description' => $this->faker->text,
            'needed_score' => $this->faker->numberBetween(1, 100),
            'url_img' => $this->faker->url(),
            'links' => $this->faker->shuffleArray(),
            'embed' => $this->faker->randomHtml(),
            'animation' => $this->faker->text,
            'reward_type' => $this->faker->randomElement(['score', 'lesson', 'quiz']),
            'created_at' => $this->faker->dateTime,
            'updated_at' => $this->faker->dateTime,
            'materials' => [],
            'reward_history' => [],
        ];
    }
}





