# ÆON ✨

### Seu Motor Inteligente de Experiências Urbanas

---

O **AEON** é uma plataforma multiplataforma desenvolvida para proporcionar uma experiência personalizada de descoberta e exploração urbana.

A aplicação utiliza informações como **perfil do usuário, localização, condições climáticas, preferências e contexto** para apresentar recomendações de lugares e experiências de forma mais inteligente e personalizada.

A solução é composta por:

* Aplicativo multiplataforma desenvolvido em **Flutter**;
* Backend REST desenvolvido em **Java com Spring Boot**;
* **Firebase** para serviços de autenticação e recursos complementares;
* Banco de dados **MySQL**;
* Dashboard administrativo desenvolvido em **Angular**.

---

## 🎯 Objetivo

O AEON busca ir além de uma simples lista de lugares. A proposta é oferecer uma experiência de descoberta urbana personalizada, considerando diferentes características e preferências do usuário.

A plataforma combina:

* Perfil de interesses criado durante o onboarding;
* Localização atual do usuário;
* Condições climáticas;
* Preferências de deslocamento;
* Recomendações personalizadas;
* Avaliações e contribuições da comunidade;
* Recursos de inteligência artificial.

As recomendações podem ser exploradas por meio de um mapa interativo, permitindo a consulta de locais e diferentes alternativas de deslocamento.

---

## 🚀 Funcionalidades

### 📱 Aplicativo Mobile

* Cadastro e autenticação de usuários;
* Integração com Firebase Authentication;
* Onboarding com quiz para identificação de interesses;
* Perfil personalizado;
* Feed de avaliações e contribuições;
* Curtidas e favoritos;
* Publicações salvas;
* Cadastro de novos locais;
* Criação de avaliações;
* Sistema de notas e tags;
* Informações sobre faixa média de gastos;
* Mapa interativo;
* Captura da localização do dispositivo;
* Consulta das condições climáticas;
* Recomendações personalizadas;
* Integração com recursos de inteligência artificial;
* Simulação de rotas;
* Opções de deslocamento por carro, transporte público, caminhada e aplicativo de transporte.

---

## 🖥️ Dashboard Administrativo

O AEON também possui um dashboard administrativo desenvolvido em **Angular**, responsável pelo gerenciamento e visualização das informações da plataforma.

Entre os recursos disponíveis estão:

* Visualização geral da plataforma;
* Consulta de usuários cadastrados;
* Consulta de perfis profissionais;
* Visualização de métricas;
* Pesquisa de profissionais;
* Filtros por status e categoria;
* Cadastro de novos perfis profissionais;
* Integração com a API REST.

---

## ⚙️ Backend

O backend da solução foi desenvolvido em **Java com Spring Boot** e disponibiliza uma API REST para comunicação com os demais componentes da plataforma.

Suas principais responsabilidades incluem:

* Gerenciamento de usuários;
* Gerenciamento de perfis profissionais;
* Operações CRUD;
* Persistência de dados;
* Validação de informações;
* Tratamento de erros;
* Controle de acesso;
* Exposição de endpoints REST;
* Integração com serviços do Firebase;
* Documentação da API com Swagger/OpenAPI.

---

## ☁️ Infraestrutura

O backend está publicado em ambiente de nuvem utilizando o **Render**, permitindo que diferentes aplicações e ambientes da equipe consumam a mesma API.

**API publicada:**
https://aeon-backend-deploy.onrender.com

A utilização de uma API hospedada reduz a dependência de um servidor local e facilita a integração entre os componentes do projeto.

---

## 🔥 Firebase

O Firebase é utilizado como parte da infraestrutura da aplicação.

Os principais serviços utilizados incluem:

* Firebase Authentication;
* Cloud Firestore;
* Firebase App Check;
* Firebase AI Logic.

O backend também utiliza o **Firebase Admin SDK** para integração com os serviços do Firebase.

---

## 🧩 Tecnologias Utilizadas

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

## 🏗️ Arquitetura da Solução

```text
┌───────────────────────────────┐
│       Aplicativo Flutter       │
│                               │
│ Usuário • Mapa • Reviews      │
│ Perfil • Recomendações        │
└───────────────┬───────────────┘
                │
                │ HTTP / REST
                ▼
┌───────────────────────────────┐
│       Spring Boot API          │
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
│ Dados do     │  │ Auth e       │
│ sistema      │  │ Firestore    │
└──────────────┘  └──────────────┘


┌───────────────────────────────┐
│       Dashboard Angular        │
│                               │
│ Usuários • Profissionais      │
│ Métricas • Formulários        │
└───────────────┬───────────────┘
                │
                │ HTTP / REST
                ▼
         Spring Boot API
```

---

## 📁 Estrutura do Projeto

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

## 📚 Documentação

Para mais informações sobre a execução e os componentes do projeto, consulte:

* [`EXECUTE.md`](EXECUTE.md) — instruções para execução do projeto;
* [`BACKEND.md`](BACKEND.md) — documentação do backend Spring Boot;
* Swagger/OpenAPI — documentação interativa da API.

---

## 👥 Desenvolvedores

* **Manoela Oliveira** — GitHub: https://github.com/Manu11000
* **Paula Carregal** — GitHub: https://github.com/paulacarregal
* **Pedro Santiago** — GitHub: https://github.com/pedrosantiago1
* **Vanessa Fittipaldi** — GitHub: https://github.com/vxnesv

---

<p align="center">
  © 2026 AEON Project.
</p>
