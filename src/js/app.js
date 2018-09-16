App = {
  web3Provider: null,
  contracts: {},

  init: function() {
    // Load questioin

    return App.initWeb3();
  },

  initWeb3: function() {
    // Is there an injected web3 instance?
    if (typeof web3 !== 'undefined') {
      App.web3Provider = web3.currentProvider;
    } else {
      // If no injected web3 instance is detected, fall back to Ganache
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
    }
    web3 = new Web3(App.web3Provider);
    return App.initContract();
  },

  initContract: function() {
    $.getJSON('Game.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with truffle-contract
      var GameArtifact = data;
      App.contracts.Game = TruffleContract(GameArtifact);

      // Set the provider for our contract
      App.contracts.Game.setProvider(App.web3Provider);
      App.getAward();
    });
  },

  getAward: function() {
    var adoptionInstance;

    // Once the contract instance is deployed...
    App.contracts.Game.deployed().then(function(instance) {
      gameInstance = instance;
      // Call the function that will retrieve the adopters for us.
      return gameInstance.getAward.call();
    }).then(function(award) {
      console.log(award);
    }).catch(function(err) {
      console.log(err.message);
    });
  }

};

$(function() {
  $(window).load(function() {
    App.init();
  });
});
