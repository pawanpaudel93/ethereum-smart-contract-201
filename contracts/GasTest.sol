// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;

contract GasTest {
    function testExternal(uint256[] memory numbers) external returns (uint256) {
        return numbers[0];
    }

    function testPublic(uint256[] memory numbers) public returns (uint256) {
        return numbers[0];
    }
}
