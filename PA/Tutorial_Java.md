# Things that you will probably use a lot.

## ArrayList

#### Constructors

```java
ArrayList<Integer> first = new ArrayList(); // empty vector of ints
ArrayList<Integer> second = new ArrayList(5); // five ints with value 0
ArrayList<Integer> third = new ArrayList(second); // a copy of second
```

#### Capacity

```java
v.size(); // number of elements
v.isEmpty(); // checks whether the vector is empty
```


#### Modifiers & Access

```java
v.get(i); // element on the i-th position (zero-indexed)
v.set(i, element); // puts element on the i-th position (zero-indexed)
v.clear(); // clears the vector
v.add(element); // inserts element to the back of the vector
```

#### Iteration

```java
// Index iteration
for (int i = 0; i < v.size(); ++i) {
    // if i would be int, there would be a warning because v.size() is unsigned
    ... v.get(i) ...;
    // or
    v.set(i, something);
}

// Iterator iteration
for (Iterator<Integer> it = v.iterator(); it.hasNext(); ) {
    System.out.println(it.next());
}

// For-each
for (Integer i : v) {
    // do something with i
    // if you modify i, you **WON'T** modify v
}
```

## Queue (interface)

#### Constructors

```java
// You'll probably use only this constructor
Queue<String> q = new LinkedList<>();
```

#### Capacity

```java
q.size(); // number of elements
q.isEmpty(); // checks whether the queue is empty
```


#### Modifiers & Access

```java
q.peek(); // first element of the queue: if you add 7, 2 and 9, front() is 7
q.add(x); // inserts x at the back of the queue
q.poll(); // removes **and retrieves** the first (front) element or null
```

#### Iteration

```java
while (!q.isEmpty()) {
    SomeClass x = q.poll();
    // or
    SomeClass x = q.peek();
    q.poll();

    // Do something with x, maybe add new elements to q
    ...
}

/* Side note: if you needed to iterate through the elements of a queue, you'd
actually need more than a queue. */
```

## Stack

#### Constructors

```java
// You'll probably use only this constructor
Stack<SomeClass> s = new Stack<>();
```

#### Capacity

```java
s.size(); // number of elements
s.empty(); // checks whether the stack is empty
```


#### Modifiers & Access

```java
s.peek(); // the top element of the stack
s.push(x); // inserts x at the top of the stack
s.pop(); // removes **and retrieves** the top element
```

#### Iteration

```java
while (!s.empty()) {
    SomeClass x = s.pop();
    // or
    SomeClass x = s.peek();
    s.pop();

    // Do something with x, maybe add new elements to s
    ...
}

/* Side note: if you needed to iterate through the elements of a stack, you'd
actually need more than a stack. */
```

## TreeMap

#### Constructors

```java
// You'll probably use only this constructor
TreeMap<KeyClass, ValueClass> m;
```

#### Capacity

```java
m.size(); // number of elements
m.isEmpty(); // checks whether the map is empty
```


#### Modifiers & Access

```java
m.get(key); // value at key
m.put(key, value); // puts value at key
m.remove(k); // deletes the (key, value) pair with key k
it.remove(); // deletes the (key, value) pointed by the iterator it
m.clear(); // clears the map - size becomes 0
```

#### Lookup

```java
m.containsKey(k); // returns true if k is a key mapped in m
m.containsValue(v); // returns true if v is a value mapped by a at least a key
```

#### Iteration

```java
// For-each
for(Map.Entry<KeyClass, ValueClass> entry : m.entrySet()) {
  KeyClass key = entry.getKey();
  ValueClass value = entry.getValue();

  // do something with key and value
}
```

## HashMap

It has the **same** usage pattern as TreeMap.

Differences:
- TreeMap:
    - stored as a **binary search tree**
    - add/search average complexity is **O(logN)**
    - elements are in **sorted** order when you iterate through them
- HashMap:
    - stored as a **hashtable**
    - add/search average complexity is **O(1)**
    - elements are **NOT** in **sorted** order when you iterate through them

## TreeSet

#### Constructors

```java
// You'll probably use only this constructor
TreeSet<SomeClass> m = new TreeSet<>();
```

#### Capacity

```java
s.size(); // number of elements
s.isEmpty(); // checks whether the set is empty
```


#### Modifiers & Access

```java
s.add(x); // inserts x into the set
s.remove(x); // deletes x from the set
it.remove(); // deletes the element pointed by the iterator it
s.clear(); // clears the set - size becomes 0
```

#### Lookup

```java
s.contains(x); // returns true if x is a member of set s
```

#### Iteration

```java
// For-each
for (SomeClass x : s) {
    // do something with x
}
```

## HashSet

It has the **same** usage pattern as TreeSet.

Differences:
- TreeSet:
    - stored as a **binary search tree**
    - add/search average complexity is **O(logN)**
    - elements are in **sorted** order when you iterate through them
- HashSet:
    - stored as a **hashtable**
    - add/search average complexity is **O(1)**
    - elements are **NOT** in **sorted** order when you iterate through them

## PriorityQueue (heap)

#### Constructors

```java
PriorityQueue<SomeClass> pq = new PriorityQueue(); // default initial capacity that orders according to "natural ordering"
PriorityQueue<SomeClass> pq = new PriorityQueue(10, new Comparator<SomeClass> {}); // initial capacity 10 that orders according to the anonymous instantiation of the Comparator class
```

#### Capacity

```cpp
pq.size(); // number of elements
pq.isEmpty(); // checks whether the priority queue is empty
```


#### Modifiers & Access

```java
pq.peek(); // the top element of the priority queue
pq.add(x); // inserts x in heap
pq.poll(); // removes **and retrieves** the top element
```

#### Iteration

```java
while (!pq.isEmpty()) {
    SomeClass x = pq.poll();
    // or
    SomeClass x = pq.peek();
    pq.poll();

    // Do something with x, maybe add new elements to pq
    ...
}

/* Side note: if you needed to iterate through the elements of a priority queue,
you'd actually need more than a priority queue. */
```
# Reference and Polymorphism example in Java

```java
public class Test {
    private static void failChange(List<Integer> v) {
        List<Integer> aux = new ArrayList<>();
        aux.add(2);
        v = aux;
    }

    private static void addA(List<Integer> v) {
        v.add(5);
        v.add(8);
    }

    public static void main(String[] args) {
        List<Integer> a = new ArrayList<>();
        a.add(5);
        a.add(12);

        failChange(a);
        // a.size() == 2
        addA(a);
        // a.size() == 4
    }
}
```
