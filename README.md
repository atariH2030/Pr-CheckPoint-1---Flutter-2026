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

## 🔒 Segurança

- **Nunca** commite o arquivo `.env`
- Use o `.env.example` como referência para novos devs
- Armazene chaves sensíveis em um cofre de senhas compartilhado com o time
