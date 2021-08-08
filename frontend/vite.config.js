import path from 'path';

// Vite Plugins
import VuePlugin from '@vitejs/plugin-vue';
import EslintPlugin from 'vite-plugin-eslint';

export default ({ command }) => ({
    plugins: [
        // Keep JS looking good with eslint
        // https://github.com/gxmari007/vite-plugin-eslint
        EslintPlugin({
            cache: false,
            fix: true,
            include: './**/*.{js,vue}',
        }),

        // Vue 3 support
        // https://github.com/vitejs/vite/tree/main/packages/plugin-vue
        VuePlugin(),
    ],

    resolve: {
        alias: {
            // Allow us to use `@/` in JS, CSS and Twig for ease of development.
            '@': path.resolve('./src'),

            // Allow us to use `@utils/` in JS for misc utilities.
            '@utils': path.resolve('./src/utils'),

            // Allow us to use `@components/` in JS/Vue for Vue components.
            '@components': path.resolve('./src/components'),

            // Allow us to use `@mixins/` in JS/Vue for Vue mixins.
            '@mixins': path.resolve('./src/mixins'),

            // Allow us to use `@graphql/` in JS/Vue for GraphQL queries.
            '@graphql': path.resolve('./src/graphql'),
        },
    },
})
