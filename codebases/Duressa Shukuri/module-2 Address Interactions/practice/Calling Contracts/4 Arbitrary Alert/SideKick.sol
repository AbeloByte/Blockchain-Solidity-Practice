// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract Companion {
    function relay(address hero, bytes calldata data) external {
        (bool success, ) = hero.call(data);
        require(success);
    }
}
