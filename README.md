<div style="text-align: center">
    <a href="https://site.themembers.com.br/" target="_blank">
        <img src="https://cdn.greatsoftwares.com.br/arquivos/paginas_editor/3768-f0ac8155e7ba585692d2963314289494.png" width="400" alt="Logo The Members">
    </a>
</div>

## Índice

- [Configuração Inicial](#configuração-inicial)
- [Configurações Adicionais](#configurações-adicionais)
    - [Hostname](#hostname)
    - [Pint](#pint)
    - [Swagger](#swagger)
    - [Laravel Ide Helper](#laravel-ide-helper)
        - [Geração do Arquivo Helper](#geração-do-arquivo-helper)
        - [Modelos Eloquent](#modelos-eloquent)
        - [Phpstorm Metadata](#phpstorm-metadata)
        - [Mantendo Atualizado](#mantendo-atualizado)

# Execução em ambiente local
## Configuração Inicial

Para realizar a configuração inicial do projeto siga os passos abaixo e faça as configurações adicionais.

**_Obs.:_**  É recomendado utilizar o PhpStorm em conjunto com o plugin "Laravel Idea" para melhorar a experiência de
desenvolvimento.

### Copie e configure o arquivo .env a partir do .env.example
```shell
cp .env.example .env
```

### Instalando o Composer e Laravel Sail
```shell
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v $(pwd):/var/www/html \
    -w /var/www/html \
    laravelsail/php82-composer:latest \
    composer install --ignore-platform-reqs
```

### Iniciar todos os containers
*Se necessário, esse comando também irá realizar o build da aplicação.*
```shell
./vendor/bin/sail up -d
```

### Acesse a aplicação a partir do localhost: [http://localhost](http://localhost)

### Outros comandos úteis:

#### Desligar todos os containers
```shell
./vendor/bin/sail down
```

#### Listar todos os comandos disponíveis:
```bash
./vendor/bin/sail
```

#### Listar todos os comandos do Artisan disponíveis:
```bash
./vendor/bin/sail artisan
```

#### Executar testes
```bash
./vendor/bin/sail test
```

### [Configurar sail como alias: sail](https://laravel.com/docs/10.x/sail#configuring-a-shell-alias)
### [Documentação completa do Laravel Sail](https://laravel.com/docs/10.x/sail)

## Configurações Adicionais

### Hostname

- Adicionar no arquivo hosts as configurações de redirecionamento de 127.0.0.1 para themembers.test
    - Linux: `/etc/hosts`
        - `echo -e "\n#The Members\n127.0.0.1 themembers.test" | sudo tee -a /etc/hosts`
        - Windows: `C:\Windows\System32\drivers\etc\hosts`
- Acesse a aplicação a partir do hostname:
    - [http://themembers.test](http://themembers.test)

### Pint

[Pint](https://github.com/laravel/pint) é um formatador de código para PHP, temos um git hook para formatar o código
antes de commitar

- Execute `git config core.hooksPath .githooks` uma única vez para ativar o hook

### Swagger

- `php artisan vendor:publish` Deve escolher o provider do Swagger e continuar.
- adicionar no .env `L5_SWAGGER_GENERATE_ALWAYS=true`
- Usar a rota /api/doc
- Documentação util sobre o uso do Swagger: `https://zircote.github.io/swagger-php/guide/cookbook.html`

### Laravel Ide Helper

O [Laravel Ide Helper](https://github.com/barryvdh/laravel-ide-helper) é uma ferramenta útil para melhorar a
inteligência de código (code intelligence) em IDEs, como o PhpStorm, relacionado ao uso do Laravel Framework.

Este pacote permite a geração automática de PHPDocs para macros e mixins, que serão adicionados ao
arquivo `_ide_helper.php`.
No entanto, é importante observar que isso só funciona se você utilizar "type hinting" ao declarar uma macro. Em outras
palavras, ao declarar uma macro, você precisa especificar o tipo de retorno dos métodos usando "type hinting", para que
o pacote possa gerar corretamente as PHPDocs correspondentes. Essa prática permite que o PhpStorm compreenda o tipo de
objeto retornado pela macro e forneça sugestões precisas de código e autocompletar.

Abaixo está um exemplo de código presente no arquivo `ResponseMacroServiceProvider`. Este arquivo contém macros
personalizadas para gerar respostas HTTP em um projeto Laravel.

```php
Response::macro('badRequest', function (string $message, string $error = 'Bad Requests', int $statusCode = ResponseEnum::HTTP_BAD_REQUEST): JsonResponse {
    $response = [
        'message' => $message,
        'error' => $error,
    ];

    return Response::json($response, $statusCode);
});
```

**_Obs.:_** Neste projeto, o pacote já está instalado e com uma configuração padrão. Portanto, basta apenas executar os
comandos do pacote para a geração dos metadados.

#### Geração do arquivo Helper

Utilize o comando Artisan para isso:

```bash
php artisan ide-helper:generate
```

O comando acima criará um arquivo _ide_helper.php na raiz do seu projeto, contendo informações adicionais sobre as
classes do Laravel, permitindo que a IDE compreenda melhor o código e forneça recursos adicionais de autocompletar e
navegação.

#### Modelos Eloquent

Para aprimorar ainda mais o suporte a IDE em relação aos modelos Eloquent, basta executar o seguinte comando:

**_Obs.:_** O seguinte comando apresentará erro pois alguns Model's do projeto estão quebrados. **Por enquanto não
utilize este comando.**

~~`php artisan ide-helper:models`~~

Esse comando gerará anotações PHPDoc nos modelos Eloquent, melhorando a inteligência de código e fornecendo informações
mais detalhadas sobre os relacionamentos, atributos e métodos disponíveis.

#### Phpstorm Metadata

Se você estiver usando o Phpstorm, é recomendável executar o comando:

```bash
php artisan ide-helper:meta
```

É possível gerar um arquivo meta do PhpStorm para adicionar suporte ao padrão de design Factory.

Para o Laravel, isso significa que podemos fazer com que o PhpStorm entenda que tipo de objeto estamos resolvendo
do [IoC Container](https://laravel.com/docs/10.x/container).
Por exemplo, eventos retornarão um objeto Illuminate\Events\Dispatcher, então, com o arquivo meta, você pode chamar
app('events') e ele completará automaticamente os métodos do Dispatcher.

#### Mantendo Atualizado

É importante lembrar que, se você adicionar ou remover classes no seu projeto Laravel, é necessário atualizar o arquivo
de helper.
Execute novamente os comandos `php artisan ide-helper:generate`, `php artisan ide-helper:models`
e `php artisan ide-helper:meta` conforme necessário para refletir as alterações.
Além algumas atualizações serão realizadas automaticamente ao executar um composer update dentro do container.

Para maiores informações sobre o Laravel Ide Helper e outras funcionalidades, consulte a documentação oficial no
repositório do [Laravel Ide Helper](https://github.com/barryvdh/laravel-ide-helper).

<!--
Fazer Seção "Sobre o Projeto"
- Explicar padrões de projeto utilizados
    - DDD
    - UseCases e Operations
    - Repository Pattern
    - DTO
    - Events (Laravel)
-->
