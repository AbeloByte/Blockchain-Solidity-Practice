// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/PersistentArrayFilter.sol";

contract PersistentArrayFilterTest is Test {
    PersistentArrayFilter public myPersistentArrayFilter;
    uint256[] arr;

    function setUp() public {
        myPersistentArrayFilter = new PersistentArrayFilter();
    }

    function testFilter1() public {
        arr.push(1);
        arr.push(2);
        arr.push(4);
        myPersistentArrayFilter.filterEven(arr);

        assertEq(myPersistentArrayFilter.evenStorageArray(0), 2);
        assertEq(myPersistentArrayFilter.evenStorageArray(1), 4);

        vm.expectRevert();
        myPersistentArrayFilter.evenStorageArray(2);
    }

    function testFilter2() public {
        arr.push(1);
        arr.push(12);
        arr.push(302);
        arr.push(7);
        arr.push(10);
        myPersistentArrayFilter.filterEven(arr);

        assertEq(myPersistentArrayFilter.evenStorageArray(0), 12);
        assertEq(myPersistentArrayFilter.evenStorageArray(1), 302);
        assertEq(myPersistentArrayFilter.evenStorageArray(2), 10);

        vm.expectRevert();
        myPersistentArrayFilter.evenStorageArray(3);
    }
}
