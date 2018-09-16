pragma solidity ^0.4.17;

contract Game {
    address owner;
    address player;

    uint public award;
    uint public entryFee;

    constructor() public {
        owner = msg.sender;
        award = 10 ether;
        entryFee = 1 ether;
    }

    function registerPlayer() public payable {
        // require the user to send you cash to add to the pot
        require(msg.value == entryFee);
        award += msg.value;
        player = msg.sender;
    }

    function getAward() public view returns (uint) {
        return award;
    }

    function getEntryFee() public view returns (uint) {
        return entryFee;
    }

    // awardPot(address winner) -> returns true // false
    // problem that it is public, work out authorization
    function awardPot() public {
        // require(msg.sender == owner);
        player.transfer(award);
    }

}
