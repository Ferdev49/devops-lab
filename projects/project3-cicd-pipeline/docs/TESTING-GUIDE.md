# Testing Guide

## Types of Tests

### Unit Tests
Tests individual functions in isolation.
- File: 	ests/unit/test_app.py
- Tools: pytest
- Focus: Single function behavior

### Integration Tests
Tests how multiple components work together.
- File: 	ests/integration/test_workflow.py
- Tools: pytest
- Focus: Function interactions

### E2E Tests (próximo)
Tests complete workflows from start to finish.
- File: 	ests/e2e/
- Tools: pytest, selenium (si aplica)
- Focus: User workflows

## Running Tests Locally

\\\ash
# Install dependencies
pip install -r requirements.txt

# Run unit tests only
pytest tests/unit/ -v

# Run integration tests only
pytest tests/integration/ -v

# Run all tests
pytest tests/ -v

# Run with coverage
pytest tests/ -v --cov=. --cov-report=html
\\\

## Testing in CI/CD

GitHub Actions runs tests automatically on:
- Push to main/develop/project3-cicd-pipeline
- Pull requests to main/develop

Workflow: .github/workflows/test.yml

## Coverage

- Target: >80% code coverage
- Reports: Uploaded to Codecov
- Threshold: All tests must pass

## Best Practices

1. Write tests as you code
2. One assertion per test (ideally)
3. Use descriptive test names
4. Test edge cases
5. Keep tests independent
