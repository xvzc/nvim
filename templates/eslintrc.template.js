module.exports = {
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/eslint-recommended",
    "plugin:prettier/recommended"
  ],
  plugins: ["@typescript-eslint"],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    project: "tsconfig.json",
    tsconfigRootDir: __dirname,
    sourceType: "module",
  },
  root: true,
  env: {
    node: true,
    jest: true,
  },
  ignorePatterns: [".eslintrc.js"],
  rules: {
    quotes: ["error", "double"],
    "prettier/prettier": [
      "error",
      {
        usePrettierrc: true,
      },
    ],
    // "no-trailing-spaces": "error",
    // "array-bracket-spacing": ["error", "never"],
    // "computed-property-spacing": ["error", "never"],
    // "object-curly-spacing": ["error", "always"],
    // "@typescript-eslint/comma-spacing": ["error"],
    // "@typescript-eslint/object-curly-spacing": ["error", "always"],
    // "@typescript-eslint/type-annotation-spacing": "error",
    "@typescript-eslint/interface-name-prefix": "off",
    "@typescript-eslint/explicit-function-return-type": "off",
    "@typescript-eslint/explicit-module-boundary-types": "off",
    "@typescript-eslint/no-explicit-any": "off",
    "@typescript-eslint/no-unused-vars": [
      "warn",
      {
        argsIgnorePattern: "^_",
        varsIgnorePattern: "^_",
      },
    ],
  },
}

