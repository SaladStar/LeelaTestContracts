// SPDX-License-Identifier: Unlicense
pragma solidity >=0.6.2 <0.9.0;

contract DepositAndWithdraw {

    mapping(address => uint256) public balanceOf;

    function deposit(uint256 amount) public payable {
        require(msg.value == amount);
        balanceOf[msg.sender] += amount;
    }

    function withdraw(uint256 amount) public {
        require(amount <= balanceOf[msg.sender]);
        balanceOf[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}