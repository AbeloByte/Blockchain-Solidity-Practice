// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/ConsoleLogger.sol";
import "./Secret.sol";

contract ConsoleLoggerTest is Test {
    ConsoleLogger public myConsoleLogger;

    function setUp() public {
        myConsoleLogger = new ConsoleLogger();
    }

    function testWin() public {
        assertEq(myConsoleLogger.winningNumber(Secret.message), Secret.win);
    }
}
