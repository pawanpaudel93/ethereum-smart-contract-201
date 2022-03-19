// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;

contract simpleList {
    struct EntityStruct {
        address entityAddress;
        uint256 entityData;
    }

    EntityStruct[] public entityStructs;

    function newEntity(address entityAddress, uint256 entityData)
        public
        returns (EntityStruct memory)
    {
        EntityStruct memory newEntity;
        newEntity.entityAddress = entityAddress;
        newEntity.entityData = entityData;
        entityStructs.push(newEntity);
        return entityStructs[entityStructs.length - 1];
    }

    function getEntityCount() public view returns (uint256 entityCount) {
        return entityStructs.length;
    }
}
