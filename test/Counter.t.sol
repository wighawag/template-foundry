// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Counter} from "src/Counter.sol";
import {Deployments} from "script/Deploy.s.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Deployments().deploy();
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
