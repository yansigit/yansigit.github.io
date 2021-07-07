# Numpy and Matplotlib


## Numpy

```python
import cv2
import numpy as np

img = np.zeros((120,240), dtype=np.uint8) # 120,240 2차원 배열 생성
img[25:35, :] = 255
img[55:65, :] = 115
img[85:95, :] = 160
img[:, 35:45] = 205
img[:, 75:85] = 255
cv2.imshow('Gray', img)
if cv2.waitKey(0) & 0xFF = 27:
		cv2.destroyAllWindows()
```
<!--more-->
```python
import cv2
import numpy as np

img = np.zeros((120,240,3), dtype=np.uint8) # 120,240 2차원 배열 생성, 3채널 컬러 이미지
img[25:35, :] = [255, 0, 0]
img[55:65, :] = [0, 255, 0]
img[85:95, :] = [0, 0, 160]
img[:, 35:45] = [205, 255, 0]
img[:, 75:85] = [255, 0, 255]
cv2.imshow('BGR', img)
if cv2.waitKey(0) & 0xFF = 27:
		cv2.destroyAllWindows()
```

## Matplotlib

- 데이터 시각화 라이브러리
- 도표 혹은 차트 등 쉽게 그리기 가능

### 1. 그림 여러개 띄우기

> OpenCV에서는 한 화면에 여러 이미지를 띄우는 용도로 많이 사용

```python
import cv2
import matplotlib.pyplot as plt

img = cv2.imread('dog.jpg')

plt.imshow(img)  # cv2는 B,G,R 순서, plt.imshow()는 R,G,B 순서로 데이터를 읽으므로 B,G,R 순서인 cv2 데이터를 그대로 읽으면 색이 이상하게 나옴
plt.title("1")
plt.yticks([]) # y좌표 눈금 제거
plt.xticks([]) # x좌표 눈금 제거
plt.show()

plt.imshow(img[:, :, ::-1])  # 이렇게 순서를 바꿔주면 정상적으로 보인다
plt.title("2")
plt.yticks([]) # y좌표 눈금 제거
plt.xticks([]) # x좌표 눈금 제거
plt.show()

plt.imshow(img[:, :, (2,1,0)]) # 이렇게도 가능
plt.title("3")
plt.yticks([]) # y좌표 눈금 제거
plt.xticks([]) # x좌표 눈금 제거
plt.show()

plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))  # 구글 검색해보니 이렇게해도 되는듯
plt.title("4")
plt.yticks([]) # y좌표 눈금 제거
plt.xticks([]) # x좌표 눈금 제거
plt.show()
```

### 2. 그래프 그리기

![image](/files/matplotlib1.png)

```python
import matplotlib.pyplot as plt
import numpy as np

x = np.arange(10) # 0 ~ 9
y = x ** 2        # 0, 1, 4, 9, 16, 25, 36 ...

plt.plot(x,y)
plt.show()
```

#### 그래프 옵션들

```python
# 조합 가능
plt.plot(x, 'r--') # red, -- (이음선)
plt.plot(x, 'g.') # green, ●
plt.plot(y, 'bv') # blue, ▼
plt.plot(y, 'ks') # blacK, square ■
```

#### SubPlot

구획을 나눠 한 화면에 보여줌

```python
plt.subplot(2,2,1) # 2행 2열 중 1번째
plt.plot(x, 'r--') # red, -- (이음선)

plt.subplot(2,2,1) # 2행 2열 중 2번째
plt.plot(x, 'g.') # green, ●

plt.subplot(223) # 2행 2열 중 3번째
plt.plot(y, 'bv') # blue, ▼

plt.subplot(224) 2행 2열 중 4번째
plt.plot(y, 'ks') # blacK, square ■

```
