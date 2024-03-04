<?php
//
//namespace Tests\Unit\Domain\Lesson\Operations;
//
//use Domain\Lesson\Data\LessonFavoritesDTO;
//use Domain\Lesson\Operations\GetFavoriteLessonsOperation;
//use Domain\User\Interfaces\UserRepositoryInterface;
//use Illuminate\Database\Eloquent\Collection;
//use Tests\TestCase;
//
//class GetLessonFavoritesOperationTest extends TestCase
//{
//    private $tenant_id = '127';
//
//    private $user_id = 'fe6e6f74-b16e-410c-b999-525872049e9a'; // Kratos
//
//    /** @test */
//    public function this_return_expected_result_of_favorites(): void
//    {
//        $expected_result = $this->dummy_result();
//
//        $favoritesDTO = LessonFavoritesDTO::from([
//            'tenant_id' => $this->tenant_id,
//            'user_id' => $this->user_id,
//        ]);
//
//        $columns = ['class_id', 'user_id', 'module_id'];
//
//        $relations = [
//            'course' => function ($query) {
//                $query->select('ead_courses.title');
//            },
//            'favoriteLesson' => function ($query) {
//                $query->select('id', 'title', 'slug', 'url_banner', 'host', 'url_external');
//            },
//            'favoriteHistory' => function ($query) use ($favoritesDTO) {
//                $query->select('class_id', 'to_total', 'time')
//                    ->where('user_id', '=', $favoritesDTO->user_id);
//            },
//        ];
//
//        $mock = $this->createMock(UserRepositoryInterface::class);
//        $mock->expects($this->exactly(1))
//            ->method('getFavoriteLessons')
//            ->with($this->user_id, $columns, $relations)
//            ->willReturn($expected_result);
//
//        $operation = new GetFavoriteLessonsOperation($mock);
//
//        $response = $operation->execute($favoritesDTO->user_id, $columns, $relations);
//
//        $this->assertEquals($expected_result, $response);
//    }
//
//    public function dummy_result()
//    {
//        $result = '
//        [
//            {
//                "class_id": "333037f2-ba95-484a-aab7-2e3e4b64505d",
//                "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                "module_id": "260c0f55-2ecd-48cb-959b-b140141aca76",
//                "id": "333037f2-ba95-484a-aab7-2e3e4b64505d",
//                "title": "aula 3 desbloqueada",
//                "slug": "aula 3 desbloqueada",
//                "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/banners/image_2022090663175d8f30550.png",
//                "host": "youtube",
//                "url_external": null,
//                "favorite": true,
//                "pivot": {
//                    "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                    "class_id": "333037f2-ba95-484a-aab7-2e3e4b64505d"
//                },
//                "course": {
//                    "id": "14a25d8b-3a2a-47a4-b434-b6e0516b7562",
//                    "title": "Como matar deuses 2 - edit"
//                },
//                "user_history": [
//                    {
//                        "class_id": "333037f2-ba95-484a-aab7-2e3e4b64505d",
//                        "to_total": 2,
//                        "time": "00:00:20"
//                    }
//                ]
//            },
//            {
//                "class_id": "a333c1cd-9766-4c14-ac60-d8887bf211aa",
//                "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                "module_id": "7d1d7329-5f33-4f0c-ab3c-3023e260525a",
//                "id": "a333c1cd-9766-4c14-ac60-d8887bf211aa",
//                "title": "aula horizontal",
//                "slug": "aula-horizontal",
//                "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/banners/image_2022121263977999714c2.png",
//                "host": "youtube",
//                "url_external": null,
//                "favorite": true,
//                "pivot": {
//                    "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                    "class_id": "a333c1cd-9766-4c14-ac60-d8887bf211aa"
//                },
//                "course": {
//                    "id": "14a25d8b-3a2a-47a4-b434-b6e0516b7562",
//                    "title": "Como matar deuses 2 - edit"
//                },
//                "user_history": [
//                    {
//                        "class_id": "a333c1cd-9766-4c14-ac60-d8887bf211aa",
//                        "to_total": 33,
//                        "time": "00:06:32"
//                    }
//                ]
//            },
//            {
//                "class_id": "4213b1c7-42f5-42f0-9fa2-b27dfef65d63",
//                "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                "module_id": "7d1d7329-5f33-4f0c-ab3c-3023e260525a",
//                "id": "4213b1c7-42f5-42f0-9fa2-b27dfef65d63",
//                "title": "aula com link externo",
//                "slug": "aula-com-link-externo",
//                "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/banners/image_202212126397780c0cdd6.png",
//                "host": "text",
//                "url_external": null,
//                "favorite": true,
//                "pivot": {
//                    "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                    "class_id": "4213b1c7-42f5-42f0-9fa2-b27dfef65d63"
//                },
//                "course": {
//                    "id": "14a25d8b-3a2a-47a4-b434-b6e0516b7562",
//                    "title": "Como matar deuses 2 - edit"
//                },
//                "user_history": [
//                    {
//                        "class_id": "4213b1c7-42f5-42f0-9fa2-b27dfef65d63",
//                        "to_total": null,
//                        "time": null
//                    }
//                ]
//            },
//            {
//                "class_id": "80bbcd12-d7c3-4950-99de-ba16c8ab496e",
//                "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                "module_id": "2cc0e5a0-1378-4581-b9b1-e3c1cdb82be9",
//                "id": "80bbcd12-d7c3-4950-99de-ba16c8ab496e",
//                "title": "Teste panda para cloudflare",
//                "slug": "teste-panda-para-cloudflare1039128602",
//                "url_banner": "https://b-vz-1ce7cc9c-289.tv.pandavideo.com.br/c97e2c6d-360d-483f-b291-f7f7e83f8bb2/thumbnail.jpg",
//                "host": "panda_video",
//                "url_external": null,
//                "favorite": true,
//                "pivot": {
//                    "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                    "class_id": "80bbcd12-d7c3-4950-99de-ba16c8ab496e"
//                },
//                "course": {
//                    "id": "2860f961-a6d7-4791-8ac0-f2fde6f9328e",
//                    "title": "Kulve taroth"
//                },
//                "user_history": [
//                    {
//                        "class_id": "80bbcd12-d7c3-4950-99de-ba16c8ab496e",
//                        "to_total": 100,
//                        "time": "00:00:37"
//                    }
//                ]
//            },
//            {
//                "class_id": "9a4935b1-3e2b-4ee0-90db-b32905c87f74",
//                "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                "module_id": "e12cdc52-240d-4328-b878-e81f681c6036",
//                "id": "9a4935b1-3e2b-4ee0-90db-b32905c87f74",
//                "title": "teste audio 1",
//                "slug": "teste-audio-1",
//                "url_banner": "/images/default_lesson_cards/ciano-verde-escuro/ciano-verde-escuro_horizontal.svg",
//                "host": "youtube",
//                "url_external": null,
//                "favorite": true,
//                "pivot": {
//                    "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                    "class_id": "9a4935b1-3e2b-4ee0-90db-b32905c87f74"
//                },
//                "course": {
//                    "id": "14a25d8b-3a2a-47a4-b434-b6e0516b7562",
//                    "title": "Como matar deuses 2 - edit"
//                },
//                "user_history": [
//                    {
//                        "class_id": "9a4935b1-3e2b-4ee0-90db-b32905c87f74",
//                        "to_total": 18,
//                        "time": "00:03:29"
//                    }
//                ]
//            },
//            {
//                "class_id": "4e6e252f-a595-436e-9716-8191f132d5a3",
//                "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                "module_id": "260c0f55-2ecd-48cb-959b-b140141aca76",
//                "id": "4e6e252f-a595-436e-9716-8191f132d5a3",
//                "title": "Kauan Pereira",
//                "slug": "kauan-pereira",
//                "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/banners/image_20220830630ea01e4efba.png",
//                "host": "vimeo",
//                "url_external": null,
//                "favorite": true,
//                "pivot": {
//                    "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                    "class_id": "4e6e252f-a595-436e-9716-8191f132d5a3"
//                },
//                "course": {
//                    "id": "14a25d8b-3a2a-47a4-b434-b6e0516b7562",
//                    "title": "Como matar deuses 2 - edit"
//                },
//                "user_history": [
//                    {
//                        "class_id": "4e6e252f-a595-436e-9716-8191f132d5a3",
//                        "to_total": 46,
//                        "time": "00:00:38"
//                    }
//                ]
//            },
//            {
//                "class_id": "c79f916e-27cc-43be-b4e5-f78ab6c07a09",
//                "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                "module_id": "18b29a4f-4591-42ce-9173-c3e2a9daf748",
//                "id": "c79f916e-27cc-43be-b4e5-f78ab6c07a09",
//                "title": "Parte 1",
//                "slug": "parte-11247883904",
//                "url_banner": "/images/default_lesson_cards/verde-escuro/verde-escuro_horizontal.svg",
//                "host": "youtube",
//                "url_external": null,
//                "favorite": true,
//                "pivot": {
//                    "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                    "class_id": "c79f916e-27cc-43be-b4e5-f78ab6c07a09"
//                },
//                "course": {
//                    "id": "dfb70e69-37c4-4f14-a3b1-8450a1f9c167",
//                    "title": "Hollow Knight"
//                },
//                "user_history": [
//                    {
//                        "class_id": "c79f916e-27cc-43be-b4e5-f78ab6c07a09",
//                        "to_total": 0,
//                        "time": "00:00:11"
//                    }
//                ]
//            },
//            {
//                "class_id": "a7013c82-98d8-4cde-a97c-d729c48b1f13",
//                "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                "module_id": "71f0feea-a938-41fe-bb1a-fee812ded247",
//                "id": "a7013c82-98d8-4cde-a97c-d729c48b1f13",
//                "title": "aula do tipo avaliação",
//                "slug": "aula-do-tipo-avaliacao281918554",
//                "url_banner": "/images/default_lesson_cards/verde-lima/verde-lima_horizontal.svg",
//                "host": "videojs",
//                "url_external": null,
//                "favorite": true,
//                "pivot": {
//                    "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                    "class_id": "a7013c82-98d8-4cde-a97c-d729c48b1f13"
//                },
//                "course": {
//                    "id": "dfb70e69-37c4-4f14-a3b1-8450a1f9c167",
//                    "title": "Hollow Knight"
//                },
//                "user_history": [
//                    {
//                        "class_id": "a7013c82-98d8-4cde-a97c-d729c48b1f13",
//                        "to_total": null,
//                        "time": null
//                    }
//                ]
//            },
//            {
//                "class_id": "20304c71-c894-4b84-804d-559b43eab32e",
//                "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                "module_id": "71f0feea-a938-41fe-bb1a-fee812ded247",
//                "id": "20304c71-c894-4b84-804d-559b43eab32e",
//                "title": "Parte 3",
//                "slug": "parte-3",
//                "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/sI4nRhZuzTF121jVdKzNIpcculkuwChS7j5zqkyB.png",
//                "host": "youtube",
//                "url_external": null,
//                "favorite": true,
//                "pivot": {
//                    "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                    "class_id": "20304c71-c894-4b84-804d-559b43eab32e"
//                },
//                "course": {
//                    "id": "dfb70e69-37c4-4f14-a3b1-8450a1f9c167",
//                    "title": "Hollow Knight"
//                },
//                "user_history": [
//                    {
//                        "class_id": "20304c71-c894-4b84-804d-559b43eab32e",
//                        "to_total": 1,
//                        "time": "00:00:06"
//                    }
//                ]
//            },
//            {
//                "class_id": "7906fbe5-f226-4589-93eb-3988a75d26af",
//                "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                "module_id": "e12cdc52-240d-4328-b878-e81f681c6036",
//                "id": "7906fbe5-f226-4589-93eb-3988a75d26af",
//                "title": "teste JMV",
//                "slug": "teste-jmv",
//                "url_banner": "https://d2ik51dz9s180r.cloudfront.net/images/JXrJS2nNVcfp7ek9JTta8IteQLoyWNJr0ZPI6ExU.png",
//                "host": "jmvstream",
//                "url_external": null,
//                "favorite": true,
//                "pivot": {
//                    "user_id": "fe6e6f74-b16e-410c-b999-525872049e9a",
//                    "class_id": "7906fbe5-f226-4589-93eb-3988a75d26af"
//                },
//                "course": {
//                    "id": "14a25d8b-3a2a-47a4-b434-b6e0516b7562",
//                    "title": "Como matar deuses 2 - edit"
//                },
//                "user_history": [
//                    {
//                        "class_id": "7906fbe5-f226-4589-93eb-3988a75d26af",
//                        "to_total": 3,
//                        "time": "00:00:10"
//                    }
//                ]
//            }
//        ]';
//
//        return new Collection(json_decode($result, true));
//    }
//}
