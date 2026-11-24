---
paths:
  - "app/api/**/*.ts"
---
# API route rules
- Validate request bodies with `zod` and return 400 with a clear message on failure
- Never return raw database errors to the client; log them and return 500
- Check the user's session before touching user data
