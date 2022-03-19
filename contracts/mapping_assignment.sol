// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;

contract MappingAssignment {
    struct Entity {
        uint256 data;
        address _address;
    }
    mapping(address => Entity) entityMap;

    function addEntity(uint256 _data) public returns (bool success) {
        entityMap[msg.sender].data = _data;
        entityMap[msg.sender]._address = msg.sender;
        return true;
    }

    function updateEntity(uint256 data) public returns (bool success) {
        entityMap[msg.sender].data = data;
        return true;
    }
}
