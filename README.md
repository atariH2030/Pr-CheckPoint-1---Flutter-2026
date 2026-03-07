# myapp — Consumo de API Flutter (FIAP 2026)

Projeto desenvolvido na Aula 3 de Flutter, demonstrando consumo de API REST com arquitetura limpa (Clean Architecture) e gerenciamento de estado com Provider.

---

## 🚀 Como rodar o projeto em um novo dispositivo

### 1. Pré-requisitos
- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado
- [Git](https://git-scm.com/) instalado
- Um editor (VS Code ou Android Studio)

### 2. Clonar o repositório
```bash
git clone https://github.com/atariH2030/Pr-CheckPoint-1---Flutter-2026.git
cd Pr-CheckPoint-1---Flutter-2026
```

### 3. Configurar as variáveis de ambiente ⚠️
O arquivo `.env` **não está no repositório** por questões de segurança.
Você precisa criá-lo manualmente na raiz do projeto:

```bash
# Copie o arquivo de exemplo
cp .env.example .env
```

Em seguida, abra o `.env` e preencha com os valores reais:

```env
API_BASE_URL=https://gdapp.com.br/api/fiap
```

> 💡 Os valores reais devem ser combinados com o time ou armazenados em um gerenciador de segredos (ex: Bitwarden, 1Password, Azure Key Vault).

### 4. Instalar as dependências
```bash
flutter pub get
```

### 5. Rodar o projeto
```bash
flutter run
```

---

## 🏗️ Arquitetura do projeto

```
lib/
├── core/                   # Utilitários globais (HTTP client)
├── data/
│   ├── datasources/        # Fontes de dados (API)
│   ├── models/             # Modelos com fromJson
│   └── repositories/       # Implementações dos repositórios
├── domain/
│   ├── entities/           # Entidades de negócio
│   ├── repositories/       # Contratos (interfaces)
│   └── usecases/           # Casos de uso
└── presentation/
    ├── controllers/        # Gerenciamento de estado (Provider)
    └── pages/              # Telas do app
```

---

## 📦 Dependências principais

| Pacote | Uso |
|--------|-----|
| `provider` | Gerenciamento de estado |
| `dio` | Requisições HTTP |
| `flutter_dotenv` | Variáveis de ambiente |

---

## 🔒 Segurança

- **Nunca** commite o arquivo `.env`
- Use o `.env.example` como referência para novos devs
- Armazene chaves sensíveis em um cofre de senhas compartilhado com o time
