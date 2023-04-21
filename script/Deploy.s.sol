// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-deploy/DeployScript.sol";
import "generated/deployer/DeployerFunctions.g.sol";

contract Deployments is DeployScript {
	using DeployerFunctions for Deployer;

	function deploy() external returns (GreetingsRegistry) {
		return
			deployer.deploy_GreetingsRegistry(
				"Registry",
				"",
				DeployOptions({
					deterministic: 0,
					proxyOnTag: "testnet",
					proxyOwner: vm.envAddress("DEPLOYER")
				})
			);
	}
}
