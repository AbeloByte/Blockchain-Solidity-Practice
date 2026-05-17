// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Champion.sol";
import "../src/Companion.sol";

contract ContractTest is Test {
    Companion public sidekick;
    Champion public hero;

    function setUp() public {
        hero = new Champion();
        sidekick = new Companion();
    }

    function testMakeContact() public {
        sidekick.makeContact(address(hero));
        assertGt(hero.lastContact(), 0, "it should have set the last contact");
    }
}
