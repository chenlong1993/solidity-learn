// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";

// MyMultiToken合约继承自ERC1155标准合约，用于创建和管理多种类型的代币
contract MyMultiToken is ERC1155 {
    // 定义一个常量，表示最大的代币ID数量限制
    uint256 constant MAX_COUNT = 1000;

    // 合约构造函数，调用ERC1155的构造函数并传入代币名称和符号
    constructor() ERC1155("MULTOKEN") {}

    // 铸造单个代币的函数，需要传入代币ID、数量以及可选的数据
    // 会检查传入的代币ID是否小于最大限制，防止溢出
    function mint(uint256 id, uint256 value, bytes memory data) external {
        require(id < MAX_COUNT, "id overflow");
        ERC1155._mint(msg.sender, id, value, data);
    }

    // 批量铸造代币的函数，接受代币ID数组、数量数组以及数据
    // 会遍历ID数组检查每个ID是否小于最大限制，防止溢出
    function batchMint(uint256[] calldata ids, uint256[] calldata values, bytes calldata data) external {
        for (uint256 i = 0; i < ids.length; i++) {
            require(ids[i] < MAX_COUNT, "id overflow");
        }
        ERC1155._mintBatch(msg.sender, ids, values, data);
    }

    // 燃烧单个代币的函数，根据传入的代币ID和数量销毁对应的代币
    function burn(uint256 id, uint256 value) external {
        ERC1155._burn(msg.sender, id, value);
    }

    // 批量燃烧代币的函数，接受代币ID数组和数量数组，用于批量销毁代币
 function batchBurn(uint256[] calldata ids,  uint256[] calldata values) external 
{
    
        ERC1155._burnBatch(msg.sender, ids, values);
}

    // 重写ERC1155合约中的_baseURL函数，这里暂时返回空字符串
    // 通常用于设置获取代币元数据的基础URL，可根据实际需求进一步完善
    // function internal function _baseURL() pure override returns (string memory) {
    //     return "";
    // }
}