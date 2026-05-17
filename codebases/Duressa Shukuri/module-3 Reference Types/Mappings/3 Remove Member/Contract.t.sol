// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/MemberExcluder.sol";

contract MemberExcluderTest is Test {
    MemberExcluder public myMemberExcluder;
    address member1 = address(2);
    address member2 = address(3);

    function setUp() public {
        myMemberExcluder = new MemberExcluder();
        myMemberExcluder.enrollParticipant(member1);
        myMemberExcluder.enrollParticipant(member2);
    }

    function testMembers() public {
        assertEq(myMemberExcluder.checkParticipant(member1), true);
        assertEq(myMemberExcluder.checkParticipant(member2), true);
    }

    function verifyExpulsion() public {
        myMemberExcluder.expelParticipant(member1);
        assertEq(myMemberExcluder.checkParticipant(member1), false);
        assertEq(myMemberExcluder.checkParticipant(member2), true);

        myMemberExcluder.expelParticipant(member2);
        assertEq(myMemberExcluder.checkParticipant(member1), false);
        assertEq(myMemberExcluder.checkParticipant(member2), false);
    }
}
