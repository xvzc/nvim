#include <bits/stdc++.h>

#ifdef LOCAL
#define IF_LOCAL if constexpr (true)
#else
#define IF_LOCAL if constexpr (false)
#endif

#define debug IF_LOCAL std::cout << "[DEBUG]" << ' '
#define endl '\n'
#define fi first
#define se second
#define all(x) (x).begin(), (x).end()

typedef long long ll;
typedef unsigned long long ull;

template <typename X, typename Y>
std::ostream &operator<<(std::ostream &os, const std::pair<X, Y> &p) {
  os << "(" << p.first << ", " << p.second << ")";
  return os;
}

template <class K, class V, class C>
std::basic_ostream<K, V> &operator<<(std::basic_ostream<K, V> &os, C const &c) {
  auto it = cbegin(c);
  os << "{";
  while (it != cend(c))
    os << *it++ && it != cend(c) && os << ", ";
  return os << "}";
}

using namespace std;

/* ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ */

int main() {
  ios_base::sync_with_stdio(false), cin.tie(0);

  return 0;
}
