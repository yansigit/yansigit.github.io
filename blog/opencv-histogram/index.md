# OpenCV Histogram


## 1. 개요

> 이미지의 밝기 분포를 그래프로 표현한 방식

> 즉 각 픽셀의 밝기를 모아 그래프로 표현한 것
<!--more-->
![image](/files/histogram1.png)

```python
# cv2.calcHist([image], [채널], [마스크], [histSize], [ranges]
# histSize는 
hist = cv2.calcHist([image], [0], None, [256], [0, 255])
plt.plot(hist, color)
```

```python
import cv2
import matplotlib.pylab as plt

img = cv2.imread('dog.jpg')
cv2.imshow('img', img)

channels = cv2.split(img) # b, g, r의 픽셀값들이 각각 나뉘어 들어감
colors = ('b', 'g', 'r')  # 이거랑 zip 해주면

# 인덱싱하듯 (b의 화솟값들, b) (g 화솟값들, g) 이런식으로 됨
for (ch, color) in zip(channels, colors):
    hist = cv2.calcHist([ch], [0], None, [256], [0, 255])
    plt.plot(hist, color)

plt.show()
```

- BINS: 히스토그램 그래프의 X축의 간격. OpenCV에서는 `hisSize`로 표현
- Ranges : 화소가 가지는 값의 범위
- 리스트로 줄 수 있으므로 이렇게 For로 안하고 리스트로 몇개씩 한꺼번에 넣어 그래프를 그릴수도 있다.
    - 채널은 이렇게 한꺼번에 줄 때..
        - 예를들어 칼라 이미지 2개를 주고 채널 [0,4]를 넣어준다면
        - 그 이미지의 G, B, R 순으로.. 이미지 1의 G, 이미지 2의 B 채널을 선택해 해당 채널의 화소 분포 그래프를 그려줄 것이다.

## 2. 히스토그램 평탄화 (이퀄라이즈)

> 이미지의 대비를 좀 더 높게

![image](/files/histogram2.png)

```python
equalized_img = cv2.equalizeHist(img)
hist = cv2.calcHist([equalized_img], [0], None, [256], [0, 256])
plt.plot(hist)
```

### 컬러 이미지 이퀄라이즈

```python
img = cv2.imread('image.jpg')

# yuv로 변경
img_yuv = cv2.cvtColor(img, cv2.COLOR_BGR2YUV)

# yuv의 첫번째 컬러 스케일에 대해 이퀄라이즈 적용 (밝기)
img_yuv[:,:,0] = cv2.equalizeHist(img_yuv[:,:,0])

# 다시 bgr로 변경
img = cv2.cvtColor(img_yuv, cv2.COLOR_YUV2BGR)

cv2.imshow('Result', img2)
cv2.waitKey()
cv2.destroyAllWindows()
```

### 일정 부분별로 나눠 이퀄라이즈 적용

```python
# clibLimit : Contrast 제한 경계 값. 기본 40.0
# tileGridSize : 영역 크기. 기본 8 X 8
clahe = cv2.createCLAHE(clipLimit, tileGridSize)

# src : 이미지
clahe.apply(src)
```

```python
clahe = cv2.createCLAHE(3.0, (8, 8))
img_yuv[:,:,0] = clahe.apply(img_yuv[:,:,0])
img_result = cv2.cvtColor(img_yuv, cv2.COLOR_YUV2BGR)
cv2.imshow(img_result)
```
