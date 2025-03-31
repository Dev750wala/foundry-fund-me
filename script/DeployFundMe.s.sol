// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import { HelperConfig } from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPricefeed = helperConfig.activeNetworkConfig(); 
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPricefeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
