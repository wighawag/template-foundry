// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Deployer} from "forge-deploy/Deployer.sol";
import {Counter} from "src/Counter.sol";

contract UpdateCounterScript is Script {
    function setUp() public {}

    function run(uint256 newNumber) public {
        Counter counter = Counter(new Deployer().getAddress("MyCounter"));
        console.log(string.concat("previous number: ", vm.toString(counter.number())));
        vm.broadcast();
        counter.setNumber(newNumber);
        console.log(string.concat("new number: ", vm.toString(counter.number())));
    }
}
