# ÆON ✨

### O seu Motor Inteligente de Experiências Urbanas

---

O **AEON** é uma aplicação multiplataforma desenvolvida em **Flutter**, com o objetivo de proporcionar uma experiência personalizada de exploração urbana.

A plataforma utiliza informações relacionadas ao perfil do usuário, localização, clima, preferências e contexto para apresentar recomendações de lugares e experiências de forma inteligente.

Nesta versão da solução, o projeto foi evoluído para uma arquitetura composta por **aplicativo mobile em Flutter, backend REST em Java com Spring Boot, Firebase como serviço de autenticação e persistência, e dashboard administrativo em Angular**.

---

## 🎯 Objetivo

O objetivo do AEON é oferecer uma experiência de descoberta urbana personalizada, indo além de uma simples lista de lugares.

A aplicação combina:

* Perfil de interesse criado durante o onboarding;
* Localização atual do usuário;
* Condições climáticas;
* Preferências de deslocamento;
* Recomendações personalizadas;
* Avaliações e contribuições da comunidade;
* Recursos de inteligência artificial.

A recomendação pode ser apresentada diretamente no mapa, permitindo que o usuário explore o local sugerido e consulte diferentes alternativas de deslocamento.

---

# 🚀 Funcionalidades

## Aplicativo Mobile

* Cadastro e login de usuários;
* Autenticação utilizando Firebase Authentication;
* Quiz inicial para criação do perfil do usuário;
* Perfil personalizado;
* Feed de reviews;
* Curtidas e favoritos;
* Publicações salvas;
* Contribuição com novos locais;
* Criação de avaliações;
* Sistema de notas e tags;
* Informações sobre faixa média de gastos;
* Mapa interativo;
* Captura da localização do dispositivo;
* Consulta de condições climáticas;
* Recomendações personalizadas;
* Integração com inteligência artificial;
* Simulação de rotas;
* Opções de deslocamento por carro, transporte público, caminhada e aplicativo de transporte.

---

# 🖥️ Dashboard Administrativo

O projeto também possui uma aplicação web administrativa desenvolvida em **Angular**, responsável pelo gerenciamento das informações utilizadas pela plataforma.

O dashboard permite:

* Visualização geral da plataforma;
* Consulta dos usuários cadastrados;
* Consulta dos perfis profissionais;
* Visualização de métricas;
* Pesquisa de profissionais;
* Filtros por status;
* Filtros por categoria;
* Cadastro de novos perfis profissionais;
* Integração direta com a API REST;
* Atualização dos dados apresentados em tempo real após operações realizadas na API.

---

# ⚙️ Backend

O backend principal da solução foi desenvolvido utilizando:

* Java;
* Spring Boot;
* Spring MVC;
* Spring Data JPA;
* Spring Security;
* Firebase Admin SDK;
* MySQL;
* Swagger/OpenAPI.

A API REST é responsável por disponibilizar os dados estruturados para o dashboard administrativo e demais componentes que necessitem consumir os serviços da plataforma.

Entre suas responsabilidades estão:

* Gerenciamento de usuários;
* Gerenciamento de perfis profissionais;
* Operações CRUD;
* Integração com Firebase;
* Persistência de dados;
* Validação das informações;
* Tratamento de erros;
* Controle de acesso;
* Exposição de endpoints REST;
* Documentação da API.

---

# ☁️ Infraestrutura

O backend está hospedado em ambiente de nuvem utilizando **Render**, permitindo que a API seja acessada remotamente pelos diferentes ambientes da equipe.

O dashboard Angular consome diretamente a API publicada:

```text
https://aeon-backend-deploy.onrender.com
```

A utilização de um backend publicado evita a dependência de um servidor local específico e permite que diferentes máquinas utilizem a mesma API.

---

# 🔥 Firebase

O Firebase é utilizado como parte importante da infraestrutura da aplicação.

Entre os serviços utilizados estão:

* Firebase Authentication;
* Cloud Firestore;
* Firebase App Check;
* Firebase AI Logic.

O backend também utiliza o **Firebase Admin SDK** para integração com os dados e serviços do Firebase.

---

# 🧩 Tecnologias Adotadas

| Categoria               | Tecnologia                  |
| ----------------------- | --------------------------- |
| Linguagem mobile        | Dart                        |
| Framework mobile        | Flutter                     |
| Gerenciamento de estado | Provider                    |
| Backend                 | Java                        |
| Framework backend       | Spring Boot                 |
| API                     | Spring MVC / REST           |
| Persistência            | Spring Data JPA             |
| Banco de dados          | MySQL                       |
| Autenticação            | Firebase Authentication     |
| Integração Firebase     | Firebase Admin SDK          |
| Segurança               | Spring Security             |
| Documentação da API     | Swagger / OpenAPI           |
| Dashboard               | Angular                     |
| Comunicação web         | Angular HttpClient          |
| Inteligência artificial | Firebase AI Logic / Gemini  |
| Mapas                   | Flutter Map / OpenStreetMap |
| Localização             | Geolocator                  |
| Requisições HTTP        | HTTP / Dio                  |
| Hospedagem do backend   | Render                      |
| Controle de versão      | Git / GitHub                |
| IDEs                    | Android Studio / VS Code    |

---

# 🏗️ Arquitetura da Solução

A solução é organizada em três principais camadas:

```text
┌───────────────────────────────┐
│       Aplicativo Flutter      │
│                               │
│  Usuário / Mapa / Reviews     │
│  Perfil / Recomendações       │
└───────────────┬───────────────┘
                │
                │ HTTP / REST
                ▼
┌───────────────────────────────┐
│       Spring Boot API         │
│                               │
│ Controllers                   │
│ Services                      │
│ Models / Entities             │
│ Spring Security               │
└───────────────┬───────────────┘
                │
        ┌───────┴────────┐
        ▼                ▼
┌──────────────┐  ┌──────────────┐
│    MySQL     │  │   Firebase   │
│              │  │              │
│ Dados do     │  │ Auth /       │
│ sistema      │  │ Firestore    │
└──────────────┘  └──────────────┘


┌───────────────────────────────┐
│       Dashboard Angular       │
│                               │
│ Usuários / Profissionais      │
│ Métricas / Formulários        │
└───────────────┬───────────────┘
                │
                │ HTTP / REST
                ▼
        Spring Boot API
```

---

# 📁 Estrutura do Projeto

```text
AEON_F/
│
├── flutter_application/
│   ├── lib/
│   ├── android/
│   ├── ios/
│   ├── web/
│   ├── pubspec.yaml
│   └── ...
│
├── aeon-backend/
│   ├── src/
│   │   └── main/
│   │       └── java/
│   │           └── com/
│   │               └── aeon/
│   │                   └── backend/
│   │                       ├── config/
│   │                       ├── controller/
│   │                       ├── model/
│   │                       ├── repository/
│   │                       └── service/
│   ├── pom.xml
│   └── ...
│
└── aeon-angular/
    ├── src/
    │   └── app/
    │       ├── core/
    │       └── features/
    ├── angular.json
    ├── package.json
    └── ...
```

---

# 📚 Documentação

Os principais documentos da solução estão organizados da seguinte forma:

* [`EXECUTE.md`](EXECUTE.md) — instruções para execução do projeto;
* [`BACKEND.md`](BACKEND.md) — documentação do backend Spring Boot;
* Documentação interativa da API disponível através do Swagger.

---

# 👥 Desenvolvedores

* **Manoela Oliveira** — [GitHub](https://github.com/Manu11000)
* **Paula Carregal** — [GitHub](https://github.com/paulacarregal)
* **Pedro Santiago** — [GitHub](https://github.com/pedrosantiago1)
* **Vanessa Fittipaldi** — [GitHub](https://github.com/vxnesv)

---

<p align="center">

© 2026 AEON Project.

</p>
