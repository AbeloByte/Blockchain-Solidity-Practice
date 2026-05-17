// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/AdminRestriction.sol";

contract AdminRestrictionTest is Test {
    AdminRestriction public myAdminRestriction;
    address administrator = address(2);

    function setUp() public {
        hoax(administrator);
        myAdminRestriction = new AdminRestriction{ value: 1 ether }();
    }

    function testAsOwner() public {
        vm.prank(administrator);
        uint balanceBefore = address(administrator).balance;
        myAdminRestriction.withdraw();
        uint balanceAfter = address(administrator).balance;
        assertEq(balanceAfter - balanceBefore, 1 ether);
    }

    function testAsNotOwner() public {
        vm.prank(address(3));
        vm.expectRevert();
        myAdminRestriction.withdraw();
    }
}
