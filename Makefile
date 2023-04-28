.PHONY: pnpm-link

pnpm-link: linked_modules/@prezly/slate/build
	pnpm link ./linked_modules/@prezly/slate/packages/slate-types
	pnpm link ./linked_modules/@prezly/slate/packages/slate-commons

linked_modules/@prezly/slate/build: linked_modules/@prezly/slate/node_modules
	cd linked_modules/@prezly/slate && npm run build

linked_modules/@prezly/slate/node_modules: linked_modules/@prezly/slate
	cd linked_modules/@prezly/slate && npm run bootstrap

linked_modules/@prezly/slate: linked_modules/@prezly
	git clone git@github.com:prezly/slate.git linked_modules/@prezly/slate

linked_modules/@prezly:
	mkdir -p linked_modules/@prezly