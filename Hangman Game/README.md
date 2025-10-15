# Hangman Game 🎮

As I was learning **Python**, I built this **mini project — a Hangman Game** to apply the programming concepts I was studying.  
It helped me connect **theory to practice** and understand how logic, loops, and data structures come together in a real program.


## 🚀 Features

- 🎯 **Five categories**: Fruits, Animals, Countries, Sports, Professions  
- 🧩 **Three difficulty levels**: Easy, Medium, Hard  
- 💡 **Hint system** (only once per game)  
- 😅 **ASCII art** for hangman stages  
- 🔤 Input validation for correctness and repetition  
- 🔁 Option to play multiple rounds  
- 📂 Words dynamically loaded from a **JSON file**


## 🧠 Concepts Practiced

- Loops and conditional logic  
- Modular programming with **functions**  
- Lists, sets, and dictionaries  
- Reading data from a **JSON** file  
- Input validation and error handling  
- ASCII-based UI design  


## 🧩 Project Outline (Detailed Flow)

Here’s how the game works under the hood 👇  

#### **Step 1: Load Word Bank**
- When the game starts, it opens the `word_bank.json` file.
- The JSON file contains words categorized by **type** (like fruits, animals) and **difficulty** (easy, medium, hard).
- These are loaded into memory as a dictionary for quick access.


#### **Step 2: Choose Category and Difficulty**
- The player is asked to select a **category** (1–5) and a **difficulty level** (1–3).
- Input validation ensures the player enters only valid numbers.
- The selected category and level are matched to the respective dictionary keys.


#### **Step 3: Select Secret Word**
- From the chosen category and level, a random word is picked using Python’s `random.choice()`.
- The selected word comes with a **hint** stored in the JSON file.



#### **Step 4: Initialize the Game State**
- The game sets up:
  - A list of underscores (`_`) representing unguessed letters.
  - An empty set for **wrong guesses**.
  - A counter for **maximum attempts** (5).
- The corresponding **ASCII hangman art** for each stage is loaded.


#### **Step 5: Start Guessing Loop**
- The player is repeatedly asked to **guess a letter**.
- The game checks:
  - If the input is a single alphabetic character.
  - If it has been guessed before (to prevent repeats).


#### **Step 6: Update the Game**
- If the guessed letter is in the word:
  - It replaces the underscore(s) at all matching positions.
  - The player is encouraged with a “Good guess!” message.
- If the guess is wrong:
  - An attempt is deducted.
  - The hangman art updates visually.
  - The wrong letter is added to the wrong guesses list.


#### **Step 7: Optional Hint System**
- Once per game, the player is prompted:
- If “y”, the hint from the word bank is displayed.
- The hint flag ensures it can only be used once.


#### **Step 8: Check Game Over Conditions**
- After every guess:
- If all letters are revealed → Player **wins** 🎉
- If attempts reach zero → Player **loses** 💀 and the word is revealed.



#### **Step 9: Replay Option**
- At the end, the player can choose whether to **play again** or **exit**.
- If yes, the game restarts from Step 1 without rerunning the program.



