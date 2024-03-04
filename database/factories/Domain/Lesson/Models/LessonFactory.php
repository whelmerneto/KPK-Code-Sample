<?php

namespace Database\Factories\Domain\Lesson\Models;

use Domain\Lesson\Models\Lesson;
use Domain\Module\Models\Module;
use Illuminate\Database\Eloquent\Factories\Factory;

class LessonFactory extends Factory
{
    protected $model = Lesson::class;

    public function definition(): array
    {
        $module = Module::inRandomOrder()->first();

        return [
            'id' => $this->faker->uuid(),
            'module_id' => $module->id,
            'title' => $this->faker->sentence(2),
            'status' => $this->faker->boolean(),
            'blocked' => $this->faker->randomElement(['active', 'inactive']),
            'published' => $this->faker->randomElement(['active', 'inactive']),
            'url_image' => $this->faker->imageUrl(),
            'url_thumb' => $this->faker->imageUrl(),
            'host' => $this->faker->randomElement([
                'panavideo',
                'cloudflare_video',
                'vimeo_video',
                'url_external',
                'youtube',
                'vimeo',
                'text',
                'videojs',
                'cloudflare',
                'jmvstream',
            ]),
            'slug' => $this->faker->slug(),
        ];
    }
}
