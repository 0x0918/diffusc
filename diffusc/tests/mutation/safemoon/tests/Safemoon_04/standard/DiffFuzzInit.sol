// SPDX-License-Identifier: AGPLv3
pragma solidity ^0.8.0;

import "./DiffFuzzUpgrades.sol";

contract DiffFuzzInit is DiffFuzzUpgrades {
    constructor() DiffFuzzUpgrades() {
        hevm.prank(msg.sender);
        ISafemoonV1(address(transparentProxyTestHarnessV1)).initialize();
        hevm.prank(msg.sender);
        ISafemoon_04V2(address(transparentProxyTestHarnessV2)).initialize();
    }

    function Safemoon_04_transfer(address a, uint256 b) public override {
        require(a != address(transparentProxyTestHarnessV1) && a != address(transparentProxyTestHarnessV2));
        super.Safemoon_04_transfer(a, b);
    }
}