// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/CustomEnums.sol";

contract CustomEnumsTest is Test {
    CustomEnums public myCustomEnums;

    function setUp() public {
        myCustomEnums = new CustomEnums();
    }

    function checkEdibleEnums() public {
        CustomEnums.Edibles edibleItem1 = myCustomEnums.edibleItem1();
        CustomEnums.Edibles edibleItem2 = myCustomEnums.edibleItem2();
        CustomEnums.Edibles edibleItem3 = myCustomEnums.edibleItem3();
        CustomEnums.Edibles edibleItem4 = myCustomEnums.edibleItem4();

        // Enumerations translate directly to uint8 positions based on their position
        // The initial option correlates to 0, then 1, 2, 3 etc...
        uint sumOfEnums = uint8(edibleItem1) + uint8(edibleItem2) + uint8(edibleItem3) + uint8(edibleItem4);
        assertGe(sumOfEnums, 6);
    }
}
