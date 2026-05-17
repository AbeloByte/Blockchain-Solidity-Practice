// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Champion.sol";
import "../src/SuperHeroes.sol";

contract EscrowTest is Test {
    Fighter public fighter;
    Wizard public wizard;

    function setUp() public {
        fighter = new Fighter();
        wizard = new Wizard();
    }

    function testWarrior() public {
        assertEq(fighter.health(), 100);
        fighter.takeDamage(10);
        assertEq(fighter.health(), 90);
    }

    function testMage() public {
        assertEq(wizard.health(), 100);
        wizard.takeDamage(10);
        assertEq(wizard.health(), 90);
    }
}
