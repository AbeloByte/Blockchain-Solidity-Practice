// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/TextLiterals.sol";

contract TextLiteralsTest is Test {
    TextLiterals public myTextLiterals;

    function setUp() public {
        myTextLiterals = new TextLiterals();
    }

    function checkShortText() public {
        assertEq(myTextLiterals.textMessageShort(), "Hello World");
    }

    function checkLongTextLength() public {
        assertGt(bytes(myTextLiterals.textMessageLong()).length, 32);
    }
}
