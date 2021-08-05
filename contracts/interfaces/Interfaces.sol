// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.6.11;

interface IERC20DetailsLike {
    function decimals() external view returns (uint256);
}

interface IDebtLockerLike {
    function claim() external returns (uint256[7] memory);
    function triggerDefault() external;
}

interface ILiquidityLockerLike {
    function fundLoan(address loan, address debtLocker, uint256 amount) external;
    function transfer(address, uint256) external;
}

interface ILockerFactoryLike {
    function newLocker(address) external returns (address);
    function newLocker(address, address) external returns (address);
}

interface IStakeLockerLike {
    function pull(address, uint256) external;
    function updateFundsReceived() external;
    function updateLosses(uint256) external;
}

interface IMapleGlobals {
    function isValidBalancerPool(address) external view returns (bool);
    function isValidLiquidityAsset(address) external view returns (bool);
    function isValidLoanFactory(address) external view returns (bool);
    function isValidSubFactory(address, address, uint8) external view returns (bool);
    function getLatestPrice(address) external view returns (uint256);
    function getLpCooldownParams() external view returns (uint256, uint256);
    function governor() external view returns (address);
    function mpl() external view returns (address);
    function protocolPaused() external view returns (bool);
    function swapOutRequired() external view returns (uint256);
}

interface IBPoolLike {
    function balanceOf(address) external view returns (uint256);
    function calcSingleOutGivenPoolIn(uint256, uint256, uint256, uint256, uint256, uint256) external pure returns (uint256);
    function calcPoolInGivenSingleOut( uint256, uint256, uint256, uint256, uint256, uint256) external pure returns (uint256);
    function exitswapExternAmountOut(address, uint256, uint256) external returns (uint256);
    function getBalance(address) external view returns (uint256);
    function getDenormalizedWeight(address) external view returns (uint256);
    function getNormalizedWeight(address) external view returns (uint256);
    function getSwapFee() external view returns (uint256);
    function getTotalDenormalizedWeight() external view returns (uint256);
    function MAX_OUT_RATIO() external view returns (uint256);
    function isBound(address) external view returns (bool);
    function isFinalized() external view returns (bool);
    function totalSupply() external view returns (uint256);
    function transfer(address, uint256) external;
}

interface ILoanLike {
    function superFactory() external view returns (address);
}

interface ILoanFactoryLike {
    function isLoan(address) external view returns (bool);
    function globals() external view returns (address);
}
