// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.7;

interface IInternetBondRatioFeed {
    event RatioThresholdChanged(uint256 oldValue, uint256 newValue);

    function initialize(address) external;

    function updateRatioBatch(address[] calldata addresses, uint256[] calldata ratios) external;

    function getRatioFor(address) external view returns (uint256);
}