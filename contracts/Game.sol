pragma solidity ^0.4.17;

contract Game {
    address owner;

    uint public award;
    uint public entryFee;
    string correctAnswer = "42";

    constructor() public {
        owner = msg.sender;
        award = 10 ether;
        entryFee = 1 ether;
    }

    function registerPlayer() public payable {
        // require the user to send you cash to add to the pot
        require(msg.value == entryFee);
        award += msg.value;
        // save sender maybe?
    }

    function getAward() public view returns (uint) {
        return award;
    }

    function getEntryFee() public view returns (uint) {
        return entryFee;
    }

    function compareStrings (string a, string b) internal returns (bool){
       return keccak256(a) == keccak256(b);
   }

    function submit(string answer) public returns (bool){
        if (compareStrings(answer, correctAnswer)) {
          return false;
        }
        msg.sender.transfer(award);
        // reset reward
        award = 10 ether;
        return true;
    }

}
