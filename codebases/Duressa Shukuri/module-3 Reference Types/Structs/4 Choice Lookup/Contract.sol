// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract BallotOptionLookup {
	enum Choices { Affirmative, Negative }

    struct Ballot {
        Choices choice;
        address voter;
    }

    Ballot[] public ballotRecords;

    function castBallot(Choices choice) external {
        ballotRecords.push(Ballot(choice, msg.sender));
    }

    function hasVoted(address voter) external view returns (bool) {
        for (uint i = 0; i < ballotRecords.length; i++) {
            if (ballotRecords[i].voter == voter) {
                return true;
            }
        }

        return false;
    }

    function locateSelection(address voter) external view returns (Choices) {
        for (uint i = 0; i < ballotRecords.length; i++) {
            if (ballotRecords[i].voter == voter) {
                return ballotRecords[i].choice;
            }
        }

        revert("Ballot not found");
    }
}
