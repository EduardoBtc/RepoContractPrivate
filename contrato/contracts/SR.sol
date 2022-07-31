// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
// Primeiro importamos alguns contratos do OpenZeppelin.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// Nós herdamos o contrato que importamos. Isso significa que
// teremos acesso aos métodos do contrato herdado.
contract SR is ERC721URIStorage {
    // Mágica dada pelo OpenZeppelin para nos ajudar a observar os tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    event NewEpicNFTMinted(address sender, uint256 tokenId);

    // Nós precisamos passar o nome do nosso token NFT e o símbolo dele.
    constructor() ERC721("SR Consulting", "SR") {}

    // Uma função que o nosso usuário irá chamar para pegar sua NFT.
    function makeAnEpicNFT() public {
        // Pega o tokenId atual, que começa por 0.
        uint256 newItemId = _tokenIds.current();
        // Minta ("cunha") o NFT para o sender (quem ativa o contrato) usando msg.sender.
        _safeMint(msg.sender, newItemId);
        // Designa os dados do NFT.
        _setTokenURI(
            newItemId,
            "https://ipfs.io/ipfs/QmcqfavuMPKjWDPHzKJkaEfqTb2sRcS5JQMWRKVh7nrVp9?filename=json%20SR.txt"
        );
        console.log(
            "Um NFT com o ID %s foi mintado para %s",
            newItemId,
            msg.sender
        );

        // Incrementa o contador para quando o próximo NFT for mintado.
        _tokenIds.increment();

        emit NewEpicNFTMinted(msg.sender, newItemId);
    }
}
