## General Preferences

- Keep changes focused, minimal, and easy to review.
- Prefer readability and maintainability over clever code.
- Use guard clauses and early returns to reduce nesting.
- Add tests for behavior changes and bug fixes.

## Temporary Storage

- `/tmp` is a RAM-backed tmpfs. Do not place large files or other high-volume data there, as exhausting it can consume system memory and freeze the system.
- Do not use `mktemp` or `mktemp -d` for caches, builds, test artifacts, or other potentially nontrivial data: they default to `/tmp`, which is RAM-backed here. Use a project-local directory or an appropriate persistent cache directory instead.

## Go Preferences (apply when editing `.go` files)

- Write idiomatic Go, preferably following Google Go style guidance and common Go best practices.
- Prefer the Go standard library when functionality is available there; only add third-party dependencies when needed.
- Keep the happy path to the left by using guard clauses and early returns; avoid unnecessary nesting.
- Add error context using a plain-English action prefix (usually based on the function/action name).
- Use `%v` in `fmt.Errorf` when unwrapping is not intended.
- Use `%w` in `fmt.Errorf` when callers should be able to unwrap and inspect the underlying error.
- Function call examples:
  - `if err := doSomeThing(); err != nil { return fmt.Errorf("do something: %v", err) }`
  - `if err := doSomeThing(); err != nil { return fmt.Errorf("do something: %w", err) }`

## Go Testing Preferences (apply when editing Go tests)

- Prefer table-driven tests when they improve clarity and reduce duplication.
- Use test helpers to keep test bodies focused and uncluttered.
- Extract only genuinely reusable test helpers; keep single-purpose setup, parsing, polling, and assertions local to the test.
- In tests, make helpers call `t.Helper()`.
- Use `t.Fatal` when a failure means the test cannot continue safely.
- Use `t.Error` when a failure should be reported but the test can continue.
- Prefer in-process tests. Do not start external services or processes unless their behavior is what the test covers.
- Use `t.Context()` for fixture lifetime. Let cleanup wait for asynchronous work before closing shared resources.
- Express stable results as a complete expected value and compare it with `cmp.Diff(want, got)`, including for strings. Avoid field-by-field assertions when a full-struct comparison is clearer.
- Ignore only inherently variable fields (for example, database-assigned timestamps) in `cmp.Diff`; assert important variable properties separately.
- For parsing and decoding tests, include the complete expected decoded value in the test case and compare it directly to the result.
- Name test helpers for their action and failure behavior: `newTest...` for fixtures, `require...` for fatal assertions, and `must...` for operations that abort the test on failure.

## TypeScript Preferences (apply when editing `.ts`, `.tsx`, `.cts`, `.mts` files)

- Write idiomatic TypeScript aligned with Google style guidance.
- Prefer clarity over cleverness; keep functions small and focused.
- Use strict typing patterns; avoid `any` unless explicitly justified.
- Prefer `unknown` plus narrowing over `any`.
- Keep happy path left with guard clauses and early returns.
- Validate all external input at boundaries (HTTP, queue payloads, env vars).
- Use the `is` library for runtime type checks and request guards.
- Reject unknown fields for request bodies unless explicitly allowed.
- Use `undefined` for optional fields; avoid `null` unless persistence semantics require it.
- Keep API contract/spec and implementation aligned when a schema exists.
- Add regression tests for every bug fix.

## TypeScript Testing Preferences (apply when editing TS tests)

- Prefer table-driven tests where they reduce duplication and improve coverage.
- Test happy path, invalid input, and edge cases.
- Keep tests deterministic and isolated.
- Name tests clearly (for example: `it should ...`).
