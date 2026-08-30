# 🔧 Backend Spring Boot — AEON

O backend do **AEON** foi desenvolvido em **Java com Spring Boot** e é responsável por disponibilizar uma API REST para o gerenciamento e a integração dos dados utilizados pela plataforma.

A aplicação centraliza operações relacionadas aos usuários e aos perfis profissionais, além de integrar serviços como **Firebase**, **MySQL** e **Swagger/OpenAPI**.

---

## 🎯 Objetivo

O backend tem como objetivo centralizar o acesso e o gerenciamento dos dados da plataforma AEON.

Entre suas principais responsabilidades estão:

* Disponibilizar endpoints REST;
* Gerenciar usuários;
* Gerenciar perfis profissionais;
* Executar operações CRUD;
* Persistir dados;
* Integrar serviços externos;
* Validar informações;
* Tratar erros;
* Controlar o acesso aos recursos;
* Disponibilizar documentação interativa da API.

---

## 🧩 Tecnologias

| Tecnologia              | Utilização                             |
| ----------------------- | -------------------------------------- |
| Java 17                 | Linguagem principal                    |
| Spring Boot             | Framework principal                    |
| Spring MVC              | Desenvolvimento da API REST            |
| Spring Data JPA         | Persistência de dados                  |
| Hibernate               | ORM                                    |
| MySQL                   | Banco de dados                         |
| Spring Security         | Segurança e controle de acesso         |
| Firebase Admin SDK      | Integração administrativa com Firebase |
| Firebase Authentication | Gerenciamento de usuários              |
| Swagger / OpenAPI       | Documentação da API                    |
| Maven                   | Gerenciamento de dependências          |
| Render                  | Hospedagem do backend                  |

---

## 🏗️ Arquitetura

O backend segue uma organização baseada na separação de responsabilidades entre suas principais camadas:

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

De forma geral, o fluxo de uma requisição ocorre da seguinte maneira:

1. O **Controller** recebe a requisição HTTP;
2. O **Service** executa as regras de negócio;
3. O **Repository** realiza a comunicação com a camada de persistência;
4. Os dados são armazenados ou consultados no banco de dados.

Além disso, o backend integra serviços externos por meio de configurações específicas, como o **Firebase Admin SDK**.

```text
                    Spring Boot
                         │
             ┌───────────┴───────────┐
             ▼                       ▼
      Firebase Admin SDK       Spring Data JPA
             │                       │
             ▼                       ▼
         Firebase                   MySQL
```

---

## 📁 Estrutura do Projeto

A estrutura principal do backend está organizada da seguinte forma:

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

Contém as configurações necessárias para a inicialização e integração dos serviços utilizados pela aplicação.

Um dos principais componentes é:

```text
FirebaseConfig.java
```

Essa classe é responsável pela configuração e inicialização da integração com o Firebase Admin SDK.

### `controller`

Contém os controladores responsáveis pelos endpoints REST da aplicação.

Exemplos:

```text
UserController.java
ProfessionalProfileController.java
```

### `model`

Contém as entidades e modelos utilizados pela aplicação.

Exemplo:

```text
ProfessionalProfile.java
```

### `repository`

Responsável pela comunicação com a camada de persistência, utilizando o Spring Data JPA.

### `service`

Concentra as regras de negócio e as operações realizadas sobre os dados.

---

## 🔥 Integração com Firebase

O backend utiliza o **Firebase Admin SDK** para integração com os serviços administrativos do Firebase.

A configuração utiliza credenciais disponibilizadas por meio da variável de ambiente:

```text
GOOGLE_APPLICATION_CREDENTIALS
```

A inicialização é realizada pela classe:

```text
FirebaseConfig.java
```

O Firebase Admin SDK permite que o servidor realize operações administrativas relacionadas aos serviços Firebase sem expor credenciais administrativas aos aplicativos clientes.

---

## 👤 Usuários

O backend disponibiliza um endpoint para consulta dos usuários cadastrados no Firebase Authentication.

### Listar usuários

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

As informações são obtidas por meio do Firebase Authentication utilizando o Firebase Admin SDK.

---

# 💼 Perfis Profissionais

Os perfis profissionais são gerenciados pela API REST e persistidos no banco de dados da aplicação.

Endpoint base:

```text
/api/professional-profiles
```

## Listar perfis

```http
GET /api/professional-profiles
```

Retorna os perfis profissionais cadastrados.

---

## Buscar perfil por ID

```http
GET /api/professional-profiles/{id}
```

Exemplo:

```http
GET /api/professional-profiles/1
```

---

## Criar perfil

```http
POST /api/professional-profiles
```

Exemplo de corpo da requisição:

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

## Atualizar perfil

```http
PUT /api/professional-profiles/{id}
```

Exemplo:

```http
PUT /api/professional-profiles/1
```

---

## Excluir perfil

```http
DELETE /api/professional-profiles/{id}
```

Exemplo:

```http
DELETE /api/professional-profiles/1
```

---

## 🗃️ Modelo `ProfessionalProfile`

A entidade `ProfessionalProfile` possui os seguintes campos:

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
| `instagram`   | Perfil do Instagram           |
| `city`        | Cidade                        |
| `address`     | Endereço                      |
| `status`      | Status da verificação         |
| `active`      | Indica se o perfil está ativo |

---

## 🔄 Operações CRUD

A API disponibiliza as operações básicas de gerenciamento dos perfis profissionais:

| Operação      | Método   | Endpoint                          |
| ------------- | -------- | --------------------------------- |
| Criar         | `POST`   | `/api/professional-profiles`      |
| Listar        | `GET`    | `/api/professional-profiles`      |
| Buscar por ID | `GET`    | `/api/professional-profiles/{id}` |
| Atualizar     | `PUT`    | `/api/professional-profiles/{id}` |
| Excluir       | `DELETE` | `/api/professional-profiles/{id}` |

Essas operações podem ser utilizadas pelos clientes da API para consultar e gerenciar os dados dos perfis profissionais.

---

## 🔒 Segurança

A aplicação utiliza **Spring Security** como camada de segurança do backend.

A estrutura do projeto foi preparada para controlar o acesso aos recursos da API e possibilitar a integração com mecanismos de autenticação e autorização.

O Firebase Admin SDK é utilizado exclusivamente no ambiente do servidor para operações administrativas relacionadas ao Firebase.

---

## ⚠️ Tratamento de Erros

A API possui tratamento de exceções para evitar a exposição direta de informações internas do sistema.

Quando ocorre uma falha durante uma operação, o backend pode retornar uma resposta estruturada ao cliente.

Exemplo:

```json
{
  "error": "Erro ao consultar usuários do Firebase."
}
```

Essa abordagem facilita a identificação de problemas pelos consumidores da API.

---

## 📚 Swagger / OpenAPI

A API possui documentação interativa utilizando **Swagger/OpenAPI**.

Após iniciar o backend, a documentação pode ser acessada pelo endereço:

```text
/swagger-ui/index.html
```

No ambiente publicado:

```text
https://aeon-backend-deploy.onrender.com/swagger-ui/index.html
```

O Swagger permite:

* Visualizar os endpoints disponíveis;
* Consultar os métodos HTTP;
* Visualizar parâmetros;
* Consultar estruturas de requisição e resposta;
* Executar requisições diretamente pela interface.

---

## ☁️ Ambiente Publicado

O backend está hospedado no **Render**.

### API

```text
https://aeon-backend-deploy.onrender.com
```

### Endpoints disponíveis

```text
GET /api/users
```

```text
GET /api/professional-profiles
```

O serviço publicado permite que diferentes aplicações e ambientes da equipe consumam a mesma API.

> **Observação:** dependendo da configuração do ambiente de hospedagem, a primeira requisição após um período de inatividade pode apresentar um tempo maior de resposta.

---

## ▶️ Execução Local

Acesse o diretório do backend:

```bash
cd aeon-backend
```

### Utilizando Maven

```bash
mvn spring-boot:run
```

### Utilizando Maven Wrapper

No Windows:

```powershell
.\mvnw.cmd spring-boot:run
```

No Linux ou macOS:

```bash
./mvnw spring-boot:run
```

Após a inicialização, a API estará disponível na porta configurada no projeto.

---

## 🔗 Fluxo de Integração

O backend funciona como uma camada central de comunicação entre os clientes da plataforma e os serviços utilizados pela aplicação.

```text
       ┌──────────────────────┐
       │  Clientes da AEON    │
       │                      │
       │ Flutter / Angular    │
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
         ┌────────┴────────┐
         ▼                 ▼
  ┌─────────────┐   ┌─────────────┐
  │    MySQL    │   │   Firebase  │
  │             │   │             │
  │ Perfis e    │   │ Usuários e  │
  │ dados       │   │ serviços    │
  └─────────────┘   └─────────────┘
```

---

## 📌 Considerações Finais

O backend Spring Boot fornece uma camada centralizada para o gerenciamento e disponibilização dos dados da plataforma AEON.

A utilização de **Spring Boot**, **Spring Security**, **Spring Data JPA**, **MySQL** e **Firebase** permite estruturar uma API organizada e preparada para evolução.

A documentação por meio do **Swagger/OpenAPI** facilita a consulta e o teste dos endpoints disponíveis, enquanto a publicação do serviço em nuvem permite a integração entre os diferentes componentes do projeto.
