// SPDX-License-Identifier: MIT
// Code Author: Duressa Shukuri
pragma solidity 0.8.20;

contract RevisedBallotSelection {
	  enum Choices { Affirmative, Negative }

    struct Ballot {
        Choices choice;
        address voter;
    }

    Ballot[] public ballotRecords;

    function castBallot(Choices choice) external {
        require(!hasVoted(msg.sender), "Already voted");

        ballotRecords.push(Ballot(choice, msg.sender));
    }

    function hasVoted(address voter) public view returns (bool) {
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

    function reviseBallot(Choices newChoice) external {
        for (uint i = 0; i < ballotRecords.length; i++) {
            if (ballotRecords[i].voter == msg.sender) {
                ballotRecords[i].choice = newChoice;
                return;
            }
        }

        revert("Ballot not found");
    }
}
