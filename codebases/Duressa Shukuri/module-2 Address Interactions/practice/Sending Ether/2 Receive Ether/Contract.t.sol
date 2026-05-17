// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/FundReceiver.sol";

contract FundReceiverTest is Test {
    FundReceiver public myFundReceiver;
    address msgSender = address(3);

    function setUp() public {
        hoax(msgSender);
        myFundReceiver = new FundReceiver();
    }

    function testSendEther() public {
        address contractAddr = address(myFundReceiver);

        // send 2 ether without any calldata
        contractAddr.call{ value: 2 ether }("");

        assertEq(contractAddr.balance, 2 ether);
    }
}
