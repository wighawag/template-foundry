// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Deployer} from "forge-deploy/Deployer.sol";
import {Counter} from "src/Counter.sol";

contract UpdateCounterScript is Script {
    function setUp() public {}

    function run(uint256 newNumber) public {
        // Note that here we get the address without type-safety
        // There are 2 reasons for it
        // Once a contract is deployed, it is not anymore attached to the code present in the source folder
        // here we assume this is the case and cast it
        // Furthermore, we want our script to work on multiple chain
        // And while this is likely the same name contract will have the same interface, it is not necessarely always the case
        // After an upgrade, some network could be out of sync for a period
        // Having said all that, forge-deploy might add some generated code to deal with it in the future
        Counter counter = Counter(new Deployer().getAddress("MyCounter"));

        console.log(string.concat("previous number: ", vm.toString(counter.number())));
        vm.broadcast();
        counter.setNumber(newNumber);
        console.log(string.concat("new number: ", vm.toString(counter.number())));
    }
}
