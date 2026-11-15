## git

- Conventional commit titles, plain language: fix(web): new threads no longer spike CPU.
- Do not commit or push unless explicitly requested.

## Documentation

Most code changes do not need an internal documentation change. Agents can read the code.

- Do not document every feature, enumerate fields or methods, narrate control flow, maintain file catalogs, or append PR summaries. Types, tests, and code already record the implementation.
- A local reason the code can't show goes in a short nearby code comment. Use an internal doc when the reasoning crosses boundaries or needs context the code cannot carry well. Link to the relevant source instead of copying it.
- When a documented decision or constraint changes, rewrite or remove the affected text. Do not append another account of the new behavior. A new internal page needs a distinct, durable reason to exist.

## Taste

- Complexity belongs at the adapter boundary. Orchestration stays pure, UI stays dumb.
- Server features are services; transports stay thin.
- Default to no comment. Write one only for a constraint, an external quirk, or an invariant the code can't show, in one line where you can and four at most. Don't restate names or signatures, narrate steps, record history, or explain the fix you just made; the PR carries that.
- If a rule here fights the task in front of you, say so loudly and get a human sign-off before breaking it.

## TypeScript

- Inferred types over annotations. `any` is the enemy.

## React

- React effects are for synchronizing with something outside React. Derive in render and act in handlers instead of syncing state, but don't hide real lifecycle work in refs or stores to dodge one.

## UI

- `components/ui` exports own their look. Pick a `variant` or `size`; do not restyle one with `className`. If none fits and the look is a generic concept, add a variant to the component; a look that belongs to one feature stays in that feature's own component, not in `components/ui`. Layout classes (width, flex, margin, position) belong on the parent.
- Use shadcn/ui primitives instead of recreating standard controls.
- Add missing shadcn/ui components using `pnpm dlx shadcn@latest add <component>` instead of implementing them manually.

## Forms

When working with forms, reference the [shadcn/ui TanStack Form guide](https://ui.shadcn.com/docs/forms/tanstack-form).
