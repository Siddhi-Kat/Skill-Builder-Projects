## 🎉 A Creative Twist on the Classic FizzBuzz

I recently attended a PyCon workshop where we revisited the classic FizzBuzz problem — but with an interesting challenge: solve it without using loops or recursion.

At first, I wondered, “How can we do FizzBuzz without a loop?” The key idea was to use generators. Unlike lists, generators don’t store all values in memory; instead, they yield values only when requested. This means we can even work with infinite sequences without running into memory issues. The only limitation is that generators do not retain previously generated values — they are “forgetful” by design.

What I found most interesting was how generators made the solution:

✨ More flexible — adding new divisibility checks requires just a single line.\
🧩 Cleaner — avoiding mutliple if-else statements compared to the traditional approach.\
🚀 Creative — showed me how to think beyond standard loops and recursion.

Overall, the workshop was an insightful experience and helped me appreciate how Python features like generators can open up new ways of approaching well-known problems.

### 📂 Workshop Code
The code we wrote during the session has been uploaded to this repository. You can check it out here:
👉 FizzBuzz.ipynb
