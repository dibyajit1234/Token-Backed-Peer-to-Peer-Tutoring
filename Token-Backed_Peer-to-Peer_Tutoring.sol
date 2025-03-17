// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TutoringPlatform {
    string public projectTitle = "Token-backed peer-to-peer tutoring";
    string public projectDescription = "A decentralized tutoring system where payments are made in tokens.";
    
    address public owner;
    mapping(address => bool) public registeredTutors;
    
    event TutorRegistered(address tutor);

    constructor() {
        owner = msg.sender;
    }

    function registerTutor() external {
        require(!registeredTutors[msg.sender], "Tutor already registered");
        registeredTutors[msg.sender] = true;
        emit TutorRegistered(msg.sender);
    }

    function isTutorRegistered(address tutor) external view returns (bool) {
        return registeredTutors[tutor];
    }
}
