// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";

contract MyMultiToken is ERC1155{
    uint256 constant MAX_COUNT = 1000;
    constructor() ERC1155("MULTOKEN","MT"){}
    function mint(uint256 id,uint256 value,bytes memory data) external {
        require(id < MAX_COUNT,"id overflow");
        _mint(msg.sender,id,value,data);
    }

    function batchMint(uint256[] calldata ids, uint256[] calldata values, bytes calldata data)external {
        for(uint256 i = 0;i<ids.length;i++){
            require(ids[i] < MAX_COUNT,"id overflow");
        }
        _batchMint(msg.sender,ids ,values,data);
    }
   function burn(uint256 id, uint256 value  )external{ 
    _burn(msg.sender,id,value);
   }
   function batchBurn(uint256[] calldata ids, uint256[] calldata values) external {
     _batchBurn(msg.sender,ids,values);
   }
   function _baseURL()pure override returns (string memory){
    return "";
   }
}