// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {GreetingsRegistry} from "src/GreetingsRegistry.sol";
import {DeploymentsProcedure} from "script/Deploy.s.sol";
import {Deployer, getDeployer} from "forge-deploy/Deployer.sol";
import {EIP173Proxy} from "forge-deploy-proxy/ForgeDeploy_EIP173Proxy.sol";

contract GreetingsRegistryTest is Test {
    address constant RANDOM_ADMIN = 0x0000000000000000000000000000000000000042;

    Deployer deployer;
    GreetingsRegistry public registry;
    DeploymentsProcedure procedure;

    function setUp() public {
        deployer = getDeployer();
        deployer.setAutoBroadcast(false);

        procedure = new DeploymentsProcedure();
        registry = procedure.deploy();

        registry.setMessage("hello", 1);
    }

    function testMessage() public {
        assertEq(registry.messages(address(this)).content, "hello");
    }

    function testSetMessage() public {
        registry.setMessage("hello2", 1);
        assertEq(registry.messages(address(this)).content, "hello2");
    }

    function testUpgrade() public {
        // we need the prank as the deploy script set the proxyOwner to be vm.envAddress("DEPLOYER")
        deployer.activatePrank(vm.envAddress("DEPLOYER"));
        procedure.deploy();
    }
}
