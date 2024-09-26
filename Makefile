.PHONY: all
all:
	make build

.PHONY: build
build:
	graph build

.PHONY: deploy
deploy:
	graph build
	graph create --node=http://localhost:8020 tokens
	graph deploy --node=http://localhost:8020 tokens

.PHONY: publish
publish:
	graph build
	graph publish --subgraph-id "<SUBGRAPH ID>"

.PHONY: gui
gui:
	substreams gui ./substreams/antelope-transactions-v0.5.0.spkg -e wax.substreams.pinax.network:443 graph_out -s 326292294 --params "graph_out=code:eosio.token && notif:false"