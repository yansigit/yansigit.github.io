# Drawing Things on Opencv

## 1. 직선 그리기

```python
img = cv2.imread('blank_500.jpg')

# start와 end 점을 연결하여 직선을 그림
# img = 이미지를 그릴 이미지
# start = 시작 좌표 ex; (0,0)
# end = 종료 좌표 ex; (500,500)
# color = BGR 형태의 color ex; (255, 0, 0)
# thickness (int) = 선의 두께, pixel
# lineType = 선 그리기 형식. 픽셀 계단 현상 완화 등.. ex; cv2.LINE_AA (안티앨리어싱), cv2.LINE_4 (브레젠햄 4연결)
cv2.line(img, start, end, color[, thickness, lineType])
```
<!--more-->
## 2. 사각형 그리기

```python
# thickness가 -1이면 채우기
cv2.rectangle(img, start, end, color[, thickness, lineType])
```

## 3. 다각형 그리기

- 여기서는 좌표를 numPy 형식으로 지정한다.

```python
points = np.array([[50,50], [150,150], [100,140], [200,240]], dtype=np.int32)
```

```python
# isCloused(Bool) = 닫힌 도형 여부
# thickness = 여기서는 -1로 채우기 작동 안됨
cv2.polylines(img, points, isClosed, color[, thickness, lineType])
```

## 4. 원, 타원

```python
# center = 원점 좌표 ex; (50,50)
# radius = 원점 반지름 (int)
cv2.circle(img, center, radius, color [, thickness, lineType])

# axes = 기준 축 길이 (50, 75)
# angle = 기준 축 회전 각도 (int)
# from,, to = 호를 그릴 시작 각도와 끝
cv2.ellipse(img, center, axes, angle, from, to, color [, thickness, lineType])
```

## 5. 이미지에 Text 추가

```python
# text(str) = 표시할 문자열
# point = 문자열이 표시될 위치. 문자열의 좌측 아래가 기준 ex; (50,30)
# font = 폰트 글꼴. ex; CV2.FONT_XXX
# fontScale = 폰트 사이즈 스케일
cv2.putText(img, text, point, fontFace, fontScale, color [, thickness, lineType])
```

- fontFace
    - FONT_HERSHEY_COMPLEX : 상대적으로 복잡한 모양
    - FONT_HERSHEY_SIMPLEX : 단순한 모양
