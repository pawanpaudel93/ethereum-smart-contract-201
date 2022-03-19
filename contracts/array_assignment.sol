// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;

contract ArrayAssignment {
    struct Entity {
        uint256 data;
        address _address;
    }
    Entity[] public entities;

    function addEntity(uint256 _data) public returns (bool success) {
        Entity memory entity = Entity(_data, msg.sender);
        entities.push(entity);
        return true;
    }

    function updateEntity(uint256 row, uint256 data)
        public
        returns (bool success)
    {
        require(row <= entities.length - 1, "No entity found");
        entities[row].data = data;
        return true;
    }
}
