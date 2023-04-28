# Demo to reproduce `pnpm link` bug [#6484](https://github.com/pnpm/pnpm/issues/6484)

See https://github.com/pnpm/pnpm/issues/6484

# Reproduction steps

Just run `make` in the root (requires GNU environment):

```
make
```

# Expected result

- `pnpm` links `@prezly/slate-common` package using `react@18` as a peer dependencies
- only one copy of `react` is installed

# Actual result

- `pnpm` links `@prezly/slate-common` package using the minimum allowed version in `@prezly/slate-commons/package.json` (`react@16.9.0`) and then complains about unsatisfied peer dependency.
- two copies of `react` are installed:
   - v18: `node_modules/react`
   - v16.9.0: `node_modules/@prezly/slate-commons/node_modules/react`

```
pnpm link ./linked_modules/@prezly/slate/packages/slate-commons
.../@prezly/slate/packages/slate-commons |  WARN  Moving @types/node that was installed by a different package manager to "node_modules/.ignored"
.../@prezly/slate/packages/slate-commons |  +36 ++++
Packages are hard linked from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/ivan/.local/share/pnpm/store/v3
  Virtual store is at:             linked_modules/@prezly/slate/packages/slate-commons/node_modules/.pnpm
 WARN  Issues with peer dependencies found
.
└─┬ react-dom 18.2.0
  └── ✕ unmet peer react@^18.2.0: found 16.9.0


dependencies:
+ @prezly/slate-commons 0.80.4 <- linked_modules/@prezly/slate/packages/slate-commons

.../@prezly/slate/packages/slate-commons | Progress: resolved 36, reused 36, downloaded 0, added 36, done
```
