<?php
//
//namespace Tests\Unit\Platform;
//
//use Domain\Course\Interfaces\CourseRepositoryInterface;
//use Domain\Lesson\Interfaces\LessonRepositoryInterface;
//use Domain\Module\Interfaces\ModuleRepositoryInterface;
//use Domain\Platform\Data\PlatformSearchDTO;
//use Domain\Platform\Operations\PlatformSearchOperation;
//use Illuminate\Database\Eloquent\Collection;
//use Tests\TestCase;
//
//class PlatformSearchOperationTest extends TestCase
//{
//    private $dummyTenantId = '127';
//
//    private $dummyUserId = 'fe6e6f74-b16e-410c-b999-525872049e9a';
//
//    /**
//     * @test
//     */
//    public function search_operation_is_working(): void
//    {
//        $expected_result_course = $this->dummy_courses_search_result();
//        $expected_result_module = $this->dummy_modules_search_result();
//        $expected_result_lesson = $this->dummy_lessons_search_result();
//
//        $dto = PlatformSearchDTO::from([
//            'tenant_id' => $this->dummyTenantId,
//            'query_url' => 'teste',
//            'user_id' => $this->dummyUserId,
//        ]);
//
//        $columns = ['id', 'slug', 'url_cover_vertical'];
//        $filters = [
//            ['tenant_id', '=', $dto->tenant_id],
//            ['published', '=', 'active'],
//            ['title', 'like', '%' . $dto->query_url . '%'],
//        ];
//        $relations = [
//            'userHistory' => function ($query) use ($dto) {
//                $query->select('class_id', 'to_total', 'finished')
//                    ->where('user_id', $dto->user_id)
//                    ->where('tenant_id', $dto->tenant_id)
//                    ->orderBy('created_at', 'desc');
//            },
//        ];
//
//        $courseRepositoryInterface = $this->createMock(CourseRepositoryInterface::class);
//        $courseRepositoryInterface->expects($this->exactly(1))
//            ->method('get')
//            ->with($filters, $columns)
//            ->willReturn($expected_result_course);
//
//        $moduleRepositoryInterface = $this->createMock(ModuleRepositoryInterface::class);
//        $moduleRepositoryInterface->expects($this->exactly(1))
//            ->method('get')
//            ->with($filters, $columns)
//            ->willReturn($expected_result_module);
//
//        $lessonRepositoryInterface = $this->createMock(LessonRepositoryInterface::class);
//        $lessonRepositoryInterface->expects($this->exactly(1))
//            ->method('get')
//            ->with($filters, ['id', 'title', 'slug', 'url_banner'], $relations)
//            ->willReturn($expected_result_lesson);
//
//        $operation = new PlatformSearchOperation($courseRepositoryInterface, $lessonRepositoryInterface, $moduleRepositoryInterface);
//
//        $response = $operation->execute($columns, $relations, $filters);
//
//        $this->assertEquals($expected_result_course, $response['courses']);
//        $this->assertEquals($expected_result_module, $response['modules']);
//        $this->assertEquals($expected_result_lesson, $response['lessons']);
//    }
//
//    /** @test */
//    public function this_return_a_message_on_null_result()
//    {
//        $expected_result_course = new Collection([$this->dummy_null_courses_search_result()]);
//        $expected_result_module = new Collection([$this->dummy_null_modules_search_result()]);
//        $expected_result_lesson = new Collection([$this->dummy_null_lessons_search_result()]);
//
//        $dto = PlatformSearchDTO::from([
//            'tenant_id' => $this->dummyTenantId,
//            'query_url' => 'teste',
//            'user_id' => $this->dummyUserId,
//        ]);
//
//        $columns = ['id', 'slug', 'url_cover_vertical'];
//        $filters = [
//            ['tenant_id', '=', $dto->tenant_id],
//            ['published', '=', 'active'],
//            ['title', 'like', '%' . $dto->query_url . '%'],
//        ];
//        $relations = [
//            'userHistory' => function ($query) use ($dto) {
//                $query->select('class_id', 'to_total', 'finished')
//                    ->where('user_id', $dto->user_id)
//                    ->where('tenant_id', $dto->tenant_id)
//                    ->orderBy('created_at', 'desc');
//            },
//        ];
//
//        $courseRepositoryInterface = $this->createMock(CourseRepositoryInterface::class);
//        $courseRepositoryInterface->expects($this->exactly(1))
//            ->method('get')
//            ->with($filters, $columns)
//            ->willReturn($expected_result_course);
//
//        $moduleRepositoryInterface = $this->createMock(ModuleRepositoryInterface::class);
//        $moduleRepositoryInterface->expects($this->exactly(1))
//            ->method('get')
//            ->with($filters, $columns)
//            ->willReturn($expected_result_module);
//
//        $lessonRepositoryInterface = $this->createMock(LessonRepositoryInterface::class);
//        $lessonRepositoryInterface->expects($this->exactly(1))
//            ->method('get')
//            ->with($filters, ['id', 'title', 'slug', 'url_banner'], $relations)
//            ->willReturn($expected_result_lesson);
//
//        $operation = new PlatformSearchOperation($courseRepositoryInterface, $lessonRepositoryInterface, $moduleRepositoryInterface);
//
//        $response = $operation->execute($columns, $relations, $filters);
//
//        $this->assertEquals($expected_result_course, $response['courses']);
//        $this->assertEquals($expected_result_module, $response['modules']);
//        $this->assertEquals($expected_result_lesson, $response['lessons']);
//    }
//
//    public function dummy_courses_search_result()
//    {
//        $dummy_result = '{
//            "id": "348a9a3f-0e0b-4e86-b272-3e944cd666c1",
//            "slug": "novo-curso-teste",
//            "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/banners/image_20221004633c3bb0e6e01.png",
//            "deliverable": {
//                "released": true
//            }
//        },
//        {
//            "id": "5a44e91d-e784-4953-bc9c-f002864441b6",
//            "slug": "curso-para-teste-croop-2",
//            "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/banners/image_2022093063371c4850c4c.png",
//            "deliverable": {
//                "released": true
//            }
//        },
//        {
//            "id": "71e8e613-b8d0-4fa4-831e-15be43681a6e",
//            "slug": "teste-qa-automatizado-curso-11890551902",
//            "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/4HmDO2PvzdyZVv4wOOjEyzYhHJRZegkTdVT1R9dS.png",
//            "deliverable": {
//                "released": true
//            }
//        },
//        {
//            "id": "a522e9fb-f3a6-4890-b2af-f573b920ec12",
//            "slug": "curso-teste-compressao",
//            "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/19HITaIJZW5OgaiplBZHFDwmojieVdLdHcbstmea.jpg",
//            "deliverable": {
//                "released": true
//            }
//        },
//        {
//            "id": "a8f461fe-aa12-417a-9d3f-01ce74ba3714",
//            "slug": "curso-para-teste-sem-image-redonda",
//            "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/banners/image_2022093063371cc275a70.png",
//            "deliverable": {
//                "released": true
//            }
//        },
//        {
//            "id": "ccc6fe37-750f-406e-8c63-ae57b687c194",
//            "slug": "teste",
//            "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/Iz9HArEx717C3C7AUPa36gNnSlniQFzN6oJOb8I1.png",
//            "deliverable": {
//                "released": true
//            }
//        },
//        {
//            "id": "e564dfb2-bc53-4a9b-9389-f631051659b9",
//            "slug": "teste-banner-upload",
//            "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/dRBwhRKvVK6aAvo5n38HxNObuuZI82lzE90P5diD.png",
//            "deliverable": {
//                "released": true
//            }
//        }';
//
//        $dummy_result = json_decode($dummy_result, true);
//
//        return new Collection($dummy_result);
//    }
//
//    public function dummy_modules_search_result()
//    {
//        $dummy_result = '{
//            "id": "4bad6890-6381-490b-9c08-10057283ed78",
//            "slug": "teste747563081",
//            "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/mwK9QzShzJ7SqUnaJw2O7ulTE7PLfjyxNYBCwHOO.png",
//            "deliverable": {
//                "released": true
//            }
//        },
//        {
//            "id": "4d1a4317-851b-4db9-8bc4-fde14354e5e7",
//            "slug": "teste-qa-automatizado-modulo-1-2uIAB",
//            "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/qH8tQv8zbF4CUOFlLVrsFp09XR4flA4mnSPUwRJg.png",
//            "deliverable": {
//                "released": true
//            }
//        },
//        {
//            "id": "4d74e501-4ce8-4748-ba1f-75fb8b918500",
//            "slug": "teste-x",
//            "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/yST2lu6G9zj297AMz0g9VXRsciVZGC3el4we3xs5.png",
//            "deliverable": {
//                "released": true
//            }
//        },
//        {
//            "id": "94e7f318-c7fb-4047-95aa-f4729b7ce02c",
//            "slug": "teste-z-5blOS",
//            "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/6kREAfx2e3IKIwKTN5br3Mkp9qQAtkxa07uKFuJi.png",
//            "deliverable": {
//                "released": true
//            }
//        }';
//
//        $dummy_result = json_decode($dummy_result, true);
//
//        return new Collection($dummy_result);
//    }
//
//    public function dummy_lessons_search_result()
//    {
//        $dummy_result = '{
//            "id": "00d113b6-d622-4988-a676-b79e65013dad",
//            "title": "teste vimeo",
//            "slug": "testevimeo",
//            "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/vivBTOVIwk9UcuEeXLN4QqrvLdjfQfT0UXKPPRNU.png",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "00d113b6-d622-4988-a676-b79e65013dad",
//                    "to_total": 100,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "12379605-425e-4404-8045-95331486cdc7",
//            "title": "PAULO MUZY: DEUS, RELACIONAMENTO, PROBLEMAS E SAÚDE | PrimoCast 250 teste",
//            "slug": "PAULO MUZY: DEUS, RELACIONAMENTO, PROBLEMAS E SAÚDE | PrimoCast 250 teste",
//            "url_banner": "/images/default_lesson_cards/ciano-verde-escuro/ciano-verde-escuro_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "12379605-425e-4404-8045-95331486cdc7",
//                    "to_total": 0,
//                    "finished": 0
//                }
//            ]
//        },
//        {
//            "id": "24b5888b-98b2-498d-8f75-12b8eb2dd473",
//            "title": "teste material complementar",
//            "slug": "teste-material-complementar",
//            "url_banner": "/images/default_lesson_cards/violeta-escuro/violeta-escuro_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "24b5888b-98b2-498d-8f75-12b8eb2dd473",
//                    "to_total": 14,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "2fbbbe01-8e36-45cd-9229-205c3fbf2f6f",
//            "title": "teste 2 dia 09/02",
//            "slug": "teste-2-dia-0902",
//            "url_banner": "https://i.vimeocdn.com/video/1520285058-afed4dc1e819e2f40ccac0ef0569670295551d963ca91730a9b510a82be58345-d",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "2fbbbe01-8e36-45cd-9229-205c3fbf2f6f",
//                    "to_total": 20,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "478232f5-c773-4797-b29a-3875ef38aa5c",
//            "title": "teste 12/06",
//            "slug": "teste-1206",
//            "url_banner": "/images/default_lesson_cards/violeta-azul-escuro/violeta-azul-escuro_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "478232f5-c773-4797-b29a-3875ef38aa5c",
//                    "to_total": null,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "4a7e32ca-b3f5-493f-9a8a-4762401814af",
//            "title": "teste de upsell",
//            "slug": "teste-de-upsell",
//            "url_banner": "/images/default_lesson_cards/ciano-verde-escuro/ciano-verde-escuro_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "4a7e32ca-b3f5-493f-9a8a-4762401814af",
//                    "to_total": null,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "4f7d97b7-b266-4944-909c-8b2d62f1f87d",
//            "title": "teste 2 edit",
//            "slug": "teste-2-edit",
//            "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/Pvc3C0TzFXpyytKthGs4njXdae1B1IuwSS8V2gNP.png",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "4f7d97b7-b266-4944-909c-8b2d62f1f87d",
//                    "to_total": 22,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "51e310dc-5ad4-4d42-9dfc-6a783c019e40",
//            "title": "teste-qa-automatizado-aula-1",
//            "slug": "teste-qa-automatizado-aula-1",
//            "url_banner": "/images/default_lesson_cards/laranja/laranja_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": []
//        },
//        {
//            "id": "5bfba608-5472-4bc5-9b10-4c49607e7e48",
//            "title": "teste panda",
//            "slug": "teste-panda",
//            "url_banner": "https://b-vz-1ce7cc9c-289.tv.pandavideo.com.br/9a9bfab0-71c5-4a86-b95e-2450994d89af/thumbnail.jpg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "5bfba608-5472-4bc5-9b10-4c49607e7e48",
//                    "to_total": 100,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "5fd3619a-c850-4b98-8d0e-3ecef5016970",
//            "title": "teste",
//            "slug": "teste1173584341",
//            "url_banner": "https://i.vimeocdn.com/video/1520285058-afed4dc1e819e2f40ccac0ef0569670295551d963ca91730a9b510a82be58345-d",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "5fd3619a-c850-4b98-8d0e-3ecef5016970",
//                    "to_total": 100,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "62c1d02a-0f17-4144-9235-720d3792e4f3",
//            "title": "aula teste s/avaliação",
//            "slug": "aula-teste-savaliacao",
//            "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/aKkYgokwghuvKusN8kOgYnMfkAnEWVMLPvjYlIlJ.png",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": []
//        },
//        {
//            "id": "6345fc32-77fe-4106-91bb-031a15d2eda5",
//            "title": "teste",
//            "slug": "teste1366553079",
//            "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/rS1VycrsJrrbsQivUkdXMk29JmNotR3vYk1dM17i.jpg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "6345fc32-77fe-4106-91bb-031a15d2eda5",
//                    "to_total": 0,
//                    "finished": 0
//                }
//            ]
//        },
//        {
//            "id": "71e298d2-1b9b-4283-9b8f-fc2515c754db",
//            "title": "Teste edicao de aula",
//            "slug": "teste-edicao-de-aula",
//            "url_banner": "/images/default_lesson_cards/verde-escuro/verde-escuro_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": []
//        },
//        {
//            "id": "74ca5fdd-7676-4a84-8c1c-e89ec89647dc",
//            "title": "teste 2 - 12/12/2022",
//            "slug": "teste-2-12122022",
//            "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/banners/image_202210256358582d241db.png",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "74ca5fdd-7676-4a84-8c1c-e89ec89647dc",
//                    "to_total": 100,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "7906fbe5-f226-4589-93eb-3988a75d26af",
//            "title": "teste JMV",
//            "slug": "teste-jmv",
//            "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/JXrJS2nNVcfp7ek9JTta8IteQLoyWNJr0ZPI6ExU.png",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "7906fbe5-f226-4589-93eb-3988a75d26af",
//                    "to_total": 2,
//                    "finished": 0
//                }
//            ]
//        },
//        {
//            "id": "80bbcd12-d7c3-4950-99de-ba16c8ab496e",
//            "title": "Teste panda para cloudflare",
//            "slug": "teste-panda-para-cloudflare1039128602",
//            "url_banner": "https://b-vz-1ce7cc9c-289.tv.pandavideo.com.br/c97e2c6d-360d-483f-b291-f7f7e83f8bb2/thumbnail.jpg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "80bbcd12-d7c3-4950-99de-ba16c8ab496e",
//                    "to_total": 100,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "86e4729e-5d4d-4ba0-8a28-1f2adbdcae2e",
//            "title": "teste e criação de aula no curso do menino ney",
//            "slug": "teste-e-criacao-de-aula-no-curso-do-menino-ney",
//            "url_banner": "/images/default_lesson_cards/rosa/rosa_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "86e4729e-5d4d-4ba0-8a28-1f2adbdcae2e",
//                    "to_total": 27,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "89838ab2-07a4-401b-bcb4-8d6172469bdd",
//            "title": "teste com banner",
//            "slug": "teste-com-banner",
//            "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/JsaYeVYz2FkFY09Cm54S3npK8xitYZRhWuqguXPD.png",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "89838ab2-07a4-401b-bcb4-8d6172469bdd",
//                    "to_total": 100,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "9332ee87-1992-4fa4-8cc1-5ca75f9b7542",
//            "title": "Teste Panda video",
//            "slug": "teste-panda-video",
//            "url_banner": "https://b-vz-1ce7cc9c-289.tv.pandavideo.com.br/9a9bfab0-71c5-4a86-b95e-2450994d89af/thumbnail.jpg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "9332ee87-1992-4fa4-8cc1-5ca75f9b7542",
//                    "to_total": 100,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "960e9b07-79a0-4448-8b37-03020dbd5349",
//            "title": "Materias complementares teste",
//            "slug": "materias-complementares-teste",
//            "url_banner": "/images/default_lesson_cards/roxo/roxo_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "960e9b07-79a0-4448-8b37-03020dbd5349",
//                    "to_total": 0,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "9a4935b1-3e2b-4ee0-90db-b32905c87f74",
//            "title": "teste audio 1",
//            "slug": "teste-audio-1",
//            "url_banner": "/images/default_lesson_cards/ciano-verde-escuro/ciano-verde-escuro_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "9a4935b1-3e2b-4ee0-90db-b32905c87f74",
//                    "to_total": 18,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "9b525f05-a920-4f9b-8ad7-0e1286e295d8",
//            "title": "teste de edição 2.0",
//            "slug": "teste-de-edicao-20",
//            "url_banner": "/images/default_lesson_cards/roxo/roxo_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "9b525f05-a920-4f9b-8ad7-0e1286e295d8",
//                    "to_total": 0,
//                    "finished": 0
//                }
//            ]
//        },
//        {
//            "id": "b5dbbd78-6862-4a22-8cdf-fd566c822bb6",
//            "title": "Teste update nova aba",
//            "slug": "teste-update-nova-aba",
//            "url_banner": "https://i.vimeocdn.com/video/1571321347-b88a9c5c196d4b2ad3b39744eaf48622c08c83dd146088be4a4a0a1370ec3c6b-d",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "b5dbbd78-6862-4a22-8cdf-fd566c822bb6",
//                    "to_total": 100,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "b6d07a73-cf46-489e-b0b3-139f4417eb0f",
//            "title": "Teste JMV",
//            "slug": "teste-jmv1860222672",
//            "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/Qwa9wdiZ3Bx2xlghkOXXjFtrBIEsyZe7dumiOjWg.png",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "b6d07a73-cf46-489e-b0b3-139f4417eb0f",
//                    "to_total": 100,
//                    "finished": 1
//                },
//                {
//                    "class_id": "b6d07a73-cf46-489e-b0b3-139f4417eb0f",
//                    "to_total": 100,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "bb1f3465-1b3a-43c2-a441-a04915d045ba",
//            "title": "tester aula",
//            "slug": "tester-aula",
//            "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/banners/image_20220831630f9fa45345e.png",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "bb1f3465-1b3a-43c2-a441-a04915d045ba",
//                    "to_total": 6,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "bbc566ab-45e7-4351-9540-008a864a20a6",
//            "title": "teste material 9",
//            "slug": "teste-material-9",
//            "url_banner": "/images/default_lesson_cards/ciano/ciano_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": []
//        },
//        {
//            "id": "cd5ad972-19c2-4009-bed4-9e560f5d7340",
//            "title": "teste qa avaliação",
//            "slug": "teste-qa-avaliacao",
//            "url_banner": "/images/default_lesson_cards/laranja/laranja_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": []
//        },
//        {
//            "id": "cf15c2c3-f26b-4972-b4ae-61378e469ca9",
//            "title": "Teste Avaliação",
//            "slug": "teste-avaliacao",
//            "url_banner": "/images/default_lesson_cards/rosa/rosa_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": []
//        },
//        {
//            "id": "de1471d7-058c-4fea-b267-74d2ffac3705",
//            "title": "Teste cloudflare",
//            "slug": "teste-cloudflare1509691089",
//            "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/p3Pa6mtt0ILwHafXaezfwJN6TrmpuiJkz4sIEHE5.jpg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "de1471d7-058c-4fea-b267-74d2ffac3705",
//                    "to_total": 9,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "e6bd26b6-7a50-47f7-af4a-3f0f37090f3a",
//            "title": "teste aula concluida repetir quiz",
//            "slug": "teste-aula-concluida-repetir-quiz",
//            "url_banner": "/images/default_lesson_cards/vermelho-violeta/vermelho-violeta_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "e6bd26b6-7a50-47f7-af4a-3f0f37090f3a",
//                    "to_total": null,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "e9088c3a-1cbe-4230-b4f2-3bf470fed9eb",
//            "title": "teste panda",
//            "slug": "testepanda",
//            "url_banner": "https://b-vz-1ce7cc9c-289.tv.pandavideo.com.br/9a9bfab0-71c5-4a86-b95e-2450994d89af/thumbnail.jpg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "e9088c3a-1cbe-4230-b4f2-3bf470fed9eb",
//                    "to_total": 86,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "ea21c987-e874-436a-84dd-47b988b6d073",
//            "title": "teste de criação de aula",
//            "slug": "teste-de-criacao-de-aula",
//            "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/lEylfRKZQjsAAlImpiG4MqbnFsbhuuVwYWR679Ia.png",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "ea21c987-e874-436a-84dd-47b988b6d073",
//                    "to_total": null,
//                    "finished": 0
//                }
//            ]
//        },
//        {
//            "id": "f0fcc352-3201-40e3-a1fc-1224df4df9bd",
//            "title": "aula teste c/avaliação",
//            "slug": "aula-teste-cavaliacao",
//            "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/1PSOPeoDTBWVZtLAz6fSa1r7ftqysCtRB5GkSUu0.png",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": []
//        },
//        {
//            "id": "f117a990-dd9e-46c1-9ef8-eec3b77373fc",
//            "title": "Inicio - teste de edição de aula teste",
//            "slug": "inicio-teste-de-edicao-de-aula-teste",
//            "url_banner": "/images/default_lesson_cards/amarelo/amarelo_horizontal.svg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "f117a990-dd9e-46c1-9ef8-eec3b77373fc",
//                    "to_total": 19,
//                    "finished": 1
//                }
//            ]
//        },
//        {
//            "id": "fe20614f-bfae-434c-9510-9adafcdd345b",
//            "title": "Teste panda para cloudflare",
//            "slug": "teste-panda-para-cloudflare",
//            "url_banner": "https://customer-pm7noamzq17l4tgc.cloudflarestream.com/0922404f951ed8cb9caf7e3d3416cfcb/thumbnails/thumbnail.jpg",
//            "deliverable": {
//                "released": true
//            },
//            "user_history": [
//                {
//                    "class_id": "fe20614f-bfae-434c-9510-9adafcdd345b",
//                    "to_total": null,
//                    "finished": 1
//                }
//            ]
//        }';
//
//        $dummy_result = json_decode($dummy_result, true);
//
//        return new Collection($dummy_result);
//    }
//
//    public function dummy_null_lessons_search_result()
//    {
//        return 'Nenhum resultado encontrado';
//    }
//
//    public function dummy_null_modules_search_result()
//    {
//        return 'Nenhum resultado encontrado';
//    }
//
//    public function dummy_null_courses_search_result()
//    {
//        return 'Nenhum resultado encontrado';
//    }
//}
