#!/bin/bash

# Exit if any command fails
set -e

echo "🔐 Loading environment..."
export TELEGRAM_TOKEN="your_telegram_bot_token"
export AUTHORIZED_CHAT_ID="your_telegram_chat_id"

echo "📡 Starting Telegram signal listener..."
nohup python signal_worker.py > logs/signal_worker.log 2>&1 &

echo "🧠 Generating strategy from queued signals..."
python strategy_generator.py

echo "🚀 Launching Freqtrade..."
freqtrade trade --config bot/user_data/config.json --strategy DynamicSignalStrategy
