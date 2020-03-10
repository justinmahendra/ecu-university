from hashlib import sha256

text = "SanojJustin100"
hashed = sha256(text.encode()).hexdigest()
print("Text = " , text , " -- Hash = " , hashed)

nonce = 0
for nonce in range(0,50000):
    temporary = text + str(nonce)
    temp_hashed = sha256(temporary.encode()).hexdigest()
    print("Temporary = " , temporary , "-- Hashed = " , temp_hashed)
    if (temp_hashed[0:3] == "000"):
        print("\n\nText = " , text , "Original Hash = " , hashed)
        print("Temporary = " , temporary , "-- Hashed = " , temp_hashed)
        quit()
    nonce += 1