# OpenCV Blending

## 12. 블렌딩

> OpenCV는 `Saturation` 연산을 하고, Numpy는 `Modulo` 연산을 한다

```python
a = np.uint8([[200, 50]])
b = np.uint8([[100, 100]])

add1 = a + b         # [[44 150]]  (오버플로우된 값이 반영)
add2 = cv2.add(a, b) # [[255 150]] (uint8 한계치인 255까지만 반영)

sub1 = a - b               # [[100 206]] (음수 오버플로우되어 반영)
sub2 = cv2.substract(a, b) # [[100 0]]   (unit 한계치인 0까지만 반영)
```

- `Saturation` : 0~255까지 한계치를 두고 연산
- `Modulo` : 오버플로우가 일어나면 그 일어난 값만큼 다시 한계치에서 더해줌
<!--more-->
### 알파 블렌딩

> 이미지를 합칠 때 가중치를 두어 합치는 방법

![image](/files/blending1.png)

```python
import cv2
import numpy as np

alpha = 0.5 # 합성에 사용할 알파 값

img1 = cv2.imread('img1.jpg')
img2 = cv2.imread('img2.jpg')

blended = img*alpha + img2*(1-alpha)
blended = blended.astype(np.uint8) # 소수점 발생 제거
cv2.imshow('numpy 배열 직접 연산', blended)

# cv2.addWeighted(합성대상1, 합성대상1_가중치, 합성대상2, 합성대상2_가중치, 연산결과에_가감할_상수)
dst = cv2.addWeighted(img1, alpha, img2, (1-alpha), 0)
cv2.imshow('cv2의 addWeighted 사용', dst)

cv2.waitKey(0)
cv2.destroyAllWindows()
```
