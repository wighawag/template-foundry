// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/GreetingsRegistry.sol";
import "../script/Deploy.s.sol";

contract GreetingsRegistryTest is Test {
	GreetingsRegistry public registry;

	function setUp() public {
		Deployments deployments = new Deployments();
		deployments.run();
		Deployer deployer = deployments.deployer();

		registry = GreetingsRegistry(deployer.getAddress("Registry"));
		registry.setMessage("hello", 1);
	}

	function testSetMessage() public {
		registry.setMessage("hello2", 1);
		assertEq(registry.messages(address(this)).content, "hello2");
	}
}
