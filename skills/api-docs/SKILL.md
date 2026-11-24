---
name: api-docs
description: Generates or updates API documentation (endpoints, parameters, examples, errors) from the source code. Use when documenting a REST/HTTP API or keeping docs in sync with code.
argument-hint: "[routes folder or file]"
---

Source: $ARGUMENTS (if empty, find the route/controller definitions in the project).

For every endpoint document:
- Method and path, short purpose.
- Auth requirements.
- Path/query/body parameters: name, type, required, constraints, example.
- Success response: status code and example JSON.
- Error responses: status codes and when they happen.
- A ready-to-run `curl` example.

Output Markdown grouped by resource (e.g. Users, Orders), with a table of contents. Derive everything from the code — mark anything you could not confirm with `TODO: verify`. If an OpenAPI file exists, update it instead of writing a separate document.
