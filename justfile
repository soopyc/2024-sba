install:
	pnpm install

update interactive="false":
	#!/usr/bin/env bash
	set -euxo pipefail

	OLD_STORE=$(pnpm config get --local store-dir)
	TMP_STORE=$(mktemp -d)

	cp -r $OLD_STORE/* $TMP_STORE
	chmod u+rw $TMP_STORE -R
	pnpm config set --local store-dir $TMP_STORE
	pnpm install --offline --force

	pnpm update --lockfile-only

	pnpm config set --local store-dir $OLD_STORE
	rm -fr $TMP_STORE
