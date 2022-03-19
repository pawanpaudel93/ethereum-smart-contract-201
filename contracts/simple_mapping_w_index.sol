// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;

contract MappedStructWithIndex {
    struct EntityStruct {
        uint256 entityData;
        bool isEntity;
    }

    mapping(address => EntityStruct) public entityStructs;
    address[] public entityList;

    function newEntity(address entityAddress, uint256 entityData)
        public
        returns (uint256)
    {
        if (isEntity(entityAddress)) revert();
        entityStructs[entityAddress].entityData = entityData;
        entityStructs[entityAddress].isEntity = true;
        entityList.push(entityAddress);
        return entityList.length - 1;
    }

    function isEntity(address entityAddress)
        public
        view
        returns (bool isIndeed)
    {
        return entityStructs[entityAddress].isEntity;
    }

    function deleteEntity(address entityAddress) public returns (bool success) {
        if (!isEntity(entityAddress)) revert();
        entityStructs[entityAddress].isEntity = false;
        return true;
    }

    function updateEntity(address entityAddress, uint256 entityData)
        public
        returns (bool success)
    {
        if (!isEntity(entityAddress)) revert();
        entityStructs[entityAddress].entityData = entityData;
        return true;
    }
}
