# Conhecendo o AEON

AEON é uma plataforma inteligente de monitoramento urbano desenvolvida para auxiliar usuários na identificação de riscos ambientais, condições climáticas e informações contextuais em tempo real. O projeto combina geolocalização, integração com serviços em nuvem, notificações inteligentes e análise de dados ambientais para fornecer suporte à tomada de decisão em ambientes urbanos.

## Objetivo

O objetivo do AEON é utilizar tecnologias modernas de desenvolvimento mobile, computação em nuvem e inteligência artificial e o  monitoramento de  eventos ambientais e disponibilizar informações relevantes aos usuários por meio de mapas interativos, alertas em tempo real e dados climáticos atualizados, e assim, complementar a curadoria urbana de modo que as indicações sejam assertivas e levando em consideração o tempo da cidade.

## Principais Funcionalidades

* Autenticação de usuários com Firebase Authentication
* Monitoramento de alertas ambientais em tempo real
* Integração com mapas interativos
* Exibição de dados climáticos através da OpenWeather API
* Notificações push utilizando Firebase Cloud Messaging (FCM)
* Feed social para compartilhamento de informações
* Sistema de favoritos
* Perfil do usuário
* Navegação otimizada entre telas
* Persistência local de dados

## Tecnologias Utilizadas

### Mobile

* Flutter
* Dart
* Provider

### Backend e Serviços

* Firebase Authentication
* Firebase Firestore
* Firebase Cloud Messaging (FCM)

### APIs Externas

* OpenWeather API
* Serviços de Geolocalização
* Flutter Map

## Estrutura do Projeto

```text
lib/
├── models/
├── providers/
├── repositories/
├── routes/
├── screens/
├── services/
├── widgets/
└── main.dart
```

## Arquitetura

O projeto utiliza uma arquitetura baseada em separação de responsabilidades, dividindo a aplicação em camadas:

* Models: representação dos dados
* Services: comunicação com APIs e Firebase
* Repositories: acesso aos dados
* Providers: gerenciamento de estado global
* Screens: telas da aplicação
* Widgets: componentes reutilizáveis

## Funcionalidades de Rede

O sistema utiliza:

* HTTPS para comunicação com APIs externas
* gRPC através do Firebase Firestore
* Firebase Cloud Messaging para notificações push
* Cloud Firestore para sincronização de dados em tempo real

## Segurança

* Comunicação criptografada via HTTPS/TLS
* Autenticação gerenciada pelo Firebase
* Estrutura preparada para adequação à LGPD
* Persistência segura de dados do usuário

## Desenvolvedores

* Manoela Oliveira
* Paula Carregal
* Pedro Santiago
* Vanessa Fittipaldi 

## Como Executar

As instruções completas de instalação e execução estão disponíveis em:

```text
flutter_application/EXECUTE.md
```

## Repositório

Projeto desenvolvido para fins acadêmicos no contexto das atividades da FIAP, envolvendo desenvolvimento mobile, integração com serviços em nuvem, monitoramento de sistemas e aplicações inteligentes voltadas ao ambiente urbano.
