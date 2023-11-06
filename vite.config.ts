import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	cacheDir: '.cache/vite',
	plugins: [sveltekit()],
});
