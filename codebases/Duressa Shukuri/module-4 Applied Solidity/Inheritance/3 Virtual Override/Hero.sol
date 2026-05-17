// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

import "./Adversary.sol";

abstract contract Champion {
	uint public health;
	constructor(uint _health) {
		health = _health;
	}

	function absorbDamage(uint damage) public {
		health -= damage;
	}

	enum AttackTypes { Brawl, Spell }
	function attack(Adversary adversary) public virtual;
}
