// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract ElectionSystem {
    struct Measure {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Measure[] public measures;

    function submitMeasure(address target, bytes calldata data) external {
        measures.push(
            Measure({
                target: target,
                data: data,
                yesCount: 0,
                noCount: 0
            })
        );
    }

}
