// THIS IS AN AUTOMATICALLY GENERATED FILE - DO NOT EDIT
// If changes were needed, please edit nix/vite.config.ts.in instead.

import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	cacheDir: '.cache/vite',
	plugins: [sveltekit()],
	server: {
		fs: {
			allow: ['/nix/store/49qyk977rcdgq0lkcyazxyan0wbiy8hh-soopyc-2024-sba-node-modules-0.0.1+d054511-dirty'],
		},
	},
});
