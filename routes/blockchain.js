const fs = require("fs");
const express = require("express");
const router = express.Router();
const campaignContract = "../build/contracts/Campagaign.json";

const web3 = require("web3");
let contracts = {};
let web3Provider

const initWeb3 = () => {
  if (typeof web3 !== "undefined") {
    web3Provider = new Web3(web3.currentProvider);
  } else {
    // set the provider you want from Web3.providers
    web3Provider = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));
  }
  web3 = new Web3(web3Provider)
};

const initContract = () => {
  const campaignArtifact = fs.readFileSync(campaignContract);
  contracts.Campaign = TruffleContract(campaignArtifact);
  contracts.Campaign.setProvider(web3Provider)
};

router.get("/", (req, res) => {
  initWeb3()
  initContract()
});

module.exports = router;
