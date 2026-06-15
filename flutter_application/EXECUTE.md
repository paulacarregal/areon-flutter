🚀 COMO RODAR O AEON

Este documento explica passo a passo como configurar e executar o projeto.

📌 1. Pré-requisitos

Antes de começar, instale:

🔧 Ferramentas obrigatórias

Flutter SDK (versão estável)
https://flutter.dev/docs/get-started/install
Dart SDK (já incluso no Flutter)
Android Studio ou VS Code
Git
https://git-scm.com/

📱 Emulador ou dispositivo físico

Android Emulator (recomendado)
ou
Celular Android com modo desenvolvedor ativado

📦 2. Clonar o projeto

No terminal:

git clone [https://github.com/paulacarregal/areon-flutter]

Depois entre na pasta:

cd areon-flutter

📥 3. Instalar dependências Flutter

Execute:

flutter pub get

🔥 4. Configuração do Firebase

O projeto utiliza Firebase para autenticação e banco de dados.

4.1 Verificar arquivos necessários

Certifique-se de que estes arquivos existem:

android/app/google-services.json
ios/Runner/GoogleService-Info.plist
lib/firebase_options.dart

4.2 Inicializar Firebase no app

O Firebase já está configurado no projeto via FlutterFire CLI.

No main.dart, deve existir algo como:

await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

4.3 Problemas comuns

Se ocorrer erro:

Firebase not initialized

execute:

flutter clean
flutter pub get

🌦️ 5. Configuração de APIs externas

O projeto utiliza API da OpenWeather.

5.2 Importante

NÃO versionar o .env
Ele já está no .gitignore

📦 6. Dependências importantes

O projeto usa:

Firebase Core
Firebase Auth
Cloud Firestore
Firebase Messaging
HTTP
Provider
Flutter DotEnv

▶️ 7. Rodando o projeto

Execute:

flutter run

ou selecione o device no VS Code e clique em Run

📲 8. Notificações (Firebase Cloud Messaging)

Para testar notificações push:

Android:
Aceitar permissões no app

Garantir internet ativa

Usar Firebase Console:

Cloud Messaging → Send Test Message

⚠️ 9. Problemas comuns
❌ Flutter não reconhece comando
flutter doctor

Corrigir dependências faltantes.

❌ Erro no Firebase

Rodar:

flutter clean
flutter pub get

❌ Erro de API Key

Verificar se .env existe e está correto.

🧠 10. Estrutura do projeto

O projeto segue organização por camadas:

lib/
 ├── models/
 ├── screens/
 ├── services/
 ├── repositories/
 ├── widgets/
 ├── theme/
 └── main.dart
🚀 11. Observações finais

O projeto depende de Firebase ativo
API keys devem ser configuradas localmente
O app pode ser executado em Android e Web
Recomenda-se usar Android Studio para emulador
