// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/SelfPurge.sol";

contract SelfPurgeTest is Test {
    SelfPurge public mySelfPurge;
    address msgSender = address(3);
    address aidRecipient = address(4);

    function setUp() public {
        vm.prank(msgSender);
        mySelfPurge = new SelfPurge(aidRecipient);
        address(mySelfPurge).call{ value: 4 ether }("");
        mySelfPurge.disburseFunds();
    }

    function verifyContribution() public {
        assertEq(aidRecipient.balance, 4 ether);
    }

    function testDestruction() public {
        assert(!isContract(address(mySelfPurge)));
    }

    function isContract(address _addr) public view returns (bool) {
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0);
    }
}
