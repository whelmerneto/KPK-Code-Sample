<?php

namespace Database\Seeders;

use Domain\Lesson\Models\Lesson;
use Illuminate\Database\Seeder;

class PopulateLessonWithCourse extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Lesson::select([
            'ead_classes.id as lesson_id',
            'ead_modules.course_id as course_id',
        ])
            ->join('ead_modules', 'ead_modules.id', '=', 'ead_classes.module_id')
            ->whereNull('ead_classes.course_id')
            ->chunk(1500, function ($lessons) {
                $updates = [];

                foreach ($lessons as $lesson) {
                    $updates[] = [
                        'id' => $lesson->lesson_id,
                        'course_id' => $lesson->course_id,
                    ];
                }

                if (! empty($updates)) {
                    Lesson::upsert($updates, ['id'], ['course_id']);
                }
            });
    }
}
