// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/RestrictedAccess.sol";

contract RestrictedAccessTest is Test {
    RestrictedAccess public myRestrictedAccess;
    address administrator = address(2);

    function setUp() public {
        vm.prank(administrator);
        myRestrictedAccess = new RestrictedAccess();
    }

    function testAWithOwner() public {
        vm.prank(administrator);
        myRestrictedAccess.setA(1);
        assertEq(vm.load(address(myRestrictedAccess), convertToBytes32(0)), convertToBytes32(1));
    }

    function testBWithOwner() public {
        vm.prank(administrator);
        myRestrictedAccess.setB(2);
        assertEq(vm.load(address(myRestrictedAccess), convertToBytes32(1)), convertToBytes32(2));
    }

    function testCWithOwner() public {
        vm.prank(administrator);
        myRestrictedAccess.setC(3);
        assertEq(vm.load(address(myRestrictedAccess), convertToBytes32(2)), convertToBytes32(3));
    }

    function testANotOwner() public {
        vm.expectRevert();
        myRestrictedAccess.setA(1);
    }

    function testBNotOwner() public {
        vm.expectRevert();
        myRestrictedAccess.setB(2);
    }

    function testCNotOwner() public {
        vm.expectRevert();
        myRestrictedAccess.setC(3);
    }

    function convertToBytes32(uint256 value) public pure returns (bytes32 result) {
        assembly {
            result := value
        }
    }
}
