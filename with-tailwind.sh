#!/bin/bash

npx create-react-app $1

cd $1

npm install -D tailwindcss postcss autoprefixer prettier prettier-plugin-tailwindcss

npx tailwindcss init -p

touch .prettierrc.json

mkdir .vscode
