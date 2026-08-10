<h1 align="center">
  ÆON ✨
</h1>

<h4 align="center">
  O seu Motor Inteligente de Experiências Urbanas.
</h4>


---

AEON é um aplicativo Flutter de recomendação urbana inteligente. A proposta é ajudar o usuário a descobrir lugares, experiências e rotas em São Paulo a partir de um perfil inicial criado por quiz, do contexto atual do aparelho e de sinais como localização, clima, distância e preferências de deslocamento.

O projeto foi desenvolvido como MVP acadêmico, com foco em experiência mobile, integração com Firebase, mapa interativo, reviews, favoritos e recomendações apoiadas por IA.

## Objetivo

Criar uma experiência de exploração urbana mais personalizada do que uma lista genérica de lugares. O app combina:

- perfil de interesse criado no onboarding;
- localização atual do usuário;
- clima e contexto do momento;
- IA para gerar recomendações em linguagem natural.

A recomendação aparece no mapa como um card contextual. Ao selecionar a sugestão, o usuário visualiza opções de rota por carro, transporte público, caminhada e carro por aplicativo.

## Funcionalidades

- Cadastro, login e logout com Firebase Authentication.
- Quiz inicial para mapear o perfil do usuário.
- Feed de reviews com curtidas, favoritos e publicações salvas.
- Tela de contribuição com locais visitados recentemente.
- Criação de review com nota, texto, tags e faixa média de gasto.
- Persistência de usuários e reviews no Cloud Firestore.
- Integração com mapas interativos.
- Captura de localização do aparelho quando permitida.
- Consulta de clima com fallback local ou backend opcional.
- Recomendação com Firebase AI Logic/Gemini e fallback local.
- Simulação de rota e estimativas por modal de transporte.
- Backend opcional em FastAPI para concentrar regras e proteger chaves externas.

## Tecnologias Adotadas

O projeto utiliza tecnologias voltadas ao desenvolvimento mobile multiplataforma, integração em nuvem, geolocalização e inteligência artificial.

| Categoria | Tecnologias |
| --- | --- |
| Linguagem principal | Dart |
| Framework mobile | Flutter |
| Gerenciamento de estado | Provider |
| Backend opcional | Python e FastAPI |
| Banco de dados | Cloud Firestore |
| Autenticação | Firebase Authentication |
| Segurança e validação de origem | Firebase App Check |
| Inteligência artificial | Firebase AI Logic com Gemini |
| Mapas | Flutter Map e OpenStreetMap |
| Localização | Geolocator |
| Chamadas HTTP | Pacotes HTTP/Dio usados na comunicação com serviços externos e backend |
| Persistência e dados em nuvem | Firebase Core, Cloud Firestore e estrutura de services/repositories |
| Ferramentas de desenvolvimento | Android Studio, VS Code, Flutter CLI, Git e Firebase Console |
| Integrações externas | Firebase, OpenStreetMap, OpenWeather via backend/fallback e links externos para Uber/99 |

## Estrutura

```text
flutter_application/
  lib/
    core/
    features/
    models/
    providers/
    repositories/
    routes/
    screens/
    services/
    widgets/
    main.dart
  backend/
    main.py
    requirements.txt
    data/
  EXECUTE.md
  BACKEND.md
```

## Documentação

- Como executar o app: `flutter_application/EXECUTE.md`
- Backend FastAPI: `flutter_application/BACKEND.md`

## Desenvolvedores

- Manoela Oliveira - [GitHub](https://github.com/Manu11000)
- Paula Carregal - [GitHub](https://github.com/paulacarregal)
- Pedro Santiago - [GitHub](https://github.com/pedrosantiago1)
- Vanessa Fittipaldi - [GitHub](https://github.com/vxnesv)

<p align="center">
  <br>
  Desenvolvido com 💜 focado em inovar a exploração urbana.
</p>
<p align="center">
  <br>
  © 2026 AEON Project.
</p>

