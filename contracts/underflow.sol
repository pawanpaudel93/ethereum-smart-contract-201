// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;

// import "./Safemath.sol";

contract UnderFlow {
    uint8 n = 255;

    function add() public returns (uint8) {
        n += 1;
        return n;
    }

    function subtract() public returns (uint8) {
        n -= 1;
        return n;
    }
}
