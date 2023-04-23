// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {DeployScript, Deployer} from "forge-deploy/DeployScript.sol";
import {DeployerFunctions} from "generated/deployer/DeployerFunctions.g.sol";
import {Counter} from "src/Counter.sol";

contract Deployments is DeployScript {
    using DeployerFunctions for Deployer;

    function deploy() external returns (Counter) {
        return deployer.deploy_Counter("Counter");
    }
}
