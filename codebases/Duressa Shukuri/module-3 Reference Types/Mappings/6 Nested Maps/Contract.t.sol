// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/NestedRosterLookup.sol";

contract NestedRosterLookupTest is Test {
    NestedRosterLookup public myNestedRosterLookup;
    address a1 = address(2);
    address a2 = address(3);

    function setUp() public {
        myNestedRosterLookup = new NestedRosterLookup();
    }

    function testUnacquainted() public {
        assertEq(uint(myNestedRosterLookup.affiliations(a1, a2)), uint(NestedRosterLookup.ConnectionTypes.Unacquainted));
        assertEq(uint(myNestedRosterLookup.affiliations(a2, a1)), uint(NestedRosterLookup.ConnectionTypes.Unacquainted));
    }

    function testConnectingBoth() public {
        vm.prank(a1);
        myNestedRosterLookup.connectWith(a2, NestedRosterLookup.ConnectionTypes.Friend);
        vm.prank(a2);
        myNestedRosterLookup.connectWith(a1, NestedRosterLookup.ConnectionTypes.Friend);

        assertEq(uint(myNestedRosterLookup.affiliations(a1, a2)), uint(NestedRosterLookup.ConnectionTypes.Friend));
        assertEq(uint(myNestedRosterLookup.affiliations(a2, a1)), uint(NestedRosterLookup.ConnectionTypes.Friend));
    }

    function testConnectingOne() public {
        vm.prank(a1);
        myNestedRosterLookup.connectWith(a2, NestedRosterLookup.ConnectionTypes.Family);

        assertEq(uint(myNestedRosterLookup.affiliations(a1, a2)), uint(NestedRosterLookup.ConnectionTypes.Family));
        assertEq(uint(myNestedRosterLookup.affiliations(a2, a1)), uint(NestedRosterLookup.ConnectionTypes.Unacquainted));
    }
}
