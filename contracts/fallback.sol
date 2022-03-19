// CHECKS, EFFECTS (changing state), INTERACTION - pattern
// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;

contract bank {
    mapping(address => uint256) balance;

    function withdraw() public {
        require(balance[msg.sender] > 0);
        address payable senderAddress = payable(msg.sender);
        senderAddress.transfer(balance[senderAddress]);
        balance[msg.sender] = 0;
    }
}

contract attack {
    // UNSAFE
    uint256 x;

    function start() public {
        // deposint funds to bank
        // call to withdraw
    }

    // calls with no data
    receive() external payable {
        // new call to withdraw
    }

    // no function matches
    fallback() external payable {}
}
