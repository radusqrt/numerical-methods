#include <iostream>
#include <map>
#include <vector>
#include <algorithm>
#include <iomanip>
#include <numeric>

using namespace std;

int main() {
    int n;
    cin >> n;
    
    vector<int> a(n);
    
    for (int i = 0; i < n; i++) {
        cin >> a[i];
    }
    
    sort(begin(a), end(a));
    
    double sum = accumulate(begin(a), end(a), 0);
    double average = sum / n;
    
    double median = a[n / 2];
    
    if (! (n & 1)) {
        median += a[n / 2 - 1];
        median /= 2;
    }
    
    map<int, int> f;
    
    for (int e : a) {
        f[e]++;
    }
    
    int mode = 0;
    
    for (auto e : f) {
        if (e.second > f[mode]) {
            mode = e.first;
        }
    }
    
    cout << setprecision(1) << fixed << average << endl;
    cout << setprecision(1) << fixed << median << endl;
    cout << mode << endl;
    
    return 0;
}
