do {
	Clear-Host

	$Host.UI.RawUI.WindowTitle = "Ae86"

	Write-Host ""
	Write-Host "╔══════════════════════════════════════╗" -ForegroundColor Cyan
	Write-Host "║                 AE86                 ║" -ForegroundColor Yellow
	Write-Host "╚══════════════════════════════════════╝" -ForegroundColor Cyan
	Write-Host ""

	Set-ExecutionPolicy Unrestricted -Scope Process -Force

	Write-Host "[1] Executar Ativação de Windows" -ForegroundColor Green
	Write-Host "[2] Executar Limpeza de Arquivos" -ForegroundColor Green
	Write-Host "[3] Exibir Informações Técnicas" -ForegroundColor Green
	Write-Host "[0] Sair" -ForegroundColor Red
	Write-Host ""
	$opcao = Read-Host "Escolha uma opção"
	
	if ($opcao -eq "1") {
		Write-Host ""
		Write-Host "Iniciando ativação..." -ForegroundColor Yellow
		irm https://get.activated.win | iex
	}
	elseif ($opcao -eq "2") {
		Write-Host ""
	        Write-Host "Removendo arquivos temporários..." -ForegroundColor Yellow
		Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
		Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
		Write-Host "Limpeza concluída com sucesso!" -ForegroundColor Green
	}
	elseif ($opcao -eq "3") {
		Write-Host ""
	        Write-Host "Coletando informações do sistema..." -ForegroundColor Yellow
		Set-ExecutionPolicy Bypass -Scope Process -Force; $f="$env:TEMP\VITALS.ps1"; irm https://raw.githubusercontent.com/SteveTheKiller/killer-scripts/main/VITALS.ps1 -OutFile $f; & $f
		pause
	}
	
	elseif($opcao -eq "0") {
		Write-Host ""
	        Write-Host "Encerrando AE86..." -ForegroundColor Red
	        exit
	}
	else{
	        Write-Host "Opção inválida!" -ForegroundColor Red
		pause
	}
	
} while ($true)