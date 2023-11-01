const config = {
	content: ['./src/**/*.{html,js,svelte,ts}'],

	theme: {
		extend: {},
	},

	plugins: [require('daisyui')],

	daisyui: {
		base: true,
		logs: false,
		themes: [
			{
				light: {
					primary: '#3c9fce',
					secondary: '#6ec1e4',
					accent: '#1d86a8',
					neutral: '#000000',
					'base-100': '#ffffff',
					info: '#95e0f8',
					success: '#1f9352',
					warning: '#ffa800',
					error: '#eb2455',
				},
				dark: {
					// TODO: finish tuning dark mode color.
					primary: '#3c9fce',
					secondary: '#6ec1e4',
					accent: '#1d86a8',
					neutral: '#ffffff',
					'base-100': '#000000',
					info: '#95e0f8',
					success: '#6fd392',
					warning: '#ffa800',
					error: '#eb2455',
				},
			},
		],
	},
};

module.exports = config;
