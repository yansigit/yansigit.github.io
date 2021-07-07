# OpenCV 컬러 스페이스

## 1. 이진 이미지

- 한개의 픽셀을 두가지 값으로만 표현
- 흰색과 검은색으로만 이미지를 표시
<!--more-->
## 2. 그레이스케일 이미지

- 흔히 말하는 흑백사진
- 명암으로만 사진을 표현
- 한개의 픽셀을 0~255 값으로 표현해 명암의 정도를 표현
- 빛이 하나도 없는 0 상태가 가장 어두운 것

## 3. 컬러 이미지

- RGB, BGR, RGBA 등

```python
img = cv2.imread('img.png')
bgra= cv2.imread(img.png', cv2.IMREAD_UNCHANGED)

print(img.shape) # (width, height, 3=bgr)
print(bgra.shape) # (width, height, 4=bgra)

cv2.imshow('bgr', img)
cv2.imshow('bgra', bgra)
cv2.imshow('alpha', bgra[:,:,3]) # alpha만 출력
cv2.waitKey(0)
cv2.destroyAllWindows()
```

### 컬러 스페이스 변환 : BGR → 그레이스케일

```python
import cv2
import numpy as np

img = cv2.imread('dog.jpg')

img2 = img.astype(np.uint16) # dtype 변경
b,g,r = cv2.split(img2)
# b,g,r = img2[:,:,0], img2[:,:,1], img2[:,:,2]

gray1 = ((b+g+r)/3).astype(np.uint8) # 직접 3개의 채널 평균 계산 후 dtype 변경
gray2 = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY) # cv2Color 메소드 이용해 그레이스케일로 변경
gray3 = (0.114*b + 0.587*g + 0.299*r).astype(np.uint8) # 미국 NTSC에서 제시한 그레이스케일 변경식

cv2.imshow('/3', gray1)
cv2.imshow('cvtColor', gray2)
cv2.imshow('NTSC', gray3)

cv2.waitKey(0)
cv2.destroyAllWindows()
```

### HSV

> H 색조 S 채도 V 명도

> 픽셀의 색상이 궁금할 때 앞의값만 비교하면 되므로 효과적

```python
red_hsv = cv2.cvtColor(red_bgr, cv2.COLOR_BGR2HSV) # 0 255 255
green_hsv = cv2.cvtColor(green_bgr, cv2.COLOR_BGR2HSV) # 60 255 255
blue_hsv = cv2.cvtColor(blue_bgr, cv2.COLOR_BGR2HSV) # 120 255 255
yellow_hsv = cv2.cvtColor(yellow_bgr, cv2.COLOR_BGR2HSV) # 30 255 255
```

### YUV

> Y 밝기, U 밝기와 파란색과의 색 차, V 밝기와 빨간색과의 색 차

> 밝기를 제어할 때 Y만 비교하면 되므로 효과적

```python
(0, 128, 128) # dark
(127, 128, 128) # middle
(255, 128, 128) # bright
```

