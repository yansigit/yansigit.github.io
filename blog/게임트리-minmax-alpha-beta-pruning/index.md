# 게임트리

<!--more-->
# 게임트리 (minmax, alpha-beta pruning)

![%E1%84%80%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%B7%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%20(minmax,%20alpha-beta%20pruning)/Untitled.png](%E1%84%80%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%B7%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%20(minmax,%20alpha-beta%20pruning)/Untitled.png)

# 1. Game Tree Search

## 게임트리

![%E1%84%80%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%B7%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%20(minmax,%20alpha-beta%20pruning)/Untitled%201.png](%E1%84%80%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%B7%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%20(minmax,%20alpha-beta%20pruning)/Untitled%201.png)

- 상대가 있는 게임에서 자신과 상대방의 가능한 게임 상태를 나타낸 트리
    - 틱택톡, 바둑, 장기, 체스 등
- 게임의 결과는 마지막에 결정. 제로섬.
- 많은 수를 볼수록 유리

## Mini-Max 알고리즘 ⭐

> 하단부터 상단까지 올라감

![%E1%84%80%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%B7%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%20(minmax,%20alpha-beta%20pruning)/Untitled%202.png](%E1%84%80%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%B7%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%20(minmax,%20alpha-beta%20pruning)/Untitled%202.png)

- MAX 노드
    - 자신에 해당하는 노드
    - 자신에게 유리한 최대값 선택

- MIN
    - 상대방에 해당하는 노드
    - 최소값 선택
- 단말 노드부터 위로 올라가면서 최소-최대 연산을 반복하여 자신이 선택할 수 있는 방법 중 가장 좋은 것으로 값 결정

![%E1%84%80%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%B7%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%20(minmax,%20alpha-beta%20pruning)/Untitled%203.png](%E1%84%80%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%B7%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%20(minmax,%20alpha-beta%20pruning)/Untitled%203.png)

- DFS
- Depth m, branch b → 시간복잡도 O(b^m)

## 알파-베타 가지치기 ⭐

![%E1%84%80%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%B7%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%20(minmax,%20alpha-beta%20pruning)/Untitled%204.png](%E1%84%80%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%B7%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%20(minmax,%20alpha-beta%20pruning)/Untitled%204.png)

![%E1%84%80%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%B7%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%20(minmax,%20alpha-beta%20pruning)/Untitled%205.png](%E1%84%80%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%B7%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%20(minmax,%20alpha-beta%20pruning)/Untitled%205.png)

- 검토할 필요가 없는 부분을 탐색하지 않도록 하는 기법
- 깊이 제한 DFS로 탐색을 할 때, 알파 값과 베타 값이 자식 노드로 전달된다
- 자식 노드에서는 알파와 베타 값을 비교해 쓸데없는 탐색을 중지
    - a- 자르기 : MIN 노드의 현재값 b가 부모노드의 a값보다 작거나 같으면, 나머지 자식 노드 탐색 중지
    - b- 자르기 : MAX 노드의 현재값 a가 부모노드의 b값보다 같거나 크면, 나머지 자식 노드 탐색 중지

## 몬테카를로

- 수학적이나 이론적으로 접근할 수 없을 때 사용
- 수많은 무작위 수 사용하여 반복 실험 → 예상확률
- 이미 알고있는 부분과 수학적으로 적절히 구성
