import NonFungibleToken from 0x179b6b1cb6755e31
import ExampleNFT from 0x01cf0e2f2f715450
transaction {
    prepare(acct: AuthAccount) {

        // Create a new empty collection
        let collection <- ExampleNFT.createEmptyCollection()

        // store the empty NFT Collection in account storage
        acct.save<@NonFungibleToken.Collection>(<-collection, to: ExampleNFT.CollectionStoragePath)

        log("Collection created for account")

        // create a public capability for the Collection
        acct.link<&{NonFungibleToken.CollectionPublic}>(ExampleNFT.CollectionPublicPath, target: ExampleNFT.CollectionStoragePath)
        log("Capability created")
    }
}