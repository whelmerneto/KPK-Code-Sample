<?php

namespace Unit\Domain\Statistics;

use Domain\Statistics\DAO\StatisticsDAO;
use Domain\Statistics\Operations\GetStatisticsOperation;
use Domain\Statistics\UseCases\GetStatisticsUseCase;
use Tests\TestCase;

class GetStatisticsUseCaseTest extends TestCase
{
    public function test_get_subscribed_in()
    {
        $subscribed_in = $this->get_subscribed_in_data_dummy();
        $this->mock(StatisticsDAO::class)
            ->shouldReceive('studentsAmount')
            ->andReturn([$subscribed_in]);

        $useCase = $this->test_get_statistics_use_case();
        $output = $useCase->handle(1);
        $this->assertNotEquals($subscribed_in, $output);
        $this->assertNotEmpty($output);
    }
    public function test_get_most_popular_students()
    {
        $most_popular_students = $this->get_most_popular_students_data_dummy();
        $this->mock(StatisticsDAO::class)
            ->shouldReceive('mostPopularStudents')
            ->andReturn([$most_popular_students]);

        $useCase = $this->test_get_statistics_use_case();
        $output = $useCase->handle(1);
        $this->assertNotEquals($most_popular_students, $output);
        $this->assertNotEmpty($output);
    }
    public function test_get_most_popular_courses()
    {
        $most_popular_courses = $this->get_most_popular_courses_data_dummy();
        $this->mock(StatisticsDAO::class)
            ->shouldReceive('mostPopularCourses')
            ->andReturn([$most_popular_courses]);

        $useCase = $this->test_get_statistics_use_case();
        $output = $useCase->handle(1);
        $this->assertNotEquals($most_popular_courses, $output);
        $this->assertNotEmpty($output);
    }
    public function test_get_most_liked_lesson()
    {
        $most_liked_lesson = $this->get_most_liked_lesson_data_dummy();
        $this->mock(StatisticsDAO::class)
            ->shouldReceive('mostLikedLesson')
            ->andReturn([$most_liked_lesson]);

        $useCase = $this->test_get_statistics_use_case();
        $output = $useCase->handle(1);
        $this->assertNotEquals($most_liked_lesson, $output);
        $this->assertNotEmpty($output);
    }
    public function test_get_most_disliked_lesson()
    {
        $most_disliked_lesson = $this->get_most_disliked_lesson_data_dummy();
        $this->mock(StatisticsDAO::class)
            ->shouldReceive('mostDislikedLesson')
            ->andReturn([$most_disliked_lesson]);

        $useCase = $this->test_get_statistics_use_case();
        $output = $useCase->handle(1);
        $this->assertNotEquals($most_disliked_lesson, $output);
        $this->assertNotEmpty($output);
    }
    public function test_get_consume_content()
    {
        $consume_content = $this->get_consume_content_data_dummy();
        $this->mock(StatisticsDAO::class)
            ->shouldReceive('consumeContent')
            ->andReturn([$consume_content]);

        $useCase = $this->test_get_statistics_use_case();
        $output = $useCase->handle(1);
        $this->assertNotEquals($consume_content, $output);
        $this->assertNotEmpty($output);
    }
    private function get_subscribed_in_data_dummy(): array
    {
        return [
            [
                'total' => 15,
                'period' => 7,
            ],
            [
                'total' => 290,
                'period' => 30,
            ],
            [
                'total' => 10,
                'period' => 90,
            ],
        ];
    }
    private function get_most_popular_students_data_dummy(): array
    {
        return [
            'data' => [
                [
                    'user_id' => "fe6e6f74-b16e-410c-b999-525872049e9a",
                    'Nome_Aluno' => "Zagreus",
                    'Email' => "kratos@bomdeguerra.com",
                    'Foto_Aluno' => "https:\/\/d2ik51dz9s180r.cloudfront.net\/images\/banners\/image_202303286423554c2faca.png",
                    'tenant_id' => 127,
                    'Qtd_Aulas_Concluidas' => "11",
                ],
            ],
        ];
    }
    private function get_most_popular_courses_data_dummy(): array
    {
        return [
            'data' => [
                [
                    'course_id' =>  "8bcc876b-02ed-45bf-bb48-ac53b0891333",
                    'Curso' => "Aprendendo React - Desenvolvendo web apps incríveis!",
                    'Imagem_Curso' => "https:\/\/d2ik51dz9s180r.cloudfront.net\/images\/CkD22iZkZ8hUmw2prrCITbvLIoWqQjxiKehWYgMw.png",
                    'Qtd_Aulas_Concluidas' => "10",
                    'Consumo_do_curso' => "0.3226",
                ],
            ],
        ];
    }
    private function get_most_liked_lesson_data_dummy(): array
    {
        return [
            'data' => [
                [
                    "nome_do_curso" => "Hollow Knight",
                    "nome_aula" => "Aula do tipo URL - Vimeo\/ MC JPG",
                    "class_id" => "a881ec55-4a7d-4992-9e1b-eb4cb64465eb",
                    "course_id" => "30cdedb8-a3aa-4ba9-9695-714c7f115e0d",
                    "lesson_image" => "https:\/\/d2ik51dz9s180r.cloudfront.net\/images\/aHtBmLTsqUAArE8u0wBa3vmkGVt62Qwt7hx08LqO.png",
                    "percentage" => "0.75"
                ],
            ],
        ];
    }
    private function get_most_disliked_lesson_data_dummy():array
    {
        return [
            'data' => [
                [
                    "nome_do_curso" => "Curso node JS",
                    "nome_aula" => "aula 01 - entendendo a estrutura",
                    "class_id" => "73e9c9e7-eab1-405c-baf8-3892da4d011b",
                    "course_id" => "48372a44-2e6d-435f-a9eb-59c7f7612d47",
                    "lesson_image" => "\/images\/default_lesson_cards\/vermelho-violeta\/vermelho-violeta_vertical.svg",
                    "percentage" => "0.6667"
                ],
            ],
        ];
    }
    private function get_consume_content_data_dummy(): array
    {
        return [
            'data' => [
                [
                    "25%" => 119,
                    "25% - 75%" => 2,
                    "75% - 100%" => 1,
                    "finished_content" => 2873
                ],
            ],
        ];
    }
    public function test_get_statistics_use_case()
    {
        $mocker = $this->mock(StatisticsDAO::class);
        $mocker->shouldReceive('studentsAmount')->andReturn($this->get_subscribed_in_data_dummy());
        $mocker->shouldReceive('mostPopularStudents')->andReturn($this->get_most_popular_students_data_dummy());
        $mocker->shouldReceive('mostPopularCourses')->andReturn($this->get_most_popular_courses_data_dummy());
        $mocker->shouldReceive('mostLikedLesson')->andReturn($this->get_most_liked_lesson_data_dummy());
        $mocker->shouldReceive('mostDislikedLesson')->andReturn($this->get_most_disliked_lesson_data_dummy());
        $mocker->shouldReceive('consumeContent')->andReturn($this->get_consume_content_data_dummy());
        $operation = new GetStatisticsOperation($mocker);
        $this->assertInstanceOf(GetStatisticsOperation::class, $operation);
        return new GetStatisticsUseCase($operation);

    }

}

