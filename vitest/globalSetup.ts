import { startProxy } from "@viem/anvil";
import { FORK_BLOCK_NUMBER, FORK_URL } from "./constants";
import { execFileSync } from "child_process";

export default async function () {
  await startProxy({
    port: 8546, // By default, the proxy will listen on port 8545.
    host: "::", // By default, the proxy will listen on all interfaces.
    options: {
      // chainId: 123,
      forkUrl: FORK_URL,
      forkBlockNumber: FORK_BLOCK_NUMBER,
    },
  });

  execFileSync("pnpm", ["run", "deploy", "test"], { stdio: "inherit" });
}
