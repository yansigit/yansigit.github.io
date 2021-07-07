# OpenCV Geometric Transform


> 임의의 기하학적 변환에 의해 화소들의 위치와 화소값을 변경

> 화소들을 움직이거나 새로운  화소를 보간법에 의해 생성
<!--more-->
## 1. 선형 크기 변환

![/files/기하학적1.png](/files/기하학적1.png)

- 직선은 그대로 직선으로, 평행은 그대로 평행으로
- Affine 변환이라고도 함

### 이동, 확대/축소, 회전

![/files/기하학적2.png](/files/기하학적2.png)

### 어핀 변환

![/files/기하학적3.png](/files/기하학적3.png)

```python
pts1 = np.float32([[100, 50], [200, 50], [100, 200]]) # 입력 3 좌표
pts2 = np.float32([[80, 70], [210, 60], [250, 120]])  # 출력 3 좌표

mtrx = cv2.getAffineTransform(pts1, pts2)  # 입력좌표를 출력좌표로 옮기는 Affine 변환 매트릭스 생성

res = cv2.warpAffine(img, mtrx, (cols, rows))

cv2.imshow('45', res)
```

### 찌그러뜨림 (Shear Transform)

![/files/기하학적4.png](/files/기하학적4.png)

### 거울상

![/files/기하학적5.png](/files/기하학적5.png)

## 2. 비선형 기하 변환

- 선의 평생성이 보존되지 않는 변환
- perspective 변환
- 영상을 찌그러뜨리는 `warping` 과 `morphing` 기법
