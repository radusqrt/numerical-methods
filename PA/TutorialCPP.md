# Things that you will probably use a lot.

## std::vector

#### Constructors

```cpp
std::vector<int> first;	// empty vector of ints
std::vector<int> second(5); // five ints with value 0
std::vector<int> third(3, 20); // three ints with value 20
std::vector<int> fourth(second.begin(), second.end()); // a copy of second
std::vector<int> fifth(third); // a copy of third
std::vector<int> sixth = {5, 7, 9}; // three ints with values 5, 7, 9
std::vector<std::string> words {"hello", "from", "the", "other", "side"}; // c++11 initializer list
```

#### Capacity

```cpp
v.size(); // number of elements
v.empty(); // checks whether the vector is empty
```


#### Modifiers & Access

```cpp
v[i]; // element on the i-th position (zero-indexed)
v.clear(); // clears the vector - size becomes 0, capacity unchanged
v.push_back(element); // inserts element to the back of the vector
```

#### Reference vs. Copy

```cpp
/* Pass by value (v will be a copy of the given argument, not
the argument itself) */
void deepcopy(std::vector<int> v) {
    v[0] = 5;
}

/* Pass by reference (v will be a reference to the given argument,
so any changes on v are actual changes on the argument) */
void reference(std::vector<int> &v) {
    v[0] = 5;
}

int main() {
    std::vector<int> a;
    a.push_back(1);
    a.push_back(2);

    deepcopy(a);
    // a[0] == 1
    reference(a);
    // a[0] == 5
}
```

#### Iteration

```cpp
// Index iteration
for (unsigned i = 0; i < v.size(); ++i) {
    // if i would be int, there would be a warning because v.size() is unsigned
    v[i] = ...;
}

// Iterator iteration
for (std::vector<int>::iterator it = v.begin(); it != v.end(); ++it) {
    *it = ...; // *it is equivalent to v[i]
}
/* Side node: if v would be a reference to a const std::vector, then you
would need "const_iterator" instead of "iterator" so you cannot modify the
values in v */

// C++11 auto iteration
for (auto element : v) {
    // do something with element
    // in this way you CANNOT modify v
}

for (auto &element : v) {
    // do something with element
    // in this way you CAN modify v
}

/* In the first example, element is a copy of an actual element in v. In the
second example, element is a reference to an element in v,. */
```

## std::queue

#### Constructors

```cpp
// You'll probably use only this constructor
std::queue<SomeClass> q;
```

#### Capacity

```cpp
q.size(); // number of elements
q.empty(); // checks whether the queue is empty
```


#### Modifiers & Access

```cpp
q.front(); // first element of the queue: if you add 7, 2 and 9, front() is 7
q.back(); // last element; if you add 7, 2 and 9, back() is 9
q.push(x); // inserts x at the back of the queue
q.pop(); // removes the first (front) element
```

#### Reference vs. Copy

```cpp
/* Pass by value (q will be a copy of the given argument, not
the argument itself) */
void deepcopy(std::queue<int> q) {
    v.pop();
}

/* Pass by reference (v will be a reference to the given argument,
so any changes on v are actual changes on the argument) */
void reference(std::queue<int> &q) {
    q.pop();
}

int main() {
    std::queue<int> a;
    a.push(1);
    a.push(2);

    deepcopy(a);
    // a.size() == 2, a.back() == 2
    reference(a);
    // a.size() == 1, a.back() == 1
}
```

#### Iteration

```cpp
while (!q.empty()) {
    SomeClass x = q.front();
    q.pop();

    // Do something with x, maybe add new elements to q
    ...
}

/* Side note: if you needed to iterate through the elements of a queue, you'd
actually need more than a queue */
```

## std::stack

#### Constructors

```cpp
// You'll probably use only this constructor
std::stack<SomeClass> s;
```

#### Capacity

```cpp
s.size(); // number of elements
s.empty(); // checks whether the stack is empty
```


#### Modifiers & Access

```cpp
s.top(); // the top element of the stack
s.push(x); // inserts x at the top of the stack
s.pop(); // removes the top element
```

#### Reference vs. Copy

```cpp
/* Pass by value (s will be a copy of the given argument, not
the argument itself) */
void deepcopy(std::stack<int> s) {
    v.push(17);
}

/* Pass by reference (v will be a reference to the given argument,
so any changes on v are actual changes on the argument) */
void reference(std::stack<int> &s) {
    s.push(17);
}

int main() {
    std::stack<int> a;
    a.push(1);
    a.push(2);

    deepcopy(a);
    // a.size() == 2, a.top() == 2
    reference(a);
    // a.size() == 3, a.top() == 17
}
```

#### Iteration

```cpp
while (!s.empty()) {
    SomeClass x = q.top();
    s.pop();

    // Do something with x, maybe add new elements to s
    ...
}

/* Side note: if you needed to iterate through the elements of a stack, you'd
actually need more than a stack */
```

## std::map

#### Constructors

```cpp
// You'll probably use only this constructor
std::map<KeyClass, ValueClass> m;
```

#### Capacity

```cpp
m.size(); // number of elements
m.empty(); // checks whether the map is empty
```


#### Modifiers & Access

```cpp
m[key]; // value at key
m.at(key); // value at key
m[key] = value; // puts value at key
m.clear(); // clears the map - size becomes 0
```

#### Lookup

```cpp
// Search for an element
if (m.find(someKey) == m.end()) {
    // this means the key someKey is not found in the map
} else {
    // m[someKey] exists
}
```

#### Reference vs. Copy

```cpp
/* Pass by value (m will be a copy of the given argument, not
the argument itself) */
void deepcopy(std::map<std::string, int> m) {
    m["foo"] = 10;
}

/* Pass by reference (m will be a reference to the given argument,
so any changes on v are actual changes on the argument) */
void reference(std::vector<std::string, int> &m) {
    m["foo"] = 20;
}

int main() {
    std::map<std::string, int> a;
    a["foo"] = -1;

    deepcopy(a);
    // a["foo"] == -1
    reference(a);
    // a["foo"] == 20
}
```

#### Iteration

```cpp
// Iterator iteration
for (std::map<KeyClass, ValueClass>::iterator it = m.begin(); it != m.end(); ++it) {
    // it->first is the key of the current element
    // it->second is the value of the current element
}

/* Side node: if m would be a reference to a const std::map, then you
would need "const_iterator" instead of "iterator" so you cannot modify the
values in m */

// C++11 auto iteration
for (auto p : m) {
    // p is a copy of the (key, value) element stored in the map
    // if you modify p.second, you WON'T modify m
}

for (auto &p : v) {
    // p is a reference of the (key, value) element stored in the map
    // if you modify p.second, you WILL modify m
}
```

## std::unordered_map

It has the **same** usage pattern as map.

Differences:
- std::map:
    - stored as a **binary search tree**
    - add/search average complexity is **O(logN)**
    - elements are in **sorted** order when you iterate through them
- std::unordered_map:
    - stored as a **hashtable**
    - add/search average complexity is **O(1)**
    - elements are **NOT** in **sorted** order when you iterate through them