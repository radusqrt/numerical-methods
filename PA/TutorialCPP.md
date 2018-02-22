# Things that you will probably use a lot.

## std::vector

### Constructors

```cpp
std::vector<int> first;                               						// empty vector of ints
std::vector<int> second(5);                     					       	// five ints with value 0
std::vector<int> third(3, 20);                      						// three ints with value 20
std::vector<int> fourth(second.begin(), second.end()); 						// a copy of second
std::vector<int> fifth(third);                       						// a copy of third
std::vector<std::string> words {"hello", "from", "the", "other", "side"}; 	// c++11 initializer list
```

### Modifiers

```cpp
v[i]; // element on the i-th position (zero-indexed)
v.clear(); // clears the vector - size becomes 0, capacity unchanged
v.push_back(element); // inserts element to the back of the vector
```

