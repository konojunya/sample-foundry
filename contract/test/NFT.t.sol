// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";
import "../src/NFT.sol";

contract NFTTest is Test {
    NFT public nftConstract;

    function setUp() public {
        nftConstract = new NFT("NFT", "NFT", "https://example.com/");
    }

    function testMintTo() public {
        address user1 = address(1);
        address user2 = address(2);
        nftConstract.mintTo(user1);
        nftConstract.mintTo(user2);

        uint256 tokenIndex1 = nftConstract.tokenOfOwnerByIndex(user1, 0);
        uint256 tokenIndex2 = nftConstract.tokenOfOwnerByIndex(user2, 0);

        assertEq(tokenIndex1, 0);
        assertEq(tokenIndex2, 1);
    }

    function testTokenURI(uint256 index) public {
        string memory result = nftConstract.tokenURI(index);
        string memory expected = string(
            abi.encodePacked(
                "https://example.com/",
                Strings.toString(index),
                ".json"
            )
        );

        assertEq(result, expected);
    }
}
