
i=0
while [ $i -lt 70000 ]  
do
    flow transactions send ./transactions/mintNFT.cdc --signer emulator-ExampleNFT
    i=`expr $i + 1`
done