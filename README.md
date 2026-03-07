# myapp — Consumo de API Flutter (FIAP 2026)

Projeto desenvolvido na Aula 3 de Flutter, demonstrando consumo de API REST com arquitetura limpa (Clean Architecture) e gerenciamento de estado com Provider.

---

## 🚀 Como rodar o projeto em um novo dispositivo

### Pré-requisitos
- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado
- [Git](https://git-scm.com/) instalado

### Setup em 3 comandos (Windows)
```powershell
git clone https://github.com/atariH2030/Pr-CheckPoint-1---Flutter-2026.git
cd Pr-CheckPoint-1---Flutter-2026
.\setup.ps1
```

O script `setup.ps1` faz tudo automaticamente:
1. ✅ Verifica se o Flutter está instalado
2. ✅ Instala as dependências (`flutter pub get`)
3. ✅ Cria o `.env` a partir do `.env.example` e **pede apenas os valores secretos**
4. ✅ Valida se todas as variáveis obrigatórias foram preenchidas

Após o setup, basta executar:
```powershell
flutter run
```

> 💡 **GitHub Copilot** consegue ler este README e executar o setup automaticamente — basta pedir!

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

## � Variáveis de ambiente necessárias

Abaixo está a descrição completa de **cada informação secreta** que você precisará fornecer ao rodar o `setup.ps1`. O script vai pedir uma por uma com todas estas instruções na tela.

---

### `API_BASE_URL`

| Campo | Detalhe |
|---|---|
| **O que é** | Endereço base da API REST que o app consome |
| **Por que precisa** | Sem ela, o app não consegue buscar os produtos |
| **Onde encontrar** | Fornecida pelo professor ou responsável pelo back-end do projeto |
| **Formato** | Deve começar com `https://` e **não** terminar com `/` |
| **Exemplo** | `https://gdapp.com.br/api/fiap` |

---

> 💡 Se futuramente o projeto ganhar novas variáveis (ex: chaves de autenticação, tokens de API), elas serão adicionadas aqui com o mesmo padrão de documentação.
