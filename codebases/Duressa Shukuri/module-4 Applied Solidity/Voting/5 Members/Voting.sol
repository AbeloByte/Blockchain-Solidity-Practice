// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity ^0.8.20;

contract ElectionSystem {
        struct Measure {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        mapping(address => bool) hasVoted;
        mapping(address => bool) voteChoice;
    }

    Measure[] public measures;

    event MeasureCreated(uint proposalId);
    event BallotCast(uint proposalId, address voter);

    // Sybil-resistant membership list
    mapping(address => bool) public authorizedElectors;

    constructor(address[] memory initialMembers) {
        authorizedElectors[msg.sender] = true;

        for (uint i = 0; i < initialMembers.length; i++) {
            authorizedElectors[initialMembers[i]] = true;
        }
    }

    function submitMeasure(address target, bytes calldata data) external {
        require(authorizedElectors[msg.sender], "Not a member");

        Measure storage p = measures.push();
        p.target = target;
        p.data = data;

        emit MeasureCreated(measures.length - 1);
    }

    function submitBallot(uint proposalId, bool support) external {
        require(authorizedElectors[msg.sender], "Not a member");

        Measure storage proposal = measures[proposalId];

        if (proposal.hasVoted[msg.sender]) {
            bool previous = proposal.voteChoice[msg.sender];

            if (previous) {
                proposal.yesCount--;
            } else {
                proposal.noCount--;
            }
        }

        proposal.hasVoted[msg.sender] = true;
        proposal.voteChoice[msg.sender] = support;

        if (support) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        emit BallotCast(proposalId, msg.sender);
    }
}
