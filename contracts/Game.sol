pragma solidity ^0.4.17;

contract Game {
    uint public entryFee;
    string correctAnswer = "42";
    mapping (address => uint256) public balances;

    event LogSubmit(address sender, address to, uint amount);

    constructor() public {
        entryFee = 1 ether; // const?
    }

    function registerPlayer() public payable {
        // require the user to send you cash to add to the
        // check if player has already been registered ?
        require(msg.value == entryFee);

        // ensure only paying once. TODO return something in this case
        //require(balances[msg.sender] < entryFee);
        balances[msg.sender] +=msg.value;
        // save sender maybe?
    }

    function getAward() public view returns (uint) {
        return address(this).balance;
    }

    function getEntryFee() public view returns (uint) {
        return entryFee;
    }

    function compareStrings (string a, string b) internal returns (bool){
       return keccak256(a) == keccak256(b);
   }

    function submit(string answer) public {
      // use require?
      uint award = getAward();
      require(compareStrings(answer, correctAnswer));
      msg.sender.transfer(award);
      LogSubmit(address(this), msg.sender, award);
    }

}
