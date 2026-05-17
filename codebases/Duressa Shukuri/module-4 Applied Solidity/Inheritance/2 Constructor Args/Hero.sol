// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract Champion {
	uint public health;
	constructor(uint _health) {
		health = _health;
	}

	function takeDamage(uint damage) public {
		health -= damage;
	}
}
