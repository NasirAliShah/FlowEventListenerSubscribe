import NonFungibleToken from 0x179b6b1cb6755e31
import ExampleNFT from 0x01cf0e2f2f715450

// Print the NFTs owned by accounts 0x01 and 0x02.
pub fun main(account: Address) {

    // Get both public account objects
    let owner = getAccount(account)

    // Find the public Receiver capability for their Collections
    let capability = owner.getCapability(ExampleNFT.CollectionPublicPath)

    // borrow references from the capabilities
    let collectionRef = capability.borrow<&{ExampleNFT.ExampleNFTCollectionPublic}>()
        ?? panic("Could not borrow account collection public")

    // Print both collections as arrays of IDs
    for id in collectionRef.getIDs() {
        log(id)
        let nft = collectionRef.borrowExampleNFT(id: id)
        log(nft!.name)
        log(nft!.description)
        log(nft!.thumbnail)
        log(nft!.id)
        log(nft!.getType())
        log(nft!.getViews())
    }
}
