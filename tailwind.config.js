/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/main/webapp/**/*.jsp",
    "./src/main/webapp/**/*.html", // 혹시 모를 html 파일도 포함
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Pretendard', 'sans-serif'],
      },
      colors: {
        primary: '#2563EB', // Royal Blue
        secondary: '#1E40AF',
        dark: '#0F172A', // Slate 900
        light: '#F8FAFC', // Slate 50
      }
    },
  },
  plugins: [],
}