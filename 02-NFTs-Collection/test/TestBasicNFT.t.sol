//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";

contract TestBasicNFT is Test {

    BasicNFT public basicNFT;
    DeployBasicNFT public deployer;

    address 

    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
    }

    function testTokenName() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNFT.name();
        assertEq(actualName, expectedName);

    }



}