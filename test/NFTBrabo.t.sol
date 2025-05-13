// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployNFTBrabo} from "../script/DeployNFTBrabo.s.sol";
import {NFTBrabo} from "../src/NFTBrabo.sol";

contract NFTBraboTest is Test {
    DeployNFTBrabo public deployer;
    NFTBrabo public nftBrabo;

    address public USER = makeAddr("user");
    string public constant TOKEN_URI_PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployNFTBrabo();
        nftBrabo = deployer.run();
    }

    function testNameisCorrect() public view {

        assert(keccak256(abi.encodePacked(nftBrabo.name())) == keccak256(abi.encodePacked("NFTBrabo")));

    }

    function testCanMintnHaveBalance() public {

        vm.prank(USER);
        nftBrabo.mintBrabo(TOKEN_URI_PUG);
        assert(nftBrabo.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(nftBrabo.tokenURI(0))) == keccak256(abi.encodePacked(TOKEN_URI_PUG)));
    }
}

