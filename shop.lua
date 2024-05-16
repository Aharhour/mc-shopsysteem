playerWallet = 3000
playerItems= {}
shopItems = {
    stock = {
        ["Health Potion"] = 10,
        ["Nametag"] = 5,
        ["Bottle o' Enchanting"] = 3,
        ["Elytra"] = 1
    },
    buyPrice = {
        ["Health Potion"] = 200,
        ["Nametag"] = 500,
        ["Bottle o' Enchanting"] = 2000,
        ["Elytra"] = 10000,
        ["Heart of the Sea"] = 1750,
        ["Gold Nugget"] = 1000,
        ["Leather Boots"] = 800,
        ["Creeper Head"] = 1000
    },
    sellPrice = {
        ["Health Potion"] = 150,
        ["Nametag"] = 300,
        ["Bottle o' Enchanting"] = 1500,
        ["Elytra"] = 8000,
        ["Heart of the Sea"] = 1000,
        ["Gold Nugget"] = 1200,
        ["Leather Boots"] = 600,
        ["Creeper Head"] = 300
    }
}
playerItems = {
    ["Heart of the Sea"] = 1,
    ["Gold Nugget"] = 5,
    ["Leather Boots"] = 2,
    ["Creeper Head"] = 1
}

print("Hello! Welcome to the adil's trading corporation! How may i help you?")
print("1 Buy")
print("2 Sell")
print("* Exit")
print("Type the number of what you want to do.)")

option = tonumber(read())

if option == 1 then
    print("Sure, allow me to show you our wares.")
    for a, b in pairs(shopItems.stock) do
        print("> "..a.." - Stock: "..b.." - Cost: "..shopItems.buyPrice[a])
    end
    print("Your wallet: "..playerWallet)
    print("(Type name of what you want to buy.)")

    option = read()
    if shopItems.stock[option] == nil or shopItems.stock[option] == 0 then
        print("We don't have that in stock today.")
    else
        print("How many do you want?")
            quantity = tonumber(read())

            if not quantity or quantity < 1 then
                print("You can't buy that many "..option.."'s!")
            elseif quantity > shopItems.stock[option] then
                print("We don't have that many "..option.."'s.")
            elseif shopItems.buyPrice[option]*quantity > playerWallet then
            print("You can't afford that many "..option.."'s.!")
        else
            write("It wil cost "..shopItems.buyPrice[option]*quantity.." gold for "..quantity.." "..option)
            if quantity ~= 1 then
                write("'s")
            end
            print(". Is that okay?")
            print("Your wallet: "..playerWallet)
            print("(Type the lowercase letter y for yes.)")

            confirm = read()

            if confirm == "y" then
                playerWallet = playerWallet - shopItems.buyPrice[option]*quantity
                if playerItems[option] == nil then
                    playerItems[option] = 0
                end
                playerItems[option] = playerItems[option] + quantity
                shopItems.stock[option] = shopItems.stock[option] - quantity

                print("\n> Your remaining balance: "..playerWallet)
                print("> "..option.."'s in you inventory: "..playerItems[option])
                print("> Remaining "..option.."'s in the shop's inventory: "..shopItems.stock[option])
            end
        end
    end
elseif option == 2 then
    print("\nOkay, what do you have?")
        for a, b in pairs(playerItems) do
            print("> "..a.." - Have: "..b.." Cost: "..shopItems.sellPrice[a])
        end
        print("Your wallet: "..playerWallet)
        print("(Type the name of what you want to sell.)")

        option = read()
            if playerItems[option] == nil then
            print("\nYou don't have that item.")
        else
        print("\nHow many are you selling?")
            quantity = tonumber(read())

            if not quantity or quantity < 1 then
                print("\nI can't buy that many "..option.."'s from you.")
            elseif quantity > playerItems[option] then
                print("\nWe don't have that many "..option.."'s.")
            else
                write("\nI can buy "..quantity.." "..option)
                if quantity ~= 1 then
                    write("'s")
                end
                print(" for "..shopItems.sellPrice[option]*quantity..". is that okey?")
                print("Your Wallet: "..playerWallet)
                print("(Type the lowercase letter y for yes.)")

                confirm = read()

            if confirm == "y" then
                if shopItems.stock[option] == nil then
                    shopItems.stock[option] = 0
                end 
                shopItems.stock[option] = shopItems.stock[option] + quantity
                playerItems[option] = playerItems[option] - quantity
                if playerItems[option] == 0 then
                    playerItems[option] = nill
                end
                playerWallet = playerWallet + shopItems.sellPrice[option] * quantity

                print("\n> Wallet balance: "..playerWallet)
                write("> Remaining "..option.."'s in you inventory: ")
                if playerItems[option] == nil then
                    print("None")
                else
                    print(playerItems[option])
                end
                print("> "..option.."s in shop's inventory: "..shopItems.stock[option])
            end
        end
    end
end

print("Thank you. Please come again!")