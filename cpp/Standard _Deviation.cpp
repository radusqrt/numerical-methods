#include <iostream>
#include <vector>
#include <numeric>
#include <iomanip>
#include <cmath>

using namespace std;

double mean(vector<int> a) {
    return (static_cast<double>(accumulate(begin(a), end(a), 0))) / static_cast<int>(a.size());
}

int main() {
    int n;
    cin >> n;
    
    vector<int> a(n);
    
    for (int i = 0; i < n; i++) {
        cin >> a[i];
    }
    
    double m = mean(a);
    double s = 0;
    
    for (int e : a) {
        s += (e - m) * (e - m);
    }
    
    s /= n;
    
    cout << setprecision(1) << fixed << sqrt(s);
    
    return 0;
}
