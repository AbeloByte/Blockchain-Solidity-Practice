// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract SingleBallotSelection {
	enum Choices { Affirmative, Negative }

    struct Ballot {
        Choices choice;
        address voter;
    }

    Ballot[] public ballotRecords;

    function castBallot(Choices choice) external {
        ballotRecords.push(Ballot(choice, msg.sender));
    }

    function votedBefore(address voter) external view returns (bool) {
        for (uint i = 0; i < ballotRecords.length; i++) {
            if (ballotRecords[i].voter == voter) {
                return true;
            }
        }

        return false;
    }

    function findChoice(address voter) external view returns (Choices) {
        for (uint i = 0; i < ballotRecords.length; i++) {
            if (ballotRecords[i].voter == voter) {
                return ballotRecords[i].choice;
            }
        }

        revert("Ballot not found");
    }
}
