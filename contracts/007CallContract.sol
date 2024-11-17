// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./OtherContract.sol";

contract CallContract{
    function callSetNum(address addr,uint256 n) external {
       OtherContract other = OtherContract(addr);
       other.setNum(n);
    }
    //调用合约
    function callGetNum(OtherContract addr) external view returns (uint256 n){
        n = addr.getNum();
    }
        //调用合约
    function callGetNum2(OtherContract addr) external view returns (uint256 n){
        OtherContract other = OtherContract(addr);
        n = other.getNum();
    }
    function setNumTransferETH(address addr, uint256 n) payable external {
        OtherContract other = OtherContract(addr);

        // 先转移ETH
        (bool sent, ) = addr.call{value: msg.value}("");
        require(sent, "ETH transfer failed");

        // 再调用setNum函数设置数值
        other.setNum(n);
    }

}