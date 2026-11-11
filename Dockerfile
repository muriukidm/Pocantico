FROM python:3.11-slim

WORKDIR /docs

# Install Poetry
RUN pip install --no-cache-dir poetry

# Copy dependency files
COPY pyproject.toml poetry.lock* ./

# Install dependencies strictly inside the container
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi --no-root

# Expose the local development port
EXPOSE 8044

# Execute the native mkdocs command directly through Poetry to bypass any $PATH resolution issues
CMD ["poetry", "run", "mkdocs", "serve", "-a", "0.0.0.0:8044"]