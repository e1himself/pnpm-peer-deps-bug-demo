# pnpm-peer-deps-bug-demo

# Reproduction steps

Just run `make` in the root:

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
make
mkdir -p linked_modules/@prezly
git clone git@github.com:prezly/slate.git linked_modules/@prezly/slate
Cloning into 'linked_modules/@prezly/slate'...
remote: Enumerating objects: 42438, done.
remote: Counting objects: 100% (1448/1448), done.
remote: Compressing objects: 100% (451/451), done.
remote: Total 42438 (delta 1013), reused 1348 (delta 983), pack-reused 40990
Receiving objects: 100% (42438/42438), 18.18 MiB | 2.97 MiB/s, done.
Resolving deltas: 100% (32706/32706), done.
cd linked_modules/@prezly/slate && npm run bootstrap

> bootstrap
> npm ci --legacy-peer-deps

npm WARN deprecated @types/react-overlays@3.1.0: This is a stub types definition. react-overlays provides its own type definitions, so you do not need this installed.

added 2809 packages, and audited 2815 packages in 49s

289 packages are looking for funding
  run `npm fund` for details

83 vulnerabilities (5 moderate, 71 high, 7 critical)

To address issues that do not require attention, run:
  npm audit fix

To address all issues possible (including breaking changes), run:
  npm audit fix --force

Some issues need review, and may require choosing
a different dependency.

Run `npm audit` for details.
cd linked_modules/@prezly/slate && npm run build

> build
> NODE_ENV=production turbo run build

• Packages in scope: @prezly/slate-commons, @prezly/slate-editor, @prezly/slate-lists, @prezly/slate-tables, @prezly/slate-types
• Running build in 5 packages
@prezly/slate-types:build: cache miss, executing 17953e2c97efb564
@prezly/slate-lists:build: cache miss, executing cbef1bf4f9107350
@prezly/slate-types:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-types/.npmrc 
@prezly/slate-lists:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-lists/.npmrc 
@prezly/slate-types:build: 
@prezly/slate-types:build: > @prezly/slate-types@0.80.4 build
@prezly/slate-types:build: > npm run build:types && npm run build:esm
@prezly/slate-types:build: 
@prezly/slate-lists:build: 
@prezly/slate-lists:build: > @prezly/slate-lists@0.80.4 build
@prezly/slate-lists:build: > npm run build:types && npm run build:esm
@prezly/slate-lists:build: 
@prezly/slate-types:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-types/.npmrc 
@prezly/slate-lists:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-lists/.npmrc 
@prezly/slate-types:build: 
@prezly/slate-types:build: > @prezly/slate-types@0.80.4 build:types
@prezly/slate-types:build: > tsc --project .
@prezly/slate-types:build: 
@prezly/slate-lists:build: 
@prezly/slate-lists:build: > @prezly/slate-lists@0.80.4 build:types
@prezly/slate-lists:build: > tsc --project ./tsconfig.build.json
@prezly/slate-lists:build: 
@prezly/slate-types:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-types/.npmrc 
@prezly/slate-lists:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-lists/.npmrc 
@prezly/slate-types:build: 
@prezly/slate-types:build: > @prezly/slate-types@0.80.4 build:esm
@prezly/slate-types:build: > babel ./src --ignore='**/*.test.tsx','**/*.test.ts' --config-file=../../babel.config.json --extensions=.ts,.tsx --source-root=./src --out-dir=./build/esm/
@prezly/slate-types:build: 
@prezly/slate-lists:build: 
@prezly/slate-lists:build: > @prezly/slate-lists@0.80.4 build:esm
@prezly/slate-lists:build: > babel ./src --ignore='**/*.test.tsx','**/*.test.ts' --config-file=../../babel.config.json --extensions=.ts,.tsx --source-root=./src --out-dir=./build/esm/
@prezly/slate-lists:build: 
@prezly/slate-lists:build: Browserslist: caniuse-lite is outdated. Please run:
@prezly/slate-lists:build:   npx browserslist@latest --update-db
@prezly/slate-lists:build:   Why you should do it regularly: https://github.com/browserslist/browserslist#browsers-data-updating
@prezly/slate-types:build: Browserslist: caniuse-lite is outdated. Please run:
@prezly/slate-types:build:   npx browserslist@latest --update-db
@prezly/slate-types:build:   Why you should do it regularly: https://github.com/browserslist/browserslist#browsers-data-updating
@prezly/slate-types:build: Successfully compiled 43 files with Babel (524ms).
@prezly/slate-commons:build: cache miss, executing 96e622db973b6eba
@prezly/slate-lists:build: Successfully compiled 47 files with Babel (626ms).
@prezly/slate-commons:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-commons/.npmrc 
@prezly/slate-commons:build: 
@prezly/slate-commons:build: > @prezly/slate-commons@0.80.4 build
@prezly/slate-commons:build: > npm run build:types && npm run build:esm
@prezly/slate-commons:build: 
@prezly/slate-commons:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-commons/.npmrc 
@prezly/slate-commons:build: 
@prezly/slate-commons:build: > @prezly/slate-commons@0.80.4 build:types
@prezly/slate-commons:build: > tsc --project ./tsconfig.build.json
@prezly/slate-commons:build: 
@prezly/slate-commons:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-commons/.npmrc 
@prezly/slate-commons:build: 
@prezly/slate-commons:build: > @prezly/slate-commons@0.80.4 build:esm
@prezly/slate-commons:build: > babel ./src --ignore='**/*.test.tsx','**/*.test.ts' --config-file=../../babel.config.json --extensions=.ts,.tsx --source-root=./src --out-dir=./build/esm/
@prezly/slate-commons:build: 
@prezly/slate-commons:build: Browserslist: caniuse-lite is outdated. Please run:
@prezly/slate-commons:build:   npx browserslist@latest --update-db
@prezly/slate-commons:build:   Why you should do it regularly: https://github.com/browserslist/browserslist#browsers-data-updating
@prezly/slate-commons:build: Successfully compiled 85 files with Babel (763ms).
@prezly/slate-tables:build: cache miss, executing 2cee200e343e016a
@prezly/slate-tables:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-tables/.npmrc 
@prezly/slate-tables:build: 
@prezly/slate-tables:build: > @prezly/slate-tables@0.80.4 build
@prezly/slate-tables:build: > npm run build:types && npm run build:esm
@prezly/slate-tables:build: 
@prezly/slate-tables:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-tables/.npmrc 
@prezly/slate-tables:build: 
@prezly/slate-tables:build: > @prezly/slate-tables@0.80.4 build:types
@prezly/slate-tables:build: > tsc --project ./tsconfig.build.json
@prezly/slate-tables:build: 
@prezly/slate-tables:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-tables/.npmrc 
@prezly/slate-tables:build: 
@prezly/slate-tables:build: > @prezly/slate-tables@0.80.4 build:esm
@prezly/slate-tables:build: > babel ./src --ignore='**/*.test.tsx','**/*.test.ts' --config-file=../../babel.config.json --extensions=.ts,.tsx --source-root=./src --out-dir=./build/esm/
@prezly/slate-tables:build: 
@prezly/slate-tables:build: Browserslist: caniuse-lite is outdated. Please run:
@prezly/slate-tables:build:   npx browserslist@latest --update-db
@prezly/slate-tables:build:   Why you should do it regularly: https://github.com/browserslist/browserslist#browsers-data-updating
@prezly/slate-tables:build: Successfully compiled 39 files with Babel (644ms).
@prezly/slate-editor:build: cache miss, executing a00412bc2786a7df
@prezly/slate-editor:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-editor/.npmrc 
@prezly/slate-editor:build: 
@prezly/slate-editor:build: > @prezly/slate-editor@0.80.4 build
@prezly/slate-editor:build: > npm run build:sass && npm run build:esm && npm run build:types
@prezly/slate-editor:build: 
@prezly/slate-editor:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-editor/.npmrc 
@prezly/slate-editor:build: 
@prezly/slate-editor:build: > @prezly/slate-editor@0.80.4 build:sass
@prezly/slate-editor:build: > gulp build:sass
@prezly/slate-editor:build: 
@prezly/slate-editor:build: [12:02:28] Using gulpfile ~/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-editor/gulpfile.js
@prezly/slate-editor:build: [12:02:28] Starting 'build:sass'...
@prezly/slate-editor:build: Browserslist: caniuse-lite is outdated. Please run:
@prezly/slate-editor:build:   npx browserslist@latest --update-db
@prezly/slate-editor:build:   Why you should do it regularly: https://github.com/browserslist/browserslist#browsers-data-updating
@prezly/slate-editor:build: [12:02:29] Finished 'build:sass' after 1.21 s
@prezly/slate-editor:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-editor/.npmrc 
@prezly/slate-editor:build: 
@prezly/slate-editor:build: > @prezly/slate-editor@0.80.4 build:esm
@prezly/slate-editor:build: > gulp build:esm
@prezly/slate-editor:build: 
@prezly/slate-editor:build: [12:02:30] Using gulpfile ~/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-editor/gulpfile.js
@prezly/slate-editor:build: [12:02:30] Starting 'build:esm'...
@prezly/slate-editor:build: Browserslist: caniuse-lite is outdated. Please run:
@prezly/slate-editor:build:   npx browserslist@latest --update-db
@prezly/slate-editor:build:   Why you should do it regularly: https://github.com/browserslist/browserslist#browsers-data-updating
@prezly/slate-editor:build: [12:02:38] Finished 'build:esm' after 8.14 s
@prezly/slate-editor:build: npm WARN ignoring workspace config at /home/ivan/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-editor/.npmrc 
@prezly/slate-editor:build: 
@prezly/slate-editor:build: > @prezly/slate-editor@0.80.4 build:types
@prezly/slate-editor:build: > gulp build:types
@prezly/slate-editor:build: 
@prezly/slate-editor:build: [12:02:39] Using gulpfile ~/Workspace/sandbox/pnpm-peer-deps-bug-demo/linked_modules/@prezly/slate/packages/slate-editor/gulpfile.js
@prezly/slate-editor:build: [12:02:39] Starting 'build:types'...
@prezly/slate-editor:build: Browserslist: caniuse-lite is outdated. Please run:
@prezly/slate-editor:build:   npx browserslist@latest --update-db
@prezly/slate-editor:build:   Why you should do it regularly: https://github.com/browserslist/browserslist#browsers-data-updating
@prezly/slate-editor:build: [12:02:49] Finished 'build:types' after 9.89 s

 Tasks:    5 successful, 5 total
Cached:    0 cached, 5 total
  Time:    32.784s 

pnpm link ./linked_modules/@prezly/slate/packages/slate-types
.../@prezly/slate/packages/slate-types   |  WARN  Moving @types/node that was installed by a different package manager to "node_modules/.ignored"
.../@prezly/slate/packages/slate-types   |  WARN  Moving @prezly/uploads that was installed by a different package manager to "node_modules/.ignored"
.../@prezly/slate/packages/slate-types   |  WARN  Moving is-plain-object that was installed by a different package manager to "node_modules/.ignored"
.../@prezly/slate/packages/slate-types   |  +14 +
Packages are hard linked from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/ivan/.local/share/pnpm/store/v3
  Virtual store is at:             linked_modules/@prezly/slate/packages/slate-types/node_modules/.pnpm

node_modules:
+ @prezly/slate-types 0.80.4 <- linked_modules/@prezly/slate/packages/slate-types

.../@prezly/slate/packages/slate-types   | Progress: resolved 14, reused 14, downloaded 0, added 14, done
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
