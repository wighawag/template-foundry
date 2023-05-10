import { defineConfig } from "vitest/config";

export default defineConfig({
  test: {
    globalSetup: ["./vitest/globalSetup.ts"],
    setupFiles: ["./vitest/setup.ts"],
  },
});
