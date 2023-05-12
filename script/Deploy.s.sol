// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {DeployScript, Deployer} from "forge-deploy/DeployScript.sol";
import {ProxiedDeployerFunctions, ProxiedDeployOptions} from "generated/deployer/ProxiedDeployerFunctions.g.sol";
import {DeployerFunctions} from "generated/deployer/DeployerFunctions.g.sol";
import {GreetingsRegistry} from "src/GreetingsRegistry.sol";

contract DeploymentsProcedure is DeployScript {
    // here we use the Default Deployer Functions generated from the builtin-template
    using DeployerFunctions for Deployer;
    // here we use the forge-deploy-proxy functions generated from that package's template
    using ProxiedDeployerFunctions for Deployer;

    function deploy() external returns (GreetingsRegistry) {
        deployer.deploy_GreetingsRegistry("Registry_01", "hello");
        deployer.deploy_GreetingsRegistry("Registry_02", "hello");

        return deployer.deploy_GreetingsRegistry(
            "Registry", "", ProxiedDeployOptions({proxyOnTag: "testnet", proxyOwner: vm.envAddress("DEPLOYER")})
        );
    }
}
