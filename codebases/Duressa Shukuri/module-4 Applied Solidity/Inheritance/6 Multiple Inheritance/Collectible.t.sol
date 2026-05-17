// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/BaseContracts.sol";
import "../src/AssetItem.sol";

contract OwnableTest is Test {
    AssetItem public assetItem;

    function setUp() public {
        assetItem = new AssetItem();
    }

    function testAsOwner() public {
        assetItem.markPrice(5);
        assetItem.transfer(address(4));

        vm.startPrank(address(4));
        assetItem.markPrice(10);
        assertEq(assetItem.price(), 10);
    }

    function testAsNonOwner() public {
        vm.startPrank(address(2));

        vm.expectRevert();
        assetItem.markPrice(5);

        vm.expectRevert();
        assetItem.transfer(address(4));
    }
}
