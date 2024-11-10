// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Primitives{
    bool public boo;//true/false
    uint8 num_1=255; //uint8最大值是255，也就是2的8次方-1
    uint num_2=2**256-1;//是2的256次方-1
    int8 num_3=-128; //int8最小值是-2**7,最大值是2**7
    int num_4=2**255-1;//是2的256次方-1
    address public addr=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    function get() public view returns(uint){
        return num_1;
    }
    function getNum3() public view returns(int){
        return num_3;
    }
        function getNum4() public view returns(int){
        return num_4;
    }
    function getAddr() public view returns(address){
        return addr;
    }
}