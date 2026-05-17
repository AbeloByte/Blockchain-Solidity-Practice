// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/SignedNumbers.sol";

contract SignedNumbersTest is Test {
    SignedNumbers public mySignedNumbers;

    function setUp() public {
        mySignedNumbers = new SignedNumbers();
    }

    function testSigns() public {
        int8 a = mySignedNumbers.a();
        int8 b = mySignedNumbers.b();
        bool onlyAPositive = a > 0 && b < 0;
        bool onlyBPositive = b > 0 && a < 0;
        assert(onlyAPositive || onlyBPositive);
    }

    function testAbsoluteDifference() public {
        int8 a = mySignedNumbers.a();
        int8 b = mySignedNumbers.b();
        int16 diff = mySignedNumbers.difference();
        int16 expectedDiff = (a > b) ? a - b : b - a;
        assertEq(diff, expectedDiff);
    }
}
