# AGENTS.md

AI agent guide for working on this repository.

## Project Overview

FastAPI sample application demonstrating GitLab CI to GitHub Actions migration.

**Language:** Python 3.10+  
**Package Manager:** Poetry 1.8.3  
**Framework:** FastAPI

## Setup

### Prerequisites

GitHub Personal Access Token required for GitHub interactions:
- Scopes: `repo` (all), `workflow`, `admin:org` (read:org)
- Configure: `./setup-github-auth.sh <token>`
- Persist: `gp env ONA_GITHUB=<token>`

### Install Dependencies

```bash
poetry install
```

### Install with Development Dependencies

```bash
# With linting tools
poetry install --with lint

# With testing tools
poetry install --with test

# All groups
poetry install --with lint,test
```

## Development

### Run Development Server

```bash
poetry run uvicorn fastapi_sample_app.main:app --reload
```

## Testing

### Run All Tests

```bash
poetry run pytest
```

### Run Specific Test File

```bash
poetry run pytest tests/test_main.py
```

### Run Specific Test Function

```bash
poetry run pytest tests/test_main.py::test_read_main
```

## Linting

### Check Code Style

```bash
poetry run ruff check
```

### Auto-fix Issues

```bash
poetry run ruff check --fix
```

## CI/CD

### GitLab CI Pipeline

Stages: build → lint → test

- **install**: Install dependencies with Poetry
- **build-job**: Run Ruff linter
- **pytest-job**: Run pytest test suite

Cache: Poetry and pip caches based on `poetry.lock` and `.gitlab-ci.yml`

## Key Directories

- `fastapi_sample_app/` - FastAPI application source code
- `tests/` - Pytest test suite
- `.devcontainer/` - Dev container configuration
- `.gitlab-ci.yml` - GitLab CI pipeline definition

## Dependencies

### Production
- `fastapi ^0.111.0`

### Development
- `pytest ^8.2.2` - Testing framework
- `httpx ^0.27.0` - HTTP client for testing
- `ruff ^0.5.1` - Linter and formatter
