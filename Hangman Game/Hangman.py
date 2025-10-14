import random as rd
import json

# --------------------------- FUNCTION DEFINITIONS --------------------------- #

def choose_word(words):
    categories = {1: "fruits", 2: "animals", 3: "countries", 4: "sports", 5: "professions"}
    levels = {1: "easy", 2: "medium", 3: "hard"}

    while True:
        try:
            category = categories[int(input(
                "Pick a category (1-5):\n1. Fruits\n2. Animals\n3. Countries\n4. Sports\n5. Professions\n"
            ))]
            break
        except (ValueError, KeyError):
            print("Invalid category. Try again.")

    while True:
        try:
            level = levels[int(input("\nChoose level 1 to 3:\n1. Easy\n2. Medium\n3. Hard\n"))]
            break
        except (ValueError, KeyError):
            print("Invalid level. Try again.")

    word_entry = rd.choice(words[category][level])
    return word_entry["word"], word_entry["hint"]

def initialize_game(secret_word):
    return list("_" * len(secret_word)), set(), 5

def get_hangman_art():
    return [
        """
          +----+
          |    |
          o    |
        /   \\  |
          |    |
          |    |
        =========
        """,
        """
          +----+
          |    |
          o    |
        /   \\  |
          |    |
               |
        =========
        """,
        """
          +----+
          |    |
          o    |
        /      |
               |
               |
        =========
        """,
        """
          +----+
          |    |
          o    |
               |
               |
               |
        =========
        """,
        """
          +----+
          |    |
               |
               |
               |
               |
        =========
        """,
        """
          +---+
          |   |
              |
              |
              |
              |
        =========
        """
    ]

def get_guess(unguessed_letters, wrong_guesses):
    while True:
        letter = input("\nGuess a letter: ").lower()
        if len(letter) != 1 or not letter.isalpha():
            print("Enter a single letter (a-z).")
        elif letter in unguessed_letters or letter in wrong_guesses:
            print("You already guessed that letter!")
        else:
            return letter

def update_game(secret_word, letter, unguessed_letters, wrong_guesses, max_attempt, art):
    if letter in secret_word:
        unguessed_letters = [letter if secret_word[i] == letter else unguessed_letters[i] for i in range(len(secret_word))]
        print("Good guess!")
    else:
        max_attempt -= 1
        print(f"Wrong guess! Attempts left: {max_attempt}")
        wrong_guesses.add(letter)
        print(art[5 - max_attempt])
    return unguessed_letters, wrong_guesses, max_attempt

def display_state(unguessed_letters, wrong_guesses):
    print("\nCurrent word:", " ".join(unguessed_letters))
    print("Wrong guesses:", ", ".join(sorted(wrong_guesses)))

def check_game_over(secret_word, unguessed_letters, max_attempt):
    if max_attempt == 0:
        print(f"\nYou lost! The word was '{secret_word}'.")
        return True
    if "_" not in unguessed_letters:
        print("\nCongratulations! You won!")
        return True
    return False

def play_game_once(words):
    secret_word, hint = choose_word(words)
    unguessed_letters, wrong_guesses, max_attempt = initialize_game(secret_word)
    art = get_hangman_art()

    print(f"\nYour word has {len(secret_word)} letters.")
    print(" ".join(unguessed_letters))

    hint_used = False

    while max_attempt > 0 and "_" in unguessed_letters:
        letter = get_guess(unguessed_letters, wrong_guesses)
        unguessed_letters, wrong_guesses, max_attempt = update_game(secret_word, letter, unguessed_letters, wrong_guesses, max_attempt, art)
        display_state(unguessed_letters, wrong_guesses)

        if check_game_over(secret_word, unguessed_letters, max_attempt):
            break

        # Handle hint once with validation
        if not hint_used:
            while True:
                want_hint = input("\nDo you want a hint? (y/n): ").lower()
                if want_hint in ['y', 'n']:
                    if want_hint == 'y':
                        print("\nHint:", hint)
                        hint_used = True
                    break
                print("Invalid input. Enter 'y' or 'n'.")

def play_game():
    print("\n===== HANGMAN GAME =====\n")

    with open("word_bank.json", "r", encoding="utf-8") as f:
        words = json.load(f)

    while True:
        play_game_once(words)

        # Ask to play again
        while True:
            replay = input("\nDo you want to play again? (y/n): ").lower()
            if replay in ['y', 'n']:
                break
            print("Invalid input. Enter 'y' or 'n'.")
        if replay == 'n':
            print("\nThanks for playing Hangman! Goodbye!")
            break

# --------------------------- GAME EXECUTION --------------------------- #
if __name__ == "__main__":
    play_game()
