// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {NFTBrabo} from "../src/NFTBrabo.sol";

contract DeployNFTBrabo is Script {
    function run() external returns (NFTBrabo) {
        vm.startBroadcast();
        NFTBrabo nftBrabo = new NFTBrabo();
        vm.stopBroadcast();
        return nftBrabo;
    }
}