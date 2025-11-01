uv venv

source .venv/bin/activate

uv pip install "fastapi[standard]"

fastapi dev server.py or ./run.sh