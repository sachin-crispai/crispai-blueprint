.PHONY: install sync lint test verify clean

install:
	uv sync

sync:
	uv sync

lint:
	uv run ruff check .

format:
	uv run ruff format .

test:
	uv run pytest tests/ -v

verify:
	$(MAKE) lint test

clean:
	rm -rf .venv __pycache__ .pytest_cache dist build
	find . -name "*.pyc" -delete
