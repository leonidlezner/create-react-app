#!/bin/bash

printf "Project name: "

read projectname

npx create-react-app $projectname --template typescript || exit 1

cd $projectname

npm install -D tailwindcss postcss autoprefixer prettier prettier-plugin-tailwindcss || exit 1

npx tailwindcss init -p

sed -i '' 's/content: \[\]/content: \[ ".\/src\/**\/*.{js,ts,jsx,tsx}" \]/g' tailwind.config.js

touch .prettierrc.json

mkdir -p .vscode

cat >./.vscode/settings.json <<EOT
{
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode"
}
EOT

cat >./src/index.css <<EOT
@tailwind base;
@tailwind components;
@tailwind utilities;
EOT

cat >./src/App.ts <<EOT
export default function App() {
  return <div></div>;
}
EOT

rm ./src/App.css
rm ./src/logo.svg
