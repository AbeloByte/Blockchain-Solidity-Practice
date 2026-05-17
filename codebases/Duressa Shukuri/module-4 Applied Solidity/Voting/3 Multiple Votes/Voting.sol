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

    // Events
    event MeasureCreated(uint proposalId);
    event BallotCast(uint proposalId, address voter);

    function submitMeasure(address target, bytes calldata data) external {
        Measure storage p = measures.push();
        p.target = target;
        p.data = data;

        emit MeasureCreated(measures.length - 1);
    }

    function submitBallot(uint proposalId, bool support) external {
        Measure storage proposal = measures[proposalId];

        // handle vote change
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
