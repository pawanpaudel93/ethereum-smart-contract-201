// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;

contract arrayWithUniqueIds {
    struct EntityStruct {
        address entityAddress;
        uint256 entityData;
    }

    EntityStruct[] public entityStructs;
    mapping(address => bool) knownEntity;

    function isEntity(address entityAddress)
        public
        view
        returns (bool isIndeed)
    {
        return knownEntity[entityAddress];
    }

    function newEntity(address entityAddress, uint256 entityData)
        public
        returns (EntityStruct memory)
    {
        if (isEntity(entityAddress)) revert();
        EntityStruct memory newEntity;
        newEntity.entityAddress = entityAddress;
        newEntity.entityData = entityData;
        entityStructs.push(newEntity);
        return entityStructs[entityStructs.length - 1];
    }

    function updateEntity(
        uint256 rowNumber,
        address entityAddress,
        uint256 entityData
    ) public returns (bool) {
        if (isEntity(entityAddress)) revert();
        if (entityStructs[rowNumber].entityAddress != entityAddress) revert();
        entityStructs[rowNumber].entityData = entityData;
        return true;
    }

    function getEntityCount() public view returns (uint256 entityCount) {
        return entityStructs.length;
    }
}
