import { createTestClient, createPublicClient, type Chain, http } from "viem";
import { localhost } from "viem/chains";

/**
 * The id of the current test worker.
 *
 * This is used by the anvil proxy to route requests to the correct anvil instance.
 */
export const pool = Number(process.env.VITEST_POOL_ID ?? 1);
export const anvil = {
  ...localhost,
  rpcUrls: {
    default: {
      // Note how we append the worker id to the local rpc urls.
      http: [`http://127.0.0.1:8546/${pool}`],
      webSocket: [`ws://127.0.0.1:8546/${pool}`],
    },
    public: {
      // Note how we append the worker id to the local rpc urls.
      http: [`http://127.0.0.1:8546/${pool}`],
      webSocket: [`ws://127.0.0.1:8546/${pool}`],
    },
  },
} as const satisfies Chain;

export const testClient = createTestClient({
  chain: anvil,
  mode: "anvil",
  transport: http(),
});

export const publicClient = createPublicClient({
  chain: anvil,
  transport: http(),
});
