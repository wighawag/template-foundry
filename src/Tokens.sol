// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Tokens {
	string public constant symbol = "TOKENS";

	function name() public pure returns (string memory) {
		return "Tokens";
	}
}
