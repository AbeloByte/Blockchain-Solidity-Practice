// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/StackSociety.sol";

contract StackSocietyTest is Test {
    StackSociety public stackSociety;
    address member1 = address(2);
    address member2 = address(3);
    address nonMember1 = address(4);
    address nonMember2 = address(5);

    function setUp() public {
        stackSociety = new StackSociety();
        stackSociety.enrollParticipant(member1);
        stackSociety.enrollParticipant(member2);
    }

    function testMembers() public {
        assertEq(stackSociety.isParticipant(member1), true);
        assertEq(stackSociety.isParticipant(member2), true);
    }

    function testNonMembers() public {
        assertEq(stackSociety.isParticipant(nonMember1), false);
        assertEq(stackSociety.isParticipant(nonMember2), false);
    }
}
