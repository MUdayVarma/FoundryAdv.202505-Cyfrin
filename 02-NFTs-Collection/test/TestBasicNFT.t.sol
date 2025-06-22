//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";

contract TestBasicNFT is Test {

    BasicNFT public basicNFT;
    DeployBasicNFT public deployer;
    address public USER = makeAddr("user");
    string public constant PUG = "ifps://QmUPjADFGEKmfohdTaNcWhp7VGk26h5jXDA7v3VtTnTLcW";
    //"https://bafybeicz57su3zyafexgchnfqej7zuxfa3e4xgz22yzmge6nzkhfmskqs4.ipfs.dweb.link?filename=st-bernard.png";

    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
    }

    function testTokenName() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNFT.name();
        assertEq(actualName, expectedName);

    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNFT.mintNFT(PUG);

        assert(basicNFT.balanceOf(USER) == 1);
        assertEq(basicNFT.tokenURI(0), PUG, "Token URI does not match expected value");
        assert(keccak256(abi.encodePacked(basicNFT.tokenURI(0))) == keccak256(abi.encodePacked(PUG)));//, "Token URI does not match expected value");


    }



}