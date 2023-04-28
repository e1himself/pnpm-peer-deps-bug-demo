.PHONY: pnpm-link

pnpm-link: node_modules linked_modules/@prezly/slate/build
	pnpm link ./linked_modules/@prezly/slate/packages/slate-types
	pnpm link ./linked_modules/@prezly/slate/packages/slate-commons

linked_modules/@prezly/slate/build: linked_modules/@prezly/slate/node_modules
	cd linked_modules/@prezly/slate && npm run build

linked_modules/@prezly/slate/node_modules: linked_modules/@prezly/slate
	cd linked_modules/@prezly/slate && npm run bootstrap
	# Patch linked module to explicitly react@18
	cd linked_modules/@prezly/slate && npm add react@18 react-dom@18
	cd linked_modules/@prezly/slate && npm rm react -w packages/slate-commons && npm add react@18 -w packages/slate-commons

linked_modules/@prezly/slate: linked_modules/@prezly
	git clone git@github.com:prezly/slate.git linked_modules/@prezly/slate

linked_modules/@prezly:
	mkdir -p linked_modules/@prezly

node_modules:
	pnpm install