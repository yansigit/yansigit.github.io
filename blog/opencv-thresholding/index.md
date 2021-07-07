# OpenCV Thresholding


## 기본

```python
# 1. numpy 이용
threst_np = np.zeros_like(img) # 원본과 동일한 크기의 0으로 채워진 이미지 생성
threst_np[img > 127] = 255 # 127보다 큰 값만 255로 변경
```
<!--more-->
```python
# 2. opencv 이용
# 사용된_경계값, 이미지_결과 = cv2.threshold(img, 경계_값, 적용_값, 타입_플래그)
ret, thresh_cv = cv2.threshold(img, 127, 255, cv2.THRESH_BINARY)
plt.imshow(thresh_cv, cmap='gray')
```

- `threshold` 타입 플래그
    - `cv2.THRESH_BINARY` : 픽셀값이 경계값을 넘으면 적용값을 지정, 아니면 0
    - `cv2.THRESH_BINARY_INV` : 위의 반대
    - `cv2.THRESH_TRUNC` : 픽셀값이 경계값을 넘으면 적용값을 지정, 아니면 그대로
    - `cv2.THRESH_TOZERO` : 픽셀값이 경계값을 넘으면 원래 값 유지, 아니면 0
    - `cv2.THRESH_TOZERO_INV` : 위의 반대

## 오츠의 알고리즘

> 대충 그래프상 분포가 peak가 2개가 있다면 그 중간값으로 결정

> 속도가 느림. 노이즈가 많은 영상에는 부적합

```python
ret, thresh_cv = cv2.threshold(img, 127, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)
print(ret) # 전달된 경계값이 무시되고 OTSU 알고리즘에 따라 결정된 경계값이 반환됨
```

## 적응형 쓰레스홀딩

> 이미지를 여러 구역으로 나눠 그 주변 픽셀값만 가지고 계산

> 조명이 일정하지 않거나 배경색이 여럿인 경우에도 앞의 방법들보다 잘나옴

```python
# cv2.adaptiveThreshold(입력_영상, 적용값, 경계값_결정_방법, 타입_플래그, 블록_사이즈, 계산된_경계값에서_가감할_상수)
# 블록 사이즈는 홀수
blk_size = 9
C = 5
th2 = cv2.adaptiveThreshold(img, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THREST_BINARY, blk_size, C)
th3 = cv2.adaptiveThreshold(img, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THREST_BINARY, blk_size, C)
```

- 가우시안 분포를 사용하면 선명함은 떨어지지만 노이즈가 훨씬 적다
