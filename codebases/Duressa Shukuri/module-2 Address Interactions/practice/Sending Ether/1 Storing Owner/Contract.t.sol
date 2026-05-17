// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/CustodianStorage.sol";

contract CustodianStorageTest is Test {
    CustodianStorage public myCustodianStorage;
    address msgSender = address(3);

    function setUp() public {
        vm.prank(msgSender);
        myCustodianStorage = new CustodianStorage();
    }

    function testConstructor() public {
        assertEq(myCustodianStorage.custodian(), msgSender);
    }
}
