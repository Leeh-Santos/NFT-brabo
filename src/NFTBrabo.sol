// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTBrabo is ERC721 {

    mapping (uint256 => string) private s_tokenIdtoUri;
    uint256 private s_tokenIdCounter;
    
    constructor() ERC721("NFTBrabo", "NFTB") {
        s_tokenIdCounter = 0;
    }

    function mintBrabo(string memory tokenUri) public {
        s_tokenIdtoUri[s_tokenIdCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenIdCounter);
        s_tokenIdCounter++;
        
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
       // require(_exists(tokenId), "Token does not exist");
        return s_tokenIdtoUri[tokenId];
    }
}
