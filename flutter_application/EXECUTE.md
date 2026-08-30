# 🚀 Como executar o AEON

Este documento apresenta o procedimento recomendado para executar o projeto AEON, contemplando o aplicativo Flutter, o backend Spring Boot e o dashboard administrativo Angular.

---

# 1. Pré-requisitos

Antes de executar o projeto, certifique-se de possuir:

* Flutter SDK;
* Dart SDK compatível com o projeto;
* Android Studio ou VS Code;
* Java JDK 17;
* Maven;
* Node.js;
* npm;
* Angular CLI;
* Git;
* Navegador Edge ou Chrome;
* Emulador Android ou dispositivo físico, caso deseje executar o aplicativo mobile.

Para verificar o ambiente Flutter:

```bash
flutter doctor
```

Para verificar o Java:

```bash
java -version
```

Para verificar o Node.js:

```bash
node -v
```

Para verificar o Angular CLI:

```bash
ng version
```

---

# 2. Aplicativo Flutter

Entre na pasta do aplicativo:

```bash
cd flutter_application
```

Instale as dependências:

```bash
flutter pub get
```

Verifique os dispositivos disponíveis:

```bash
flutter devices
```

---

## 2.1 Executar no navegador

Para executar o aplicativo utilizando Microsoft Edge:

```bash
flutter run -d edge
```

Ou utilizando Chrome:

```bash
flutter run -d chrome
```

---

## 2.2 Executar no Android

Com um emulador ou dispositivo conectado:

```bash
flutter run -d ID_DO_DEVICE
```

O identificador do dispositivo pode ser obtido através de:

```bash
flutter devices
```

---

# 3. Firebase

O aplicativo utiliza o projeto Firebase configurado para o AEON.

Os principais arquivos de configuração utilizados pelo aplicativo são:

```text
android/app/google-services.json
ios/Runner/GoogleService-Info.plist
lib/firebase_options.dart
```

Esses arquivos permitem que o aplicativo utilize os serviços Firebase configurados para o projeto.

Entre os serviços utilizados estão:

* Firebase Authentication;
* Cloud Firestore;
* Firebase App Check;
* Firebase AI Logic.

---

# 4. Backend Spring Boot

Entre na pasta do backend:

```bash
cd aeon-backend
```

O projeto utiliza Java 17 e Maven.

Para executar o backend localmente:

```bash
mvn spring-boot:run
```

Ou, caso esteja utilizando o Maven Wrapper:

```bash
./mvnw spring-boot:run
```

No Windows:

```powershell
.\mvnw.cmd spring-boot:run
```

Após a inicialização, a API estará disponível no endereço configurado pelo projeto.

---

# 5. Backend publicado

O backend também está disponibilizado em ambiente de nuvem através do Render.

URL principal:

```text
https://aeon-backend-deploy.onrender.com
```

O dashboard Angular utiliza essa versão publicada da API.

---

# 6. Inicialização do Render

Como o serviço utilizado no Render pode entrar em estado de espera após um período sem utilização, o backend pode apresentar um pequeno tempo de inicialização na primeira requisição.

Para garantir que o serviço esteja ativo antes de utilizar o dashboard, recomenda-se acessar primeiro:

```text
https://aeon-backend-deploy.onrender.com/swagger-ui/index.html
```

A abertura da página do Swagger realiza uma chamada ao serviço e permite que o backend seja inicializado.

Depois, pode-se acessar os endpoints principais:

```text
https://aeon-backend-deploy.onrender.com/api/users
```

```text
https://aeon-backend-deploy.onrender.com/api/professional-profiles
```

Após o backend responder normalmente, o dashboard pode ser aberto.

> **Importante:** esse procedimento é necessário principalmente quando o backend esteve inativo por algum período.

---

# 7. Dashboard Angular

Entre na pasta do dashboard:

```bash
cd aeon-angular
```

Instale as dependências:

```bash
npm install
```

Execute o projeto:

```bash
ng serve
```

O Angular disponibilizará o dashboard localmente, normalmente em:

```text
http://localhost:4200
```

---

# 8. Comunicação com o Backend

O dashboard Angular está configurado para consumir a API publicada:

```text
https://aeon-backend-deploy.onrender.com/api
```

Entre os serviços utilizados estão:

```text
/api/users
/api/professional-profiles
```

O Angular realiza as requisições através do `HttpClient`.

Exemplo:

```typescript
this.http.get<User[]>(this.apiUrl);
```

---

# 9. Ordem recomendada para demonstração

Para uma apresentação ou avaliação, recomenda-se seguir esta ordem:

### 1. Inicializar o backend

Abrir:

```text
https://aeon-backend-deploy.onrender.com/swagger-ui/index.html
```

Aguardar o carregamento do Swagger.

### 2. Validar a API

Acessar:

```text
https://aeon-backend-deploy.onrender.com/api/users
```

e:

```text
https://aeon-backend-deploy.onrender.com/api/professional-profiles
```

### 3. Abrir o dashboard

Executar:

```bash
ng serve
```

e acessar:

```text
http://localhost:4200
```

### 4. Executar o aplicativo

Na pasta do Flutter:

```bash
flutter run -d edge
```

ou:

```bash
flutter run -d ID_DO_DEVICE
```

---

# 10. Observações

* O backend publicado permite que diferentes máquinas consumam a mesma API.
* O dashboard não depende de um backend executando exclusivamente na máquina de um integrante.
* O Firebase utilizado pelo aplicativo corresponde ao ambiente configurado para o projeto.
* O Render pode apresentar um pequeno atraso na primeira requisição após um período de inatividade.
* O Swagger pode ser utilizado como ponto inicial para ativar e verificar o backend.
* O aplicativo Flutter e o dashboard Angular podem ser executados independentemente, desde que os serviços necessários estejam disponíveis.
