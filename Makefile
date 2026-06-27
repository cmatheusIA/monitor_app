.PHONY: help dev-backend dev-frontend dev-collector test-backend test-frontend

help:
	@echo ""
	@echo "  PulseDeck — Comandos de Desenvolvimento"
	@echo ""
	@echo "  make dev-backend      Inicia o backend FastAPI (WSL2)"
	@echo "  make dev-frontend     Inicia o Angular dev server"
	@echo "  make dev-collector    Inicia o Sensor Collector (rodar no Windows)"
	@echo "  make test-backend     Roda os testes do backend"
	@echo "  make test-frontend    Roda os testes do frontend"
	@echo ""

dev-backend:
	cd backend && uv run uvicorn src.main:app --reload --host 127.0.0.1 --port 8000

dev-frontend:
	cd frontend && npm run start

dev-collector:
	cd sensor-collector && python src/main.py

test-backend:
	cd backend && uv run pytest tests/ -v

test-frontend:
	cd frontend && npm run test -- --watch=false --browsers=ChromeHeadless