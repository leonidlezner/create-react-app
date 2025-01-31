#!/bin/bash

printf "Project name: "

read projectname

mkdir $projectname || exit 1

cd $projectname

npm create vite@latest . -- --template react-ts

npm install -D tailwindcss @tailwindcss/vite postcss autoprefixer prettier prettier-plugin-tailwindcss

echo "{}" > .prettierrc.json

mkdir -p .vscode

cat >./.vscode/settings.json <<EOT
{
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.tabSize": 2
}
EOT

curl -s https://raw.githubusercontent.com/leonidlezner/create-react-app/main/snippets/ReactFunctionalComponent.code-snippets > ./.vscode/ReactFunctionalComponent.code-snippets

cat >./src/index.css <<EOT
@import "tailwindcss";
EOT

cat >./src/App.tsx <<EOT
export default function App() {
  return <div className="bg-green-100">Hello, World!</div>;
}
EOT

cat > ./vite.config.ts <<EOT
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
})
EOT

rm ./src/App.css
