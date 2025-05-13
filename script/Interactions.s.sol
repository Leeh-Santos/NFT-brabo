// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {NFTBrabo} from "../src/NFTBrabo.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintNFTBrabo is Script {

    string public constant TOKEN_URI_PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
       //address mostRecentDeployed = address(0x128d76d7b5012d5d86718ea8118e35570e383cf5); //DevOpsTools.get_most_recent_deployment("NFTBrabo", block.chainid);
       mintNftOnContract(0x128d76d7b5012D5d86718ea8118e35570E383Cf5);
    }

    function mintNftOnContract(address contractAddress) public{
        vm.startBroadcast();
        NFTBrabo(contractAddress).mintBrabo(TOKEN_URI_PUG);
        vm.stopBroadcast();
    }
}