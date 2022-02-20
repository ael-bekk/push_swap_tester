# Tester for push swap To see how it works
push swap tester for 42 push_swap project

This tester shows the performance of your push_swap program

and check that your checker works correctly.

* [How to run this tester?](#how-to-run-this-tester)

## What's push_swap_tester?

Push_swap_tester is a little tester that shows you how your push_swap works.
It displays the number of instructions performed by your push_swap in color, with the average
here is the colors means:


- ![#23FF05](https://via.placeholder.com/15/23FF05/000000?text=+) `means so good`
- ![#FFF705](https://via.placeholder.com/15/FFF705/000000?text=+) `means good`
- ![#05FBFF](https://via.placeholder.com/15/05FBFF/000000?text=+) `means it's ok`
- ![#D905FF](https://via.placeholder.com/15/D905FF/000000?text=+) `means bad`
- ![#010CFA](https://via.placeholder.com/15/010CFA/000000?text=+) `means realy bad`
- ![#f03c15](https://via.placeholder.com/15/f03c15/000000?text=+) `means eliminatory`

![Screenshot](screenshot.png)

## How to run this tester?

```bash
git clone https://github.com/ael-bekk/push_swap_tester.git
cd push_swap_tester/
./tester.sh [path/push_swap] [path/checker (your checker or checker_mac)] [nb_of_tests]
```
### for example:
the following command will perform one test with a stack of 2 & 3 & 5 & 100 & 500 integers, and check error two
```bash
./tester.sh ../push_swap ../checker
```
   
the following command will perform 5 tests with a stack of 2 & 3 & 5 & 100 & 500 integers, and check error two
```bash
./tester.sh ../push_swap ../checker 5
```

## 📝 License

This project is licensed under the MIT - see the [LICENSE](LICENSE) file for details.

---
