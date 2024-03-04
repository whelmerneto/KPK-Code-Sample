<?php

namespace Database\Seeders;

use Domain\Lesson\Models\LessonHistory;
use Illuminate\Database\Seeder;

class PopulateLessonHistoryWithCourse extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        LessonHistory::select([
            'ead_classes_histories.id as history_id',
            'ead_modules.course_id as course_id',
        ])
            ->join('ead_modules', 'ead_modules.id', '=', 'ead_classes_histories.module_id')
            ->whereNull('ead_classes_histories.course_id')
            ->chunk(10000, function ($histories) {
                $updates = [];

                foreach ($histories as $history) {
                    $updates[] = [
                        'id' => $history->history_id,
                        'course_id' => $history->course_id,
                    ];
                }

                if (! empty($updates)) {
                    LessonHistory::upsert($updates, ['id'], ['course_id']);
                }
            });
    }
}
