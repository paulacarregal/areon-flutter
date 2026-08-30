# 🔧 Backend Spring Boot — AEON

O backend do AEON foi desenvolvido utilizando **Java e Spring Boot**, seguindo uma arquitetura REST para disponibilizar dados estruturados à aplicação e ao dashboard administrativo.

A solução utiliza integração com **Firebase**, persistência de dados, operações CRUD, mecanismos de segurança e documentação através do Swagger/OpenAPI.

---

# 1. Objetivo

O backend tem como objetivo centralizar o acesso e gerenciamento dos dados utilizados pela plataforma AEON.

Entre suas principais responsabilidades estão:

* Disponibilizar uma API REST;
* Gerenciar usuários;
* Gerenciar perfis profissionais;
* Executar operações CRUD;
* Integrar serviços externos;
* Persistir dados;
* Validar informações recebidas;
* Tratar erros;
* Controlar acesso;
* Disponibilizar documentação interativa da API.

---

# 2. Tecnologias

| Tecnologia              | Utilização                     |
| ----------------------- | ------------------------------ |
| Java 17                 | Linguagem principal            |
| Spring Boot             | Framework principal            |
| Spring MVC              | Desenvolvimento da API REST    |
| Spring Data JPA         | Persistência                   |
| Hibernate               | ORM                            |
| MySQL                   | Banco de dados                 |
| Spring Security         | Segurança e controle de acesso |
| Firebase Admin SDK      | Integração com Firebase        |
| Firebase Authentication | Autenticação dos usuários      |
| Swagger / OpenAPI       | Documentação da API            |
| Maven                   | Gerenciamento de dependências  |
| Render                  | Hospedagem                     |

---

# 3. Arquitetura

O backend segue uma separação por responsabilidades:

```text
Controller
    │
    ▼
Service
    │
    ▼
Repository
    │
    ▼
Database
```

Além disso, a integração com Firebase é realizada através da configuração específica do projeto:

```text
Spring Boot
    │
    ├── Firebase Admin SDK
    │       └── Firebase
    │
    └── Spring Data JPA
            └── MySQL
```

Essa organização permite separar as responsabilidades da aplicação e facilitar a manutenção e evolução do sistema.

---

# 4. Estrutura

A estrutura principal do backend é organizada da seguinte forma:

```text
src/
└── main/
    └── java/
        └── com/
            └── aeon/
                └── backend/
                    ├── config/
                    ├── controller/
                    ├── model/
                    ├── repository/
                    └── service/
```

### `config`

Contém configurações necessárias para a inicialização dos serviços utilizados pela aplicação.

Um dos principais componentes é:

```text
FirebaseConfig.java
```

Responsável pela inicialização da integração com o Firebase Admin SDK.

### `controller`

Contém os endpoints REST disponibilizados pela aplicação.

Exemplos:

```text
UserController.java
ProfessionalProfileController.java
```

### `model`

Contém as entidades utilizadas na aplicação.

Exemplo:

```text
ProfessionalProfile.java
```

### `repository`

Responsável pela comunicação entre as entidades e a camada de persistência.

### `service`

Concentra regras de negócio e operações realizadas sobre os dados.

---

# 5. Firebase

A integração com Firebase é realizada através do Firebase Admin SDK.

A configuração utiliza as credenciais disponibilizadas através da variável de ambiente:

```text
GOOGLE_APPLICATION_CREDENTIALS
```

A inicialização é realizada pela classe:

```text
FirebaseConfig.java
```

O backend verifica se o Firebase já foi inicializado antes de criar uma nova instância.

A utilização do Firebase Admin SDK permite que o servidor interaja de forma segura com os serviços Firebase.

---

# 6. Usuários

O endpoint de usuários disponibiliza informações dos usuários cadastrados no Firebase Authentication.

Endpoint:

```http
GET /api/users
```

Exemplo de resposta:

```json
[
  {
    "uid": "usuario-123",
    "email": "usuario@email.com",
    "displayName": "Usuário AEON",
    "disabled": false
  }
]
```

As informações são obtidas através do Firebase Authentication utilizando o Firebase Admin SDK.

---

# 7. Perfis profissionais

Os perfis profissionais são armazenados e gerenciados através da API REST.

Endpoint principal:

```text
/api/professional-profiles
```

---

## 7.1 Listar perfis

```http
GET /api/professional-profiles
```

Retorna todos os perfis profissionais cadastrados.

---

## 7.2 Buscar perfil

```http
GET /api/professional-profiles/{id}
```

Exemplo:

```text
GET /api/professional-profiles/1
```

---

## 7.3 Criar perfil

```http
POST /api/professional-profiles
```

Exemplo de corpo:

```json
{
  "ownerUid": "usuario-123",
  "type": "Profissional",
  "displayName": "Ana Silva",
  "category": "Psicologia",
  "document": "123456789",
  "description": "Atendimento psicológico.",
  "phone": "(71) 99999-9999",
  "website": "",
  "instagram": "@anasilva",
  "city": "Salvador",
  "address": "Rua Exemplo, 100",
  "status": "pending"
}
```

---

## 7.4 Atualizar perfil

```http
PUT /api/professional-profiles/{id}
```

Exemplo:

```text
PUT /api/professional-profiles/1
```

---

## 7.5 Excluir perfil

```http
DELETE /api/professional-profiles/{id}
```

Exemplo:

```text
DELETE /api/professional-profiles/1
```

---

# 8. Modelo ProfessionalProfile

A entidade de perfil profissional possui os seguintes campos:

| Campo         | Descrição                     |
| ------------- | ----------------------------- |
| `id`          | Identificador do perfil       |
| `ownerUid`    | UID do usuário responsável    |
| `type`        | Tipo do perfil                |
| `displayName` | Nome apresentado              |
| `category`    | Categoria profissional        |
| `document`    | Documento ou registro         |
| `description` | Descrição profissional        |
| `phone`       | Telefone                      |
| `website`     | Site                          |
| `instagram`   | Instagram                     |
| `city`        | Cidade                        |
| `address`     | Endereço                      |
| `status`      | Status da verificação         |
| `active`      | Indica se o perfil está ativo |

---

# 9. CRUD

A API disponibiliza operações completas de gerenciamento dos perfis profissionais.

```text
CREATE
POST /api/professional-profiles

READ
GET /api/professional-profiles
GET /api/professional-profiles/{id}

UPDATE
PUT /api/professional-profiles/{id}

DELETE
DELETE /api/professional-profiles/{id}
```

Essas operações permitem que o dashboard administrativo consulte e gerencie os dados diretamente através da API.

---

# 10. Segurança

A aplicação utiliza **Spring Security** como camada de segurança do backend.

A estrutura permite controlar o acesso aos recursos da API e estabelecer uma camada de proteção entre os clientes e os serviços disponibilizados.

A arquitetura também foi preparada para integração com mecanismos de autenticação e autorização relacionados ao Firebase.

O uso do Firebase Admin SDK permite que operações administrativas relacionadas ao Firebase sejam executadas pelo servidor, sem expor credenciais administrativas ao aplicativo cliente.

---

# 11. Tratamento de erros

As operações da API possuem tratamento de exceções para evitar que falhas internas sejam expostas diretamente ao cliente.

Por exemplo, a consulta de usuários retorna uma resposta de erro apropriada quando ocorre uma falha na comunicação com o Firebase.

Exemplo:

```json
{
  "error": "Erro ao consultar usuários do Firebase."
}
```

Essa abordagem fornece feedback estruturado para os consumidores da API.

---

# 12. Swagger / OpenAPI

A API possui documentação interativa através do Swagger.

Após iniciar o backend, a documentação pode ser acessada em:

```text
/swagger-ui/index.html
```

No ambiente publicado:

```text
https://aeon-backend-deploy.onrender.com/swagger-ui/index.html
```

O Swagger permite:

* Visualizar os endpoints;
* Consultar métodos HTTP;
* Visualizar parâmetros;
* Visualizar estruturas de requisição;
* Visualizar respostas;
* Executar requisições diretamente pela interface.

---

# 13. Backend em produção

O backend está publicado no Render:

```text
https://aeon-backend-deploy.onrender.com
```

A API pode ser acessada através dos endpoints:

```text
https://aeon-backend-deploy.onrender.com/api/users
```

```text
https://aeon-backend-deploy.onrender.com/api/professional-profiles
```

---

# 14. Inicialização do serviço no Render

Como o serviço pode entrar em estado de espera após um período sem utilização, a primeira requisição pode apresentar um pequeno tempo de resposta enquanto a aplicação é inicializada.

Para iniciar o serviço antes de utilizar o dashboard, recomenda-se acessar:

```text
https://aeon-backend-deploy.onrender.com/swagger-ui/index.html
```

Após o carregamento do Swagger, os endpoints podem ser consultados:

```text
https://aeon-backend-deploy.onrender.com/api/users
```

```text
https://aeon-backend-deploy.onrender.com/api/professional-profiles
```

Depois que a API estiver respondendo normalmente, o dashboard Angular poderá consumir os dados normalmente.

---

# 15. Integração com Angular

O dashboard administrativo utiliza `HttpClient` para consumir a API.

Exemplo de configuração:

```typescript
private readonly apiUrl =
  'https://aeon-backend-deploy.onrender.com/api/users';
```

A consulta dos usuários é realizada através de:

```typescript
getAll(): Observable<User[]> {
  return this.http.get<User[]>(this.apiUrl);
}
```

Os perfis profissionais utilizam o mesmo princípio:

```typescript
private readonly apiUrl =
  'https://aeon-backend-deploy.onrender.com/api/professional-profiles';
```

Dessa forma, o Angular funciona como cliente da mesma API REST disponibilizada pelo backend.

---

# 16. Integração com o Dashboard

O dashboard administrativo apresenta os dados obtidos pela API através de:

* Serviços Angular;
* `HttpClient`;
* Data Binding;
* `ngFor`;
* `ngIf`;
* `ngModel`;
* Formulários;
* Filtros;
* Operações CRUD.

As informações são carregadas diretamente do backend, permitindo que o administrador trabalhe com os dados armazenados na plataforma.

---

# 17. Execução local

Para executar o backend localmente:

```bash
cd aeon-backend
```

Depois:

```bash
mvn spring-boot:run
```

Ou no Windows:

```powershell
.\mvnw.cmd spring-boot:run
```

Após a inicialização, o endereço da API dependerá da porta configurada no projeto.

---

# 18. Fluxo completo

O fluxo de comunicação entre os componentes pode ser representado da seguinte forma:

```text
             ┌──────────────────────┐
             │   Dashboard Angular  │
             └──────────┬───────────┘
                        │
                        │ HTTP / REST
                        ▼
             ┌──────────────────────┐
             │   Spring Boot API    │
             │                      │
             │ Controllers          │
             │ Services             │
             │ Security             │
             └──────────┬───────────┘
                        │
              ┌─────────┴─────────┐
              │                   │
              ▼                   ▼
       ┌─────────────┐     ┌─────────────┐
       │    MySQL    │     │   Firebase  │
       │             │     │             │
       │ Perfis      │     │ Usuários    │
       │ Profissionais│    │ Auth        │
       └─────────────┘     └─────────────┘
```

Esse fluxo permite que o dashboard administrativo consuma uma API centralizada e que os dados sejam disponibilizados de forma estruturada.

---

# 19. Considerações finais

A implementação do backend Spring Boot proporciona ao AEON uma camada de serviços centralizada, organizada e preparada para evolução.

A combinação entre **Spring Boot, Spring Security, Firebase, MySQL, Swagger e Angular** permite estruturar uma solução que separa a interface administrativa das regras e dados da aplicação.

A disponibilização do backend em ambiente de nuvem também permite que diferentes máquinas consumam a mesma API, evitando a dependência de um servidor local específico.
