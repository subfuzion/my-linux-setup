// #include <bits/stdc++.h>
#include <csignal>
#include <iomanip>
#include <iostream>
#include <limits>
#include <string>

void exit_yes()
{
	exit(0);
}

void exit_no()
{
	exit(1);
}

void ctrl_signal_handler(int s)
{
	std::cout << std::endl;
	exit_no();
}

int main(int argc, char *argv[])
{
	signal(SIGINT, ctrl_signal_handler);
	std::string answer;
	for (;;) {
		std::cout << "Enter (Y)es or (n)o: ";
		// std::cout << "peek: " << std::cin.peek() << std::endl;
		if (std::cin.peek() == '\n') exit_yes();
		std::cin >> std::setw(1) >> answer;
		std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
		switch (answer[0]) {
			case 'Y':
			case 'y': exit_yes();
			case 'N':
			case 'n': exit_no();
		}
	}
}
