import js from "@eslint/js";
import ts from "typescript-eslint";
import svelte from "eslint-plugin-svelte";
import prettier from "eslint-config-prettier";
import svelteParser from "svelte-eslint-parser";

export default [
  {
    ignores: [
      "build/**",
      ".svelte-kit/**",
      "dist/**",
      "node_modules/**",
      "deploy/**",
    ],
  },

  js.configs.recommended,
  ...ts.configs.recommended,
  ...svelte.configs["flat/recommended"],
  prettier,

  // Svelte
  {
    files: ["**/*.svelte"],
    languageOptions: {
      parser: svelteParser,
      parserOptions: {
        parser: ts.parser,
      },
    },
  },

  // TypeScript
  {
    files: ["**/*.ts"],
    languageOptions: {
      parser: ts.parser,
    },
  },
];
