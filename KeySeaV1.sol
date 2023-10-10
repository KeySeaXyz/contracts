// SPDX-License-Identifier: MIT
// File: @openzeppelin/contracts/utils/Context.sol

// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
  function _msgSender() internal view virtual returns (address) {
    return msg.sender;
  }

  function _msgData() internal view virtual returns (bytes calldata) {
    return msg.data;
  }
}

// File: @openzeppelin/contracts/access/Ownable.sol

// OpenZeppelin Contracts (last updated v4.9.0) (access/Ownable.sol)

pragma solidity ^0.8.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
  address private _owner;

  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );

  /**
   * @dev Initializes the contract setting the deployer as the initial owner.
   */
  constructor() {
    _transferOwnership(_msgSender());
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    _checkOwner();
    _;
  }

  /**
   * @dev Returns the address of the current owner.
   */
  function owner() public view virtual returns (address) {
    return _owner;
  }

  /**
   * @dev Throws if the sender is not the owner.
   */
  function _checkOwner() internal view virtual {
    require(owner() == _msgSender(), "Ownable: caller is not the owner");
  }

  /**
   * @dev Leaves the contract without owner. It will not be possible to call
   * `onlyOwner` functions. Can only be called by the current owner.
   *
   * NOTE: Renouncing ownership will leave the contract without an owner,
   * thereby disabling any functionality that is only available to the owner.
   */
  function renounceOwnership() public virtual onlyOwner {
    _transferOwnership(address(0));
  }

  /**
   * @dev Transfers ownership of the contract to a new account (`newOwner`).
   * Can only be called by the current owner.
   */
  function transferOwnership(address newOwner) public virtual onlyOwner {
    require(newOwner != address(0), "Ownable: new owner is the zero address");
    _transferOwnership(newOwner);
  }

  /**
   * @dev Transfers ownership of the contract to a new account (`newOwner`).
   * Internal function without access restriction.
   */
  function _transferOwnership(address newOwner) internal virtual {
    address oldOwner = _owner;
    _owner = newOwner;
    emit OwnershipTransferred(oldOwner, newOwner);
  }
}

// File: @openzeppelin/contracts/utils/math/SafeMath.sol

// OpenZeppelin Contracts (last updated v4.9.0) (utils/math/SafeMath.sol)

pragma solidity ^0.8.0;

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {
  /**
   * @dev Returns the addition of two unsigned integers, with an overflow flag.
   *
   * _Available since v3.4._
   */
  function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
    unchecked {
      uint256 c = a + b;
      if (c < a) return (false, 0);
      return (true, c);
    }
  }

  /**
   * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
   *
   * _Available since v3.4._
   */
  function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
    unchecked {
      if (b > a) return (false, 0);
      return (true, a - b);
    }
  }

  /**
   * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
   *
   * _Available since v3.4._
   */
  function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
    unchecked {
      // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
      // benefit is lost if 'b' is also tested.
      // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
      if (a == 0) return (true, 0);
      uint256 c = a * b;
      if (c / a != b) return (false, 0);
      return (true, c);
    }
  }

  /**
   * @dev Returns the division of two unsigned integers, with a division by zero flag.
   *
   * _Available since v3.4._
   */
  function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
    unchecked {
      if (b == 0) return (false, 0);
      return (true, a / b);
    }
  }

  /**
   * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
   *
   * _Available since v3.4._
   */
  function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
    unchecked {
      if (b == 0) return (false, 0);
      return (true, a % b);
    }
  }

  /**
   * @dev Returns the addition of two unsigned integers, reverting on
   * overflow.
   *
   * Counterpart to Solidity's `+` operator.
   *
   * Requirements:
   *
   * - Addition cannot overflow.
   */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    return a + b;
  }

  /**
   * @dev Returns the subtraction of two unsigned integers, reverting on
   * overflow (when the result is negative).
   *
   * Counterpart to Solidity's `-` operator.
   *
   * Requirements:
   *
   * - Subtraction cannot overflow.
   */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    return a - b;
  }

  /**
   * @dev Returns the multiplication of two unsigned integers, reverting on
   * overflow.
   *
   * Counterpart to Solidity's `*` operator.
   *
   * Requirements:
   *
   * - Multiplication cannot overflow.
   */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    return a * b;
  }

  /**
   * @dev Returns the integer division of two unsigned integers, reverting on
   * division by zero. The result is rounded towards zero.
   *
   * Counterpart to Solidity's `/` operator.
   *
   * Requirements:
   *
   * - The divisor cannot be zero.
   */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    return a / b;
  }

  /**
   * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
   * reverting when dividing by zero.
   *
   * Counterpart to Solidity's `%` operator. This function uses a `revert`
   * opcode (which leaves remaining gas untouched) while Solidity uses an
   * invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   *
   * - The divisor cannot be zero.
   */
  function mod(uint256 a, uint256 b) internal pure returns (uint256) {
    return a % b;
  }

  /**
   * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
   * overflow (when the result is negative).
   *
   * CAUTION: This function is deprecated because it requires allocating memory for the error
   * message unnecessarily. For custom revert reasons use {trySub}.
   *
   * Counterpart to Solidity's `-` operator.
   *
   * Requirements:
   *
   * - Subtraction cannot overflow.
   */
  function sub(
    uint256 a,
    uint256 b,
    string memory errorMessage
  ) internal pure returns (uint256) {
    unchecked {
      require(b <= a, errorMessage);
      return a - b;
    }
  }

  /**
   * @dev Returns the integer division of two unsigned integers, reverting with custom message on
   * division by zero. The result is rounded towards zero.
   *
   * Counterpart to Solidity's `/` operator. Note: this function uses a
   * `revert` opcode (which leaves remaining gas untouched) while Solidity
   * uses an invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   *
   * - The divisor cannot be zero.
   */
  function div(
    uint256 a,
    uint256 b,
    string memory errorMessage
  ) internal pure returns (uint256) {
    unchecked {
      require(b > 0, errorMessage);
      return a / b;
    }
  }

  /**
   * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
   * reverting with custom message when dividing by zero.
   *
   * CAUTION: This function is deprecated because it requires allocating memory for the error
   * message unnecessarily. For custom revert reasons use {tryMod}.
   *
   * Counterpart to Solidity's `%` operator. This function uses a `revert`
   * opcode (which leaves remaining gas untouched) while Solidity uses an
   * invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   *
   * - The divisor cannot be zero.
   */
  function mod(
    uint256 a,
    uint256 b,
    string memory errorMessage
  ) internal pure returns (uint256) {
    unchecked {
      require(b > 0, errorMessage);
      return a % b;
    }
  }
}

// File: contracts/KeySeaV1.sol

pragma solidity ^0.8.0;

contract KeySeaV1 is Ownable {
  using SafeMath for uint256;

  address public protocolFeeDestination;
  uint256 public protocolFeePercent;
  uint256 public subjectFeePercent;

  event Trade(
    address trader,
    address subject,
    bool isBuy,
    uint256 shareAmount,
    uint256 ethAmount,
    uint256 protocolEthAmount,
    uint256 subjectEthAmount,
    uint256 supply
  );
  event FanTrade(
    address trader,
    address fanShareSubject,
    bool isBuy,
    uint256 shareAmount,
    uint256 ethAmount,
    uint256 protocolEthAmount,
    uint256 supply
  );

  mapping(address => mapping(address => uint256)) public sharesBalance;
  mapping(address => uint256) public sharesSupply;
  mapping(address => mapping(address => uint256)) public fanSharesBalance;
  mapping(address => uint256) public fanSharesSupply;

  constructor() {
    // Set default values if needed
    protocolFeeDestination = msg.sender;
    protocolFeePercent = 50000000000000000;
    subjectFeePercent = 50000000000000000;
  }

  function setFeeDestination(address _feeDestination) external onlyOwner {
    protocolFeeDestination = _feeDestination;
  }

  function setProtocolFeePercent(uint256 _feePercent) external onlyOwner {
    protocolFeePercent = _feePercent;
  }

  function setSubjectFeePercent(uint256 _feePercent) external onlyOwner {
    subjectFeePercent = _feePercent;
  }

  function getPrice(
    uint256 supply,
    uint256 amount
  ) public pure returns (uint256) {
    uint256 sum1 = supply == 0
      ? 0
      : ((supply - 1) * (supply) * (2 * (supply - 1) + 1)) / 6;
    uint256 sum2 = supply == 0 && amount == 1
      ? 0
      : ((supply - 1 + amount) *
        (supply + amount) *
        (2 * (supply - 1 + amount) + 1)) / 6;
    uint256 summation = sum2 - sum1;
    return (summation * 1 ether) / 16000;
  }

  function getBuyPrice(
    address sharesSubject,
    uint256 amount
  ) public view returns (uint256) {
    return getPrice(sharesSupply[sharesSubject], amount);
  }

  function getSellPrice(
    address sharesSubject,
    uint256 amount
  ) public view returns (uint256) {
    return getPrice(sharesSupply[sharesSubject].sub(amount), amount);
  }

  function getBuyPriceAfterFee(
    address sharesSubject,
    uint256 amount
  ) public view returns (uint256) {
    uint256 price = getBuyPrice(sharesSubject, amount);
    uint256 protocolFee = price.mul(protocolFeePercent).div(1 ether);
    uint256 subjectFee = price.mul(subjectFeePercent).div(1 ether);
    return price.add(protocolFee).add(subjectFee);
  }

  function getSellPriceAfterFee(
    address sharesSubject,
    uint256 amount
  ) public view returns (uint256) {
    uint256 price = getSellPrice(sharesSubject, amount);
    uint256 protocolFee = price.mul(protocolFeePercent).div(1 ether);
    uint256 subjectFee = price.mul(subjectFeePercent).div(1 ether);
    return price.sub(protocolFee).sub(subjectFee);
  }

  function buyShares(address sharesSubject, uint256 amount) external payable {
    uint256 supply = sharesSupply[sharesSubject];
    require(
      supply > 0 || sharesSubject == msg.sender,
      "Only the shares' subject can buy the first share"
    );

    uint256 price = getBuyPrice(sharesSubject, amount);
    uint256 protocolFee = price.mul(protocolFeePercent).div(1 ether);
    uint256 subjectFee = price.mul(subjectFeePercent).div(1 ether);
    uint256 totalRequiredPayment = price.add(protocolFee).add(subjectFee);

    require(msg.value >= totalRequiredPayment, "Insufficient payment");

    if (msg.value > totalRequiredPayment) {
      uint256 refundAmount = msg.value.sub(totalRequiredPayment);
      payable(msg.sender).transfer(refundAmount);
    }

    sharesBalance[sharesSubject][msg.sender] = sharesBalance[sharesSubject][
      msg.sender
    ].add(amount);
    sharesSupply[sharesSubject] = supply.add(amount);

    emit Trade(
      msg.sender,
      sharesSubject,
      true,
      amount,
      price,
      protocolFee,
      subjectFee,
      supply.add(amount)
    );

    payable(protocolFeeDestination).transfer(protocolFee);
    payable(sharesSubject).transfer(subjectFee);
  }

  function sellShares(address sharesSubject, uint256 amount) external {
    uint256 supply = sharesSupply[sharesSubject];
    require(supply > amount, "Cannot sell the last share");
    require(
      sharesBalance[sharesSubject][msg.sender] >= amount,
      "Insufficient shares"
    );

    uint256 price = getSellPrice(sharesSubject, amount);
    uint256 protocolFee = price.mul(protocolFeePercent).div(1 ether);
    uint256 subjectFee = price.mul(subjectFeePercent).div(1 ether);
    uint256 totalPayment = price.sub(protocolFee).sub(subjectFee);

    sharesBalance[sharesSubject][msg.sender] = sharesBalance[sharesSubject][
      msg.sender
    ].sub(amount);
    sharesSupply[sharesSubject] = supply.sub(amount);

    emit Trade(
      msg.sender,
      sharesSubject,
      false,
      amount,
      price,
      protocolFee,
      subjectFee,
      supply.sub(amount)
    );

    payable(msg.sender).transfer(totalPayment);
    payable(protocolFeeDestination).transfer(protocolFee);
    payable(sharesSubject).transfer(subjectFee);
  }

  function getFanBuyPrice(
    address fanShareSubject,
    uint256 amount
  ) public view returns (uint256) {
    return getPrice(fanSharesSupply[fanShareSubject], amount);
  }

  function getFanSellPrice(
    address fanShareSubject,
    uint256 amount
  ) public view returns (uint256) {
    return getPrice(fanSharesSupply[fanShareSubject].sub(amount), amount);
  }

  function buyFanShares(
    address fanShareSubject,
    uint256 amount
  ) external payable {
    uint256 price = getFanBuyPrice(fanShareSubject, amount);
    uint256 protocolFee = price.mul(protocolFeePercent).div(1 ether);
    uint256 subjectFee = price.mul(subjectFeePercent).div(1 ether);
    uint256 totalRequiredPayment = price.add(protocolFee).add(subjectFee);

    require(msg.value >= totalRequiredPayment, "Insufficient payment");

    if (msg.value > totalRequiredPayment) {
      uint256 refundAmount = msg.value.sub(totalRequiredPayment);
      payable(msg.sender).transfer(refundAmount);
    }

    fanSharesBalance[msg.sender][fanShareSubject] = fanSharesBalance[
      msg.sender
    ][fanShareSubject].add(amount);
    fanSharesSupply[fanShareSubject] = fanSharesSupply[fanShareSubject].add(
      amount
    );

    emit FanTrade(
      msg.sender,
      fanShareSubject,
      true,
      amount,
      price,
      protocolFee.add(subjectFee),
      fanSharesSupply[fanShareSubject]
    );

    payable(protocolFeeDestination).transfer(protocolFee.add(subjectFee));
  }

  function sellFanShares(address fanShareSubject, uint256 amount) external {
    require(
      fanSharesBalance[msg.sender][fanShareSubject] >= amount,
      "Insufficient shares"
    );
    require(
      fanSharesSupply[fanShareSubject].sub(amount) > 0,
      "Last share cannot be sold"
    );

    uint256 price = getFanSellPrice(fanShareSubject, amount);
    uint256 protocolFee = price.mul(protocolFeePercent).div(1 ether);
    uint256 subjectFee = price.mul(subjectFeePercent).div(1 ether);
    uint256 totalPayment = price.sub(protocolFee).sub(subjectFee);

    fanSharesBalance[msg.sender][fanShareSubject] = fanSharesBalance[
      msg.sender
    ][fanShareSubject].sub(amount);
    fanSharesSupply[fanShareSubject] = fanSharesSupply[fanShareSubject].sub(
      amount
    );

    emit FanTrade(
      msg.sender,
      fanShareSubject,
      false,
      amount,
      price,
      protocolFee.add(subjectFee),
      fanSharesSupply[fanShareSubject]
    );

    payable(msg.sender).transfer(totalPayment);
    payable(protocolFeeDestination).transfer(protocolFee.add(subjectFee));
  }
}