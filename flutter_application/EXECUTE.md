# 🚀 Como Executar o AEON

Este documento apresenta os procedimentos necessários para executar os principais componentes do projeto AEON:

* Aplicativo Flutter;
* Backend Spring Boot;
* Dashboard administrativo Angular.

---

## 1. Pré-requisitos

Antes de iniciar, verifique se as seguintes ferramentas estão instaladas:

* Flutter SDK;
* Dart SDK compatível com o projeto;
* Java JDK 17;
* Node.js e npm;
* Angular CLI;
* Git;
* Android Studio ou VS Code;
* Chrome ou Microsoft Edge.

Para executar o aplicativo mobile em um dispositivo físico ou emulador, também será necessário configurar um ambiente Android compatível.

### Verificar o ambiente Flutter

```bash
flutter doctor
```

### Verificar a versão do Java

```bash
java -version
```

### Verificar o Node.js

```bash
node -v
```

### Verificar o Angular CLI

```bash
ng version
```

---

## 2. Executar o Aplicativo Flutter

Acesse a pasta do aplicativo:

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

### Executar no navegador

Para utilizar o Microsoft Edge:

```bash
flutter run -d edge
```

Ou o Google Chrome:

```bash
flutter run -d chrome
```

> Caso seja necessário utilizar uma API específica, execute o aplicativo com as configurações definidas pelo projeto.

### Executar no Android

Com um emulador ou dispositivo físico conectado:

```bash
flutter run -d ID_DO_DISPOSITIVO
```

O identificador do dispositivo pode ser consultado com:

```bash
flutter devices
```

---

## 3. Configuração do Firebase

O aplicativo utiliza arquivos de configuração do Firebase para integração com os serviços utilizados pelo projeto.

Os principais arquivos são:

```text
android/app/google-services.json
ios/Runner/GoogleService-Info.plist
lib/firebase_options.dart
```

Esses arquivos devem estar corretamente configurados para que a aplicação possa utilizar os serviços do Firebase.

---

## 4. Executar o Backend Spring Boot

Acesse a pasta do backend:

```bash
cd aeon-backend
```

O projeto utiliza **Java 17** e Maven.

Para iniciar o backend com o Maven:

```bash
mvn spring-boot:run
```

Também é possível utilizar o Maven Wrapper.

### Windows

```powershell
.\mvnw.cmd spring-boot:run
```

### Linux/macOS

```bash
./mvnw spring-boot:run
```

Após a inicialização, a API estará disponível no endereço configurado no projeto.

---

## 5. Backend Publicado

O backend também está disponível em ambiente de nuvem:

**https://aeon-backend-deploy.onrender.com**

O dashboard administrativo pode ser configurado para consumir essa versão da API.

### Swagger

A documentação interativa da API está disponível em:

**https://aeon-backend-deploy.onrender.com/swagger-ui/index.html**

> O serviço hospedado pode apresentar um tempo maior de resposta na primeira requisição após um período de inatividade.

---

## 6. Executar o Dashboard Angular

Acesse a pasta do dashboard:

```bash
cd aeon-angular
```

Instale as dependências:

```bash
npm install
```

Inicie a aplicação:

```bash
ng serve
```

O dashboard normalmente estará disponível em:

```text
http://localhost:4200
```

---

## 7. Comunicação com o Backend

O dashboard Angular realiza requisições HTTP para a API REST.

A URL base publicada é:

```text
https://aeon-backend-deploy.onrender.com/api
```

Entre os endpoints utilizados pelo projeto estão:

```text
/api/users
/api/professional-profiles
```

---

## 8. Ordem Recomendada para Execução

Para facilitar testes e demonstrações, recomenda-se a seguinte sequência:

### 1. Verificar o backend

Acesse a documentação Swagger:

```text
https://aeon-backend-deploy.onrender.com/swagger-ui/index.html
```

Caso o serviço esteja iniciando após um período de inatividade, aguarde o carregamento da página.

### 2. Executar o dashboard Angular

```bash
cd aeon-angular
ng serve
```

Depois, acesse:

```text
http://localhost:4200
```

### 3. Executar o aplicativo Flutter

No diretório do aplicativo:

```bash
cd flutter_application
flutter pub get
flutter run -d chrome
```

Ou selecione outro dispositivo disponível com:

```bash
flutter devices
```

---

## 9. Observações

* O backend publicado permite que diferentes máquinas utilizem a mesma API;
* O Flutter e o dashboard Angular podem ser executados separadamente;
* O Firebase deve estar corretamente configurado para os recursos que dependem de seus serviços;
* O backend hospedado pode apresentar uma resposta inicial mais lenta após períodos de inatividade;
* O Swagger pode ser utilizado para verificar a disponibilidade da API.
