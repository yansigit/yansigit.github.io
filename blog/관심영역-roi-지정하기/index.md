# openCV 영역 (ROI) 지정하기

## ROI

> 전체 이미지에서 관심있는 부분만 잘라서 연산 (연산량 단축, 알고리즘 단순화)
<!--more-->
> 주의: 보통 width, height 순인데 이건 행렬 순이므로 height, width 순서

```python
import cv2
import numpy as np

img = cv2.imread('image.jpg')

x=320; y=150; w=50; h=50;
roi = img[y:y+h, x:x+w] # y ~ y+y-1행, x ~ x+x-1 열 까지 슬라이싱
img2 = roi.copy()
img[y:y+h, x+w:x+w+w] = img2 # 바로 옆에다 관심영역 복사

cv2.imshow("img", img)
cv2.imshow("roi", roi)

cv2.waitKey(0)
cv2.destroyAllWindows()
```

## 마우스 드래그로 ROI 지정

> 선택한 영역의 x,y 좌표와 width, height를 반환.

> 영역을 선택하고 나서 스페이스나 엔터를 누르면 실행

> C를 누르면 선택 취소. 이때는 width, height 둘다 0 반환

```python
cv2.selectROI([창_이름,] img [, 크로스바_보이기=True, 마우스시작_중심으로=True])
```

```python
x,y,w,h = cv2.selectROI('img', img, False)

if w and h: # 둘 다 0이 아니면
		roi = img[y:y+h, x:x+w]
		cv2.imshow('cropped', roi)

cv2.imshow('img', img) # 이건 딱히 추가안해도 selectROI에서 이미지 보여주는듯
cv2.waitKey(0)
cv2.destroyAllWindows()
```
