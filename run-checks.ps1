# run-checks.ps1
# Auto-run lint, type check, and backtest for your strategy

Write-Host "=== Running Pylint ==="
pylint user_data/strategies/MACDZeroCrossStrategyPro.py

Write-Host "`n=== Running Mypy ==="
mypy user_data/strategies/MACDZeroCrossStrategyPro.py

Write-Host "`n=== Running Backtest ==="
freqtrade backtesting -s MACDZeroCrossStrategyPro -c user_data/config.json
