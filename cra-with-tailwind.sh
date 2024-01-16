#!/bin/bash

printf "Project name: "

read projectname

mkdir $projectname || exit 1

cd $projectname

npx create-react-app . --template typescript

npm install -D tailwindcss postcss autoprefixer prettier prettier-plugin-tailwindcss

npx tailwindcss init -p

sed -i.bak 's/content: \[\]/content: \[ ".\/src\/**\/*.{js,ts,jsx,tsx}" \]/g' tailwind.config.js

echo "{}" > .prettierrc.json

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

cat >./src/App.tsx <<EOT
export default function App() {
  return <div></div>;
}
EOT

rm ./src/App.css
rm ./src/logo.svg
