# OpenCV Spatial Domain


> 지금까지 배운 화소단위 처리는 새로운 영상을 생성할 때 특정 화소만의 값을 이용해 처리
<!--more-->
> 영역처리는 출력 화소를 만들기 위해 입력화소 뿐만 아니라 그 이웃한 화소들도 이용

- 영역처리 방법
    - 컨볼루션 (회선)
    - 양각효과
    - 평균값 필터링
    - 중간값 필터링
    - 샤프닝
    - 윤곽선 검출

## 컨볼루션 (회선)

> 출력화소의 값을 계산하기 위해 입력화소, 이웃화소값에 회선 마스크의 값을 곱하여 구하는 기법

![image](/files/mask1.png)

- 회선마스크의 경우 대부분 3X3, 5X5 크기를 많이 사용.
- 회선마스크의 크기가 증가할수록 계산의 양은 지수함수적으로 증가
- 이 방법으로는 구할수없는 영상의 가장자리 픽셀들의 경우
    - 빈 마스크의 계수를 0으로 가정하여 계산하거나
    - 계산을 아예 하지 않거나 (제일 많이 사용)
    - 경계부분의 화소를 복사
- 보통 RGB의 경우 HSI 컬러 스페이스로 변환해 밝기 채널에 대해서만 연산을 수행한다

```python
# 컨볼루션 연산 담당 함수
result = cv2.filter2D(소스이미지, -1, 필터)
```

### 평균값 필터링 (블러링)

> 현 픽셀의 값을 주위 픽셀들의 평균값으로 대체

![image](/files/mask2.png)

- 평균값의 마스크의 경우 위와같이 모든 구역의 합은 1이 되도록한다.

```python
import cv2
import numpy as np

img = cv2.imread('dog.jpg')

blur_filter = np.ones((5, 5))/25
blured = cv2.filter2D(img, -1, blur_filter) # 필터 가지고 직접 생성

blured = cv2.blur(img, (5, 5)) # 자동으로 필터 생성 후 블러처리까지
blured = cv2.boxFilter(img, -1, (5, 5)) # 역시 자동으로 필터 생성 후 블러처리까지

cv2.imshow('결과', blured)
cv2.waitKey()
cv2.destroyAllWindows()
```

### 이미지 합치기 (팁)

```python
# 가로로 스택처럼 합쳐짐
merged = np.hstack((img1, img2, img3))
```

### 가우시안 블러링

> 중앙 값이 가장 크고 멀어질수록 그 값이 작아지는 가중 평균값 필터를 사용

![image](/files/mask3.png)

```python
# 직접 필터 생성하여 블러
k1 = np.array([[1, 2, 1],
							 [2, 4, 2],
							 [1, 2, 1]]) * (1/16)
blur1 = cv2.filter2D(img, -1, k1)

k2 = cv2.getGaussianKernel(3, 0)
blur2 = cv2.filter2D(img, -1, k2*k2.T) # 1차원 배열 2차원으로

# cv2.GaussianBlur(이미지, 필터크기, 표준편차)
blur3 = cv2.GaussianBlur(img, (3,3), 0)
```

### 중간값 필터링

> 현 픽셀 주위에 있는 픽셀값들을 정렬해 그것들의 중간값으로 현 픽셀의 값을 대체

> Salt and Pepper의 노이즈는 0또는 255같은 극단값이기에 그러한 잡음을 제거하는데 효과적

![image](/files/mask4.png)

```python
# (소스, 커널크기)
blur = cv2.medianBlur(img, 5)
```

- 수채화 효과가 나타나기도 함

### 바이레터럴 필터

> 블러링 필터는 잡음을 제거하는데 효과가 있으나 경계가 흐릿해짐

> 개선을 위해 가우시안 필터 + 경계 필터 2개를 사용. 속도는 느림.

```python
# (소스, 필터직경, 컬러스페이스_표준편차, 좌표공간_표준편차)
# 보통 두개 표준편차는 같은 값 씀
blur = cv2.bilateralFilter(img, 5, 75, 75)
```

## 경계선 검출

> 색상값 또는 밝기의 변화가 큰 부분이 경계 부분이라고 가정하고 추출

### 에지의 요인

![image](/files/mask5.png)

- **물체면의 차이** Surface-Normal Discontinuity
    - 물체 표면의 법선 벡터가 급격히 변하는 곳
    - 뚜껑 윗부분과 벽 부분처럼 거의 90도 차이가 남
- **거리의 차이** Depth Discontinuity
    - 카메라로부터 거리가 급격히 변하는 곳
    - 병과 그 배경은 깊이감이 다름
- **물체표면 반사도의 차이** Surface-Reflectance Discontinuity
    - 기하학적으로는 차이가 없지만 색깔이 급변하는 곳
    - 글씨가 쓰여있고 안쓰여있고
- **조명의 차이** Illumination Discontinuity
    - 그림자가 있는 부분 없는 부분

### 에지 프로파일

> 밝기의 변화를 그래프화 한 것

- 스텝 에지
    - 계단처럼 밝기가 급격히 변화
- 램프 에지
    - 밝기가 서서히 변화
- 라인 에지
    - 두 개의 스텝 에지가 겹침
- 루프 에지
    - 두 개의 램프 에지가 겹침

### 로버츠 마스크

```python
# 로버츠 커널
gx_kernel = np.array([[1, 0], [0, -1]])
gy_kernel = np.array([[0, 1], [-1, 0]])

edge_gx = cv2.filter2D(img, -1, gx_kernel)
edge_gy = cv2.filter2D(img, -1, gy_kernel)

marged = edge_gx + edge_gy
```

- 가장 먼저 고안됨
- 마스크 크기가 작아 연산이 빠름
- 잡음에 민감

### 프리윗 마스크

![image](/files/mask6.png)

```python
gx_kernel = np.array([[-1, 0, 1], [-1, 0, 1], [-1, 0, 1]])
gy_kernel = np.array([[-1, -1, -1], [0, 0, 0], [1, 1, 1]])

edge_gx = cv2.filter2D(img, -1, gx_kernel)
edge_gy = cv2.filter2D(img, -1, gy_kernel)

marged = edge_gx + edge_gy
```

- 대각선보다 수평 에지와 수직 에지를 잘 검출
- 소벨 마스크보다는 연산 빠름

### 소벨 마스크

![image](/files/mask7.png)

```python
gx_kernel = np.array([[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]])
gy_kernel = np.array([[-1, -2, -1], [0, 0, 0], [1, 2, 1]])

edge_gx = cv2.filter2D(img, -1, gx_kernel)
edge_gy = cv2.filter2D(img, -1, gy_kernel)

# (소스, -1, x여부, y여부, ksize=(필터크기))
# 사실 x여부, y여부가 아니라 미분 차수라는데 난 잘 모르니깐..
sobelx = cv2.Sobel(img, -1, 1, 0, ksize=3)
sobely = cv2.Sobel(img, -1, 0, 1, ksize=3)
```

- 수평, 수직보다 대각선 에지를 잘 검출
- 비교적 잡음에 강함

### 라플라시안 마스크

![image](/files/mask8.png)

```python
edge = cv2.Laplacian(img, -1)
```

- 잡음에 매우 민감해 사전에 가우시안 필터로 노이즈를 제거하고 사용하는것을 추천
- X, Y 동시에 검출하는 모습

### 케니 엣지

> 가장 유명한 엣지 검출법. 네 가지의 단계를 거쳐 엣지 검출

```python
# (소스, minVal, maxVal)
# 보통 2배, 3배 차이 권장
edges = cv2.Canny(img, 150, 300)
```

1. Noise Reduction
    - 이미지의 노이즈를 제거.
    - 5 X 5의 가우시안 필터 사용
2. Edge Gradient Detection
    - Gradient들의 방향과 각도 확인
    - 경계값에서는 주변과 색이 다르기 때문에 미분값이 급속도로 변함
    - 이를 통해 경계값 후보군 선별
    - 소벨 엣지를 쓴다
3. Non maximum Suppression
    - 이미지의 픽셀을 Full Scan하여 엣지가 아닌 픽셀은 제거
4. Hysteresis Thresholding
    - 지금까지 엣지로 판단된 픽셀이 진짜 엣지인지 판별
    - maxVal, minVal을 설정
        - maxVal 이상은 강한 엣지,
        - minVal ~ maxVal 은 약한 엣지로 설정
        - 약한 엣지가 진짜 엣지인지 확인
            - 강한 엣지와 연결이 되어있으면 엣지로 판단
            - 아니라면 제거
