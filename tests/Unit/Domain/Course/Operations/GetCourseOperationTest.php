<?php

namespace Tests\Unit\Domain\Course\Operations;

use Domain\Course\Data\CourseDTO;
use Domain\Course\Interfaces\CourseRepositoryInterface;
use Domain\Course\Models\Course;
use Domain\Course\Operation\GetCourseOperation;
use Tests\TestCase;

class GetCourseOperationTest extends TestCase
{
    private $dummyCourseId = 'ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c';

    private $dummyTenantId = '127';

    /**
     * Testa a operation da domain getCourse
     *
     * @test
     */
    public function course_operation_is_working(): void
    {
        $expected_result = $this->dummy_course_result();

        $dto = CourseDTO::from([
            'tenant_id' => $this->dummyTenantId,
            'id' => $this->dummyCourseId,
        ]);

        $columns = ['id', 'url_cover_retangulo', 'url_cover_vertical', 'title', 'desc', 'certificado_publich', 'certificado_progress', 'view_mode'];
        $relations = ['modules:id,slug,url_cover_vertical,title,description,course_id,published'];

        $courseRepositoryInterface = $this->createMock(CourseRepositoryInterface::class);
        $courseRepositoryInterface->expects($this->exactly(1))
            ->method('getCourseByCourseIdAndTenantId')
            ->with($this->dummyCourseId, $this->dummyTenantId, $columns, $relations)
            ->willReturn($expected_result);

        $operation = new GetCourseOperation($courseRepositoryInterface);

        $response = $operation->execute($dto, $columns, $relations);

        $this->assertSame($expected_result, $response);
    }

    public function dummy_course_result(): Course
    {
        $dummy_result = '{
            "id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
            "url_cover_retangulo": "https://d2ik51dz9s180r.cloudfront.net/images/T8YNDwXN4NrbYWAY3VoxgJs80aY5pRmZjTyKnLSc.jpg",
            "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/X1wBQ0TZKheODBPvApku7SrKlCzBxQktYrzYoJqQ.jpg",
            "title": "Mentoria Pílula Milionária",
            "desc": "Mentoria Pílula Milionária",
            "certificado_publich": null,
            "certificado_progress": null,
            "view_mode": "normal",
            "deliverable": {
                "released": true
            },
            "modules": [
                {
                    "id": "5c796b60-4b56-4208-8b46-f9cec0ed9d2e",
                    "slug": "aviso-importante-srZUr",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/IRZTqklMgkTs8vQxQTz8ZcC50TIkylcbHChVX75u.png",
                    "title": "AVISO IMPORTANTE",
                    "description": "AVISO IMPORTANTE",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "34b3e798-749f-4b4b-be7f-13d66c39c9c9",
                    "slug": "boas-vindas",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/W7vim420DkVbHTiG5o4vUYzpztLFT5qTieTPAm3m.jpg",
                    "title": "BOAS VINDAS",
                    "description": "Seja bem-vindo à mentoria!",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "8638be18-face-4f77-90c1-7d0d08d40900",
                    "slug": "proximas-aulas",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/n4oBQqAnWXm9kPpm9KW3WN2PTE9Q7ERdVdykxLuu.jpg",
                    "title": "PRÓXIMAS AULAS",
                    "description": "As próximas aulas ao vivo",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "a055cf4e-05c4-4659-9e46-5904fbe5157f",
                    "slug": "contrato-GofS7",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/XHuJE9S8OlfuasJS1fgnT76KnCpMmKOlPnazS2Pw.png",
                    "title": "Contrato",
                    "description": "Veja o contrato aqui",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "ca9ea6cf-ad7f-4eff-85d4-40cddfa20965",
                    "slug": "levantando-caixa",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/hi45WqtBDR8eINgrqgMKmebFdD4VtGzRtSZ4hgiN.jpg",
                    "title": "LEVANTANDO CAIXA",
                    "description": "Aprendendo a levantar caixa, rapidamente.",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "38e48008-69e3-4ffb-8cdc-fbc073105cae",
                    "slug": "criacao-de-plr-etapa-1-conceitos-do-plr",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/H8devrA3zbjRNDvBpidTEJpAXkAENbrtESuD8mVI.jpg",
                    "title": "Criação de PLR - Etapa 1 - Conceitos do PLR",
                    "description": "Etapa 1 do módulo de Criação de PLR",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "d2567ed3-77f1-4dfe-9a17-087eaede620d",
                    "slug": "NETWORKING SELF-MADE",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/I53HtIc3xbenBwrUNp7p8XTjPnSMCoJ3cw0sTBaN.jpg",
                    "title": "NETWORKING SELF-MADE",
                    "description": "O Networking dos Self-mades!",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "acc75e54-c2b3-4e2c-ace5-7cc6095deb98",
                    "slug": "aulas-ao-vivo",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/zfTBqNwV2SvdSByKJcBMyT88gvr63tl6TK5QRkOe.jpg",
                    "title": "AULAS AO-VIVO!",
                    "description": "Entendendo as aulas ao vivo!",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "440721ab-8e49-4332-941e-880b87eb08b6",
                    "slug": "mindset-self-made",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/tAEdOhMC7DTiys8LG6cxD3gpaZnpml7lAId1Ta9g.jpg",
                    "title": "MINDSET SELF-MADE",
                    "description": "Se tornando um Self-made",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "24e475ac-4213-4b2b-87d8-6aeeaa9d0be7",
                    "slug": "criacao-de-plr-etapa-2-criacao-da-oferta-do-seu-plr",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/yWX2jowBdyt0KDkbVr3S7uy7GbisqLpzLzH0lJ5M.jpg",
                    "title": "Criação de PLR - Etapa 2 - Criação da oferta do seu PLR",
                    "description": "Criação de PLR - Etapa 2 - Criação da oferta do seu PLR",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "32c94c89-dd8f-430f-9dd9-b3b450916603",
                    "slug": "criacao-de-plr-etapa-3-escrevendo-sua-primeira-vsl",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/8sGFYaqSYr4roahCTTfVV8SX2BCZO1PJQw4gLixO.jpg",
                    "title": "Criação de PLR - Etapa 3 - Escrevendo sua primeira VSL",
                    "description": "Criação de PLR - Etapa 3 - Escrevendo sua primeira VSL",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "beb5a828-539f-4c54-8951-25b48c6fea12",
                    "slug": "criacao-de-plr-etapa-4-criacao-do-conteudo-do-seu-plr",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/ino5tnzkR5N6hKPgucYwVdI17XGaldWF8GFJdQ1H.jpg",
                    "title": "Criação de PLR - Etapa 4 - Criação do conteúdo do seu PLR",
                    "description": "Criação de todo o entregavel do seu produto",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "cc0bf95b-eb3e-4787-bce5-fefeb2095d59",
                    "slug": "copywriting",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/BticFDZ27zl1jFJRPn6veTD1n5fWFl4ehRkKWjKI.jpg",
                    "title": "Copywriting",
                    "description": "Copywriting",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "185d8f6e-7a07-4dae-a20e-d2855e48493f",
                    "slug": "contingencia-no-facebook",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/FWx9OBbJKqKp4DUxHgjzAkZHaVPuyKzXxq4oaVCt.jpg",
                    "title": "Contingência no Facebook",
                    "description": "Contingência no Facebook",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "4c68826f-808e-4aa6-9c1a-d475ee61d763",
                    "slug": "estrutura-descomplicada",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/d1c1e0RwiD85ECwnJuVKMPEZsViYruzlqZr7ZRCM.jpg",
                    "title": "Estrutura Descomplicada",
                    "description": "Estrutura Descomplicada",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "eccba5e3-7410-4085-8bc0-a2889f862128",
                    "slug": "criacao-e-espionagem-de-anuncios",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/U2433NAYXWZaE9yKwNouLLXo1J25Kxq5ozqjXFW5.jpg",
                    "title": "Criação e Espionagem de Anúncios",
                    "description": "Criação e Espionagem de Anúncios",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "d3cf251a-a475-4d70-8dfc-ca22119f8e5b",
                    "slug": "criacao-de-plr-etapa-5-configuracoes-do-seu-plr",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/1DHjeVX9fWJqzrnsP8O2hx2xqovDqcJ34a9cwLhg.jpg",
                    "title": "Criação de PLR - Etapa 5 - Configurações do seu PLR",
                    "description": "Criação de PLR - Etapa 5 - Configurações do seu PLR",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "d3946907-f671-40be-bf76-71cb1fe048a5",
                    "slug": "facebook-ads",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/zF1s2khy6tNHpPmPpEv0XEeaaFMrTkdvGXvQ4TTg.jpg",
                    "title": "Facebook Ads",
                    "description": "Facebook Ads",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "3dcb8467-1b9b-4c11-aad6-2e19cd7a9123",
                    "slug": "criacao-de-plr-etapa-6-revisao-da-estrutura",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/lu7BSBtUosubUlJqiHpsOSZ1vGqDfkXBjzUvmkAm.jpg",
                    "title": "Criação de PLR - Etapa 6 - Revisão da Estrutura",
                    "description": "Criação de PLR - Etapa 6 - Revisão da Estrutura",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "43aaa731-716c-4ea7-b5df-b9c1bc86150e",
                    "slug": "duvidas-trafego-local",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/JZc9jR0KC6E4CC1v6nHtfXe20DxjVpiMENNyvpTB.jpg",
                    "title": "Dúvidas Tráfego Local",
                    "description": "Dúvidas Tráfego Local",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "b921f54f-2fba-44e7-9b46-871467280010",
                    "slug": "duvidas-facebook-ads",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/jpUXB7YKXK0b710yl3cVH3fgxypirXr2vca9ljLr.jpg",
                    "title": "Dúvidas Facebook Ads",
                    "description": "Dúvidas Facebook Ads",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "7299f561-4aba-47e9-9a93-52a67fda42e3",
                    "slug": "duvidas-copywriting",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/cEWF0NFPFpYWA3XqVCiHZ5VdpIauJthBMpKaCqFe.jpg",
                    "title": "Dúvidas - Copywriting",
                    "description": "Dúvidas - Copywriting",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "95728066-064d-4bad-98d1-01fd7553e2d1",
                    "slug": "duvidas-youtube-ads",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/dmFmDOgCjb8ULMwa3pn52mK6ftlyffm7lqSfCX1N.jpg",
                    "title": "Dúvidas - Youtube Ads",
                    "description": "Dúvidas - Youtube Ads",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "c810d712-5b48-4d69-bce2-7b8bb877ef9b",
                    "slug": "duvidas-contingencia",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/KpureiKB3daf2hkRoR7AjH4AA3bikHfoLKLXUkxK.jpg",
                    "title": "Dúvidas - Contingência",
                    "description": "Dúvidas - Contingência",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "39d54fe8-3cdb-4914-a73c-b44382f0166d",
                    "slug": "duvidas-estrutura",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/4aw5m9J4kBkuWP2pDRvWW8ox4pQrtQKjDPFtWde5.jpg",
                    "title": "Dúvidas - Estrutura",
                    "description": "Dúvidas - Estrutura",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "676a8d7e-a601-4ecb-ad34-4f63b656dd7c",
                    "slug": "duvidas-ofertas",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/Vwfm2xm9zyC8P7Ok6DmpVot0nsusr8boRU5EWbY5.jpg",
                    "title": "Dúvidas - Ofertas",
                    "description": "Dúvidas - Ofertas",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "a832fdfc-bf3d-46c2-895f-fd461223a09a",
                    "slug": "bonus-01-100-plrs-traduzidos",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/91HG26hLc77Kz4gTa7OCWI1wD9HmQ0XfVo9KSrzg.jpg",
                    "title": "BÔNUS 01 - 100 PLRs traduzidos",
                    "description": "BÔNUS 01 - 100 PLRs traduzidos",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "595a93da-27a2-4cbe-9db1-c96881205d60",
                    "slug": "bonus-02-15-nichos-inexplorados",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/g5Bm3LturBgJU4sk8LlLisJFUywMdOfmAkabEq9f.jpg",
                    "title": "BÔNUS 02 - 15 Nichos inexplorados",
                    "description": "BÔNUS 02 - 15 Nichos inexplorados",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "2cf5dd89-0154-41e1-a8a8-de358a05536e",
                    "slug": "bonus-03-youtube-ads",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/MMi9oHxRChkDeysx1eSTDahNm4C3OskxUWVFyrS9.jpg",
                    "title": "BÔNUS 03 - Youtube Ads",
                    "description": "BÔNUS 03 - Youtube Ads",
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "ef3800dc-6e25-45c5-9d20-d80e58d38e48",
                    "slug": "bonus-04-foruns-russos-f0EoE",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/HJQz5hCotqI6Zz8HHcpH1heUfLseKnKK1djVlTU1.png",
                    "title": "BÔNUS 04 - FÓRUNS RUSSOS",
                    "description": null,
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                },
                {
                    "id": "838ec243-a878-4e88-b213-cf74b31e8fd2",
                    "slug": "bonus-05-livros-traduzidos-xIOtJ",
                    "url_cover_vertical": "https://d2ik51dz9s180r.cloudfront.net/images/k7b4FXCbXsDyGLL3XtMn4Ix8ODfsNmCcBiD6sqCr.png",
                    "title": "BÔNUS 05 - Livros Traduzidos",
                    "description": null,
                    "course_id": "ef9cd2c0-86ac-47e8-9fd5-dab1987b4b0c",
                    "published": "active",
                    "deliverable": {
                        "released": true
                    }
                }
            ]
        }';

        $dummy_result = json_decode($dummy_result, true);

        return new Course($dummy_result);
    }
}
