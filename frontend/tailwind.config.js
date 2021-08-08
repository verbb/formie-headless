module.exports = {
    purge: {
        content: [
            './index.html',
            './src/**/*.{js,vue}',
        ],
    },
    theme: {
        extend: {
            container: {
                center: true,
                padding: {
                    DEFAULT: '1rem',
                    md: '2rem',
                },
            },
        },
    },
    plugins: [
        require('@tailwindcss/forms'),
    ],
}
