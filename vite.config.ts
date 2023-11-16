// THIS IS AN AUTOMATICALLY GENERATED FILE - DO NOT EDIT
// If changes were needed, please edit nix/vite.config.ts.in instead.

import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	cacheDir: '.cache/vite',
	plugins: [sveltekit()],
	server: {
		fs: {
			allow: ['/nix/store/hc22gbdnfvm45rvqa4w4r3lmh0x8y1wr-soopyc-2024-sba-node-modules-0.0.1+fff1a45-dirty'],
		},
	},
});
