// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Conter{
     uint cnt=18;
    function get() public view returns(uint){
        return cnt;
    }
    // function set(uint cnt2) public view returns(uint){
    //      return cnt2;
    // }
    function incr() public returns(uint)  {
        cnt +=1;
          return cnt;
    }
        function deincr() public returns(uint)  {
        cnt -=1;
          return cnt;
    }
}