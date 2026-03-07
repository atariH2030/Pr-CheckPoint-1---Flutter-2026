# ============================================================
# SCRIPT DE SETUP AUTOMÁTICO — myapp Flutter
# ============================================================
# Execute com: .\setup.ps1
# Funciona no Windows com PowerShell 5.1+
# ============================================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   SETUP AUTOMÁTICO — myapp Flutter     " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# ------------------------------------------------------------
# 1. Verifica se o Flutter está instalado
# ------------------------------------------------------------
Write-Host "[1/4] Verificando Flutter..." -ForegroundColor Yellow
if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
    Write-Host "ERRO: Flutter nao encontrado. Instale em https://docs.flutter.dev/get-started/install" -ForegroundColor Red
    exit 1
}
$flutterVersion = flutter --version | Select-Object -First 1
Write-Host "      OK: $flutterVersion" -ForegroundColor Green

# ------------------------------------------------------------
# 2. Instala as dependências do projeto
# ------------------------------------------------------------
Write-Host ""
Write-Host "[2/4] Instalando dependencias (flutter pub get)..." -ForegroundColor Yellow
flutter pub get
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERRO: Falha ao instalar dependencias." -ForegroundColor Red
    exit 1
}
Write-Host "      OK: Dependencias instaladas." -ForegroundColor Green

# ------------------------------------------------------------
# 3. Configura o arquivo .env
# ------------------------------------------------------------
Write-Host ""
Write-Host "[3/4] Configurando variaveis de ambiente..." -ForegroundColor Yellow

if (Test-Path ".env") {
    Write-Host "      Arquivo .env ja existe. Pulando criacao." -ForegroundColor DarkGray
} else {
    if (-not (Test-Path ".env.example")) {
        Write-Host "ERRO: Arquivo .env.example nao encontrado." -ForegroundColor Red
        exit 1
    }

    Copy-Item ".env.example" ".env"
    Write-Host "      Arquivo .env criado a partir do .env.example." -ForegroundColor Green
    Write-Host ""
    Write-Host "      Preencha os valores abaixo (pressione Enter para manter vazio):" -ForegroundColor Cyan
    Write-Host ""

    # Lê cada variável do .env.example e solicita o valor ao usuário
    $envLines = Get-Content ".env.example"
    $newEnvContent = @()

    foreach ($line in $envLines) {
        # Ignora comentários e linhas vazias
        if ($line -match "^\s*#" -or $line.Trim() -eq "") {
            $newEnvContent += $line
            continue
        }

        # Extrai o nome da variável
        if ($line -match "^([^=]+)=(.*)$") {
            $varName = $matches[1].Trim()
            $currentValue = $matches[2].Trim()

            $input = Read-Host "      $varName"
            if ($input -ne "") {
                $newEnvContent += "$varName=$input"
            } else {
                $newEnvContent += $line
            }
        } else {
            $newEnvContent += $line
        }
    }

    # Salva o .env preenchido
    $newEnvContent | Set-Content ".env"
    Write-Host ""
    Write-Host "      OK: .env configurado com sucesso." -ForegroundColor Green
}

# ------------------------------------------------------------
# 4. Valida se todas as variáveis obrigatórias estão preenchidas
# ------------------------------------------------------------
Write-Host ""
Write-Host "[4/4] Validando variaveis obrigatorias..." -ForegroundColor Yellow

$missingVars = @()
$envContent = Get-Content ".env"

foreach ($line in $envContent) {
    if ($line -match "^\s*#" -or $line.Trim() -eq "") { continue }
    if ($line -match "^([^=]+)=\s*$") {
        $missingVars += $matches[1].Trim()
    }
}

if ($missingVars.Count -gt 0) {
    Write-Host ""
    Write-Host "AVISO: As seguintes variaveis estao vazias no .env:" -ForegroundColor DarkYellow
    foreach ($var in $missingVars) {
        Write-Host "       - $var" -ForegroundColor DarkYellow
    }
    Write-Host "       Edite o arquivo .env e preencha antes de rodar o app." -ForegroundColor DarkYellow
} else {
    Write-Host "      OK: Todas as variaveis estao preenchidas." -ForegroundColor Green
}

# ------------------------------------------------------------
# Finalização
# ------------------------------------------------------------
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   SETUP CONCLUIDO!                     " -ForegroundColor Cyan
Write-Host "   Execute: flutter run                 " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
