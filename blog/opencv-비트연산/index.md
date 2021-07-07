# OpenCV 비트연산


## 비트 연산

```python
bitAnd = cv2.bitwise_and(img1, img2)
bitOr = cv2.bitwise_or(img1, img2)
bitXor = cv2.bitwise_xor(img1, img2)
bitNot = cv2.bitwise_not(img1)
```
<!--more-->
## 비트 연산으로 이미지 마스킹

```python
mask = np.zeros_like(img)
cv2.circle(mask, (150,140), 100, (255, 255, 255), -1)

masked = cv2.bitwise_and(img, mask)

# 2차원 배열만 사용
mask = np.zeros[img.shape[:2], dtype=np.uint8)
cv2.circle(mask, (150,140), 100, (255, 255, 255), -1)

masked = cv2.bitwise_and(img, img, mask=mask)
```

## 영상의 차이

> 틀린 그림 찾기

```python
# 두 영상의 절대값 차 연산
diff = cv2.absdiff(img1_gray, img2_gray)                  # 두 이미지 차이 부분만 픽셀값 남아있음

# 차 영상을 극대화하기 위해 쓰레드홀드 처리 및 칼라 변환
_, diff = cv2.threshold(diff, 1, 255, cv2.THRESH_BINARY)  # 두 이미지 차이부분 모두 255
diff_red = cv2.cvtColor(diff, cv2.COLOR_GRAY2BGR)         # 차이 부분 (255, 255, 255)로 바뀜
cv2.imshow('diff_red', diff_red)

diff_red[:,:,2] = 0                                       # 차이 부분 (255, 255, 0)으로 바뀜
cv2.imshow('diff_red', diff_red)

# 두 번째 이미지에 변화 부분 표시
spot = cv2.bitwise_xor(img2, diff_red)                    # 차이 부분 (0, 0, 255)로 바뀜 (빨강)

# 결과 영상 출력
cv2.imshow('img1', img1)
```
