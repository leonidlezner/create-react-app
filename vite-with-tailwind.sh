#!/bin/bash

printf "Project name: "

read projectname

mkdir $projectname || exit 1

cd $projectname

npm create vite@latest . -- --template react-ts

npm install -D tailwindcss postcss autoprefixer prettier prettier-plugin-tailwindcss

npx tailwindcss init -p

sed -i.bak 's/content: \[\]/content: \[ ".\/index.html", ".\/src\/**\/*.{js,ts,jsx,tsx}" \]/g' tailwind.config.js

rm tailwind.config.js.bak

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
@tailwind base;
@tailwind components;
@tailwind utilities;
EOT

cat >./src/App.tsx <<EOT
export default function App() {
  return <div className="bg-green-100">Hello, World!</div>;
}
EOT

rm ./src/App.css
