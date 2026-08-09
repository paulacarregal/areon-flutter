# Backend FastAPI do AEON

O backend do AEON foi criado como uma camada opcional para apoiar o MVP sem depender de Firebase Functions ou outros serviços pagos. Ele concentra regras de recomendação, catálogo inicial de lugares, validações e chamadas externas que não devem ficar diretamente expostas no app.

## Papel no projeto

No estado atual, o aplicativo Flutter consegue funcionar sem o backend, usando o Firebase configurado pela equipe e fallbacks locais. Quando `BACKEND_URL` é informado na execução, o app passa a consultar o FastAPI para recursos como clima, catálogo e contexto de recomendação.

Essa escolha permite apresentar um MVP funcional e, ao mesmo tempo, manter uma evolução clara para produção.

## Estrutura

```text
backend/
  main.py
  requirements.txt
  .env.example
  data/
    sp_catalog.json
```

O arquivo `sp_catalog.json` contém um catálogo inicial de lugares e experiências em São Paulo. Ele permite testar recomendações sem depender de Google Places ou Google Maps pagos.

## Como executar

```bash
cd backend
python -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
copy .env.example .env
uvicorn main:app --reload --host 127.0.0.1 --port 8000
```

Teste de saúde:

```text
http://127.0.0.1:8000/health
```

## Variáveis de ambiente

```env
OPENWEATHER_KEY=sua_chave_openweather
ALLOWED_ORIGINS=http://localhost,http://127.0.0.1
```

Outras chaves de IA ou serviços externos podem ser adicionadas futuramente ao backend, evitando que fiquem embutidas no aplicativo.

## Integração com o Flutter

Web:

```bash
flutter run -d edge --dart-define=BACKEND_URL=http://127.0.0.1:8000
```

Android Emulator:

```bash
flutter run -d ID_DO_DEVICE --dart-define=BACKEND_URL=http://10.0.2.2:8000
```

Celular físico:

```bash
flutter run -d ID_DO_DEVICE --dart-define=BACKEND_URL=http://SEU_IP_LOCAL:8000
```

## Endpoints principais

| Método | Rota | Finalidade |
| --- | --- | --- |
| GET | `/health` | Verifica se o backend está online. |
| GET | `/catalog` | Retorna o catálogo inicial de lugares. |
| GET | `/catalog/{place_id}/review-prompts` | Retorna sugestões de tags/perguntas para review. |
| POST | `/weather` | Consulta clima a partir de cidade ou coordenadas. |
| POST | `/recommend-places` | Calcula recomendações com base em perfil e contexto. |
| POST | `/notification-context` | Gera o texto contextual usado pelo card de recomendação. |
| POST | `/reviews/validate` | Valida dados de uma review antes de salvar. |
| POST | `/reviews/validate-and-enrich` | Valida e enriquece uma review com metadados. |

Também existem aliases em camelCase para compatibilidade com chamadas do app.

## Exemplo de contexto de recomendação

```json
{
  "profile": {
    "name": "Explorador Equilibrado",
    "preferences": {
      "outdoor": 0.5,
      "active": 0.5,
      "night": 0.5,
      "social": 0.5,
      "novelty": 0.5,
      "maxDistanceKm": 8
    }
  },
  "device": {
    "latitude": -23.5614,
    "longitude": -46.6559,
    "weatherDescription": "céu limpo",
    "temperature": 24,
    "transportMode": "walking"
  }
}
```

## Segurança

O backend ajuda a reduzir a exposição de chaves externas, como clima ou APIs futuras. No MVP, o app ainda usa Firebase diretamente para autenticação, Firestore e Firebase AI Logic, sempre apontando para o projeto Firebase da equipe.

Para produção, os próximos passos recomendados são:

- validar Firebase Auth ID Token no backend com Firebase Admin;
- validar App Check Token em chamadas sensíveis;
- mover chamadas de IA e APIs externas para o servidor quando houver chaves privadas;
- restringir CORS aos domínios oficiais do projeto;
- criar regras de Firestore alinhadas ao usuário autenticado.

## Limitações atuais

- O backend é local/protótipo e ainda não está publicado em nuvem.
- As rotas no mapa usam estimativas, não roteamento real por ruas.
- O catálogo inicial é controlado pelo projeto e ainda não vem de uma API ampla de lugares.
- A recomendação já considera perfil e contexto, mas ainda pode evoluir com dados reais de uso.

Essas limitações foram mantidas de forma consciente para preservar o custo zero do MVP e permitir evolução por etapas.
