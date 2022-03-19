// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;

contract mappedWithUnorderedIndexAndDelete {
    struct EntityStruct {
        uint256 entityData;
        uint256 listPointer;
    }

    mapping(address => EntityStruct) public entityStructs;
    address[] public entityList;

    function newEntity(address entityAddress, uint256 entityData)
        public
        returns (bool success)
    {
        if (isEntity(entityAddress)) revert();
        entityStructs[entityAddress].entityData = entityData;
        entityList.push(entityAddress);
        entityStructs[entityAddress].listPointer = entityList.length - 1;
        return true;
    }

    function isEntity(address entityAddress)
        public
        view
        returns (bool isIndeed)
    {
        if (entityList.length == 0) return false;
        return
            entityList[entityStructs[entityAddress].listPointer] ==
            entityAddress;
    }

    function deleteEntity(address entityAddress) public returns (bool success) {
        if (!isEntity(entityAddress)) revert();
        uint256 rowToDelete = entityStructs[entityAddress].listPointer;
        address entityToMove = entityList[entityList.length - 1];
        entityList[rowToDelete] = entityToMove;
        entityStructs[entityToMove].listPointer = rowToDelete;
        entityList.pop();
        delete entityStructs[entityAddress];
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
