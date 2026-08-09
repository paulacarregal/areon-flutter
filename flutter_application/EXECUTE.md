# Como executar o AEON

Este documento apresenta o caminho recomendado para executar o MVP do AEON em ambiente local.

## 1. Pré-requisitos

- Flutter SDK instalado e configurado no PATH.
- Android Studio ou VS Code.
- Git.
- Para Android: emulador ou celular com modo desenvolvedor ativado.
- Para Web: Edge ou Chrome.

Verifique o ambiente com:

```bash
flutter doctor
```

## 2. Instalar dependências

Na raiz do repositório, entre na pasta do app:

```bash
cd flutter_application
flutter pub get
```

## 3. Ambiente Firebase da entrega

O avaliador não precisa criar um novo projeto Firebase. Esta entrega deve ser executada usando o projeto Firebase já configurado pela equipe.

Por isso, estes arquivos fazem parte do ambiente do MVP e devem estar presentes no repositório ou no pacote entregue:


```text
android/app/google-services.json
ios/Runner/GoogleService-Info.plist
lib/firebase_options.dart
```

Eles apontam para o Firebase usado no desenvolvimento do AEON, incluindo Authentication, Firestore, App Check e Firebase AI Logic.

No MVP, o projeto foi validado em Web/Edge e preparado para Android e iOS. A execução em iPhone ainda exige validação em ambiente Apple com Xcode e CocoaPods.

## 4. Executar no navegador

```bash
flutter run -d edge
```

Caso o App Check Web esteja com reCAPTCHA configurado, informe a chave pública:

```bash
flutter run -d edge --dart-define=RECAPTCHA_V3_SITE_KEY=SUA_CHAVE_PUBLICA
```

## 5. Executar no Android

Liste os dispositivos disponíveis:

```bash
flutter devices
```

Depois execute:

```bash
flutter run -d ID_DO_DEVICE
```

Se aparecer erro de Java/Gradle, verifique se o Android Studio está usando JDK 17 e se o caminho em `android/gradle.properties` aponta para uma instalação válida.

## 6. Backend opcional

O app funciona sem backend usando fallbacks locais. Para testar o FastAPI, rode primeiro:

```bash
cd backend
python -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
uvicorn main:app --reload --host 127.0.0.1 --port 8000
```

Em outro terminal, execute o Flutter apontando para o backend:

```bash
flutter run -d edge --dart-define=BACKEND_URL=http://127.0.0.1:8000
```

Para Android Emulator:

```bash
flutter run -d ID_DO_DEVICE --dart-define=BACKEND_URL=http://10.0.2.2:8000
```

Para celular físico, use o IP local do computador na mesma rede:

```bash
flutter run -d ID_DO_DEVICE --dart-define=BACKEND_URL=http://SEU_IP_LOCAL:8000
```

## 7. Observações

- A entrega foi pensada para rodar no mesmo Firebase usado pela equipe, sem recriação de projeto pelo avaliador.
- As chaves presentes em `firebase_options.dart`, `google-services.json` e `GoogleService-Info.plist` identificam o projeto Firebase, mas não substituem regras de segurança.
- Chaves sensíveis de APIs externas devem ficar em variáveis de ambiente ou no backend.
- As rotas do MVP usam estimativas e linha direta no mapa, não uma API paga de roteamento.
- O mapa usa OpenStreetMap, evitando custo de Google Maps no protótipo.
