#!/bin/sh

echo "🚀 setting up local environment..."
set -e


if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed. Please install Docker first."
  exit 1
fi

if ! command -v pip &> /dev/null; then
  echo "❌ pip is not installed. Please install Python and pip first."
  exit 1
fi

if [ ! -f example.env ]; then
  echo "❌ example.env not found! it can be found on the repository"
  exit 1
fi

if [ -f .env ]; then
  echo "⚠️ .env already exists. Skipping copy."
else
  cp example.env .env
  echo "✅ Copied example.env to .env"
fi

set -a
source ./.env
set +a

echo "🐍 Installing Python dependencies from requirements.txt..."
pip install -r requirements.txt
echo "✅ Python dependencies installed"

DATA_URL="https://raw.githubusercontent.com/dicodingacademy/dicoding_dataset/refs/heads/main/employee/employee_data.csv"
DATA_FILE="employee-data.csv"

echo "📥 Downloading datset..."
curl -fLo "$DATA_FILE" "$DATA_URL"
echo "✅ Downloaded $DATA_FILE"

echo "🚀 Starting Docker Compose..."
docker-compose up -d

echo "⏳ Waiting for Metabase to be ready... may take a while, grab a coffee 🍵"
until curl -s http://localhost:$MB_PORT/api/health | grep -q '"status":"ok"';
do
  sleep 2
done
echo "✅ Metabase is up!"


echo "💽 copying local metabase instance to the metabase docker..."
docker cp ./metabase.db.mv.db metabase-dicoding:/metabase.db/metabase.db.mv.db
docker restart metabase-dicoding
echo "basic setup finished, now we can run the notebook to import csv data to the postgres database"