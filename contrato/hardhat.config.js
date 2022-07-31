require("@nomiclabs/hardhat-waffle");
module.exports = {
  solidity: "0.8.1",
  networks: {
    rinkeby: {
      url: "https://eth-rinkeby.alchemyapi.io/v2/CkBWK6Jg88XO6KwEzCY9HM3Fb5oExcz0",
      accounts: ["a254010913f8848cc595d5568f34b46e2d9da4be47ba82046a45ee2e2874b6cc"],
    },
  },
};