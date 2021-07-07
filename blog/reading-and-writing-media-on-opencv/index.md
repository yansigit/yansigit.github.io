# Reading and Writing Media on Opencv


## 1. 이미지 읽어 표시하기

```python
import cv2

# fileName(string) = 경로
# flag(int) 이미지 파일을 읽을 때 옵션
#     cv2.IMREAD_COLOR : 1
#     cv2.IMREAD_GRAYSCALE : 0
#     cv2.IMREAD_UNCHANGED : -1. 이미지 파일을 alpha channel까지 포함 해 읽음
# Returns = 이미지 객체 행렬 (Numpy 행렬)
#     img 값은 numpy의 ndarray type이다.
img = cv2.imread(fileName, flag)

if img is not None:
		# title(str) = 윈도우 창의 타이틀
		cv2.imshow(title, img)
		
		# Return = 입력한 키. -1이면 대기시간 동안 입력 없음
		# delay = 입력한 정수 동안 대기. 0 이거나 없으면 무한대기
		key = cv2.waitKey([delay])
		
		cv2.destroyAllWindows()
else:
		print('No image file.')
```
<!--more-->
## 2. 이미지 저장

```python
cv2.imread('image.jpg', cv2.IMREAD_GRAYSCALE)

# 확장자를 다르게하면 다른 포맷으로 저장 가능
cv2.imwrite('image_gray.jpg', img)
```

## 3. 동영상 파일 프레임 재생

```python
import cv2

cap = cv2.VideoCapture('video.avi') # 동영상 캡쳐 객체 생성
if cap.isOpened(): # 캡쳐 객체 초기화 확인
		while: True:
				ret, img = cap.read() # 다음 프레임 읽기
				if ret: # 프레임을 읽었으면
						cv2.imshow('동영상 재생', img) # 프레임 보이기
						cv2.waitKey(25) # 지연시간 25ms 설정
				else:
						break
else:
		print('동영상을 열 수 없습니다')
cap.release() # 자원 반납
cv2.destroyAllWindows()
```

## 동영상의 속성을 이용해 재생

```python
import cv2

cap = cv2.VideoCapture('video.avi') # 동영상 캡쳐 객체 생성
if cap.isOpened(): # 캡쳐 객체 초기화 확인
		fps = cap.get(cv2.CAP_PROP_FPS) # 프레임 수 구하기
		delay = int(1000/fps) # 딜레이 구하기
		print("FPS: %f, Delay: %dms" %(fps, delay))

		while: True:
				ret, img = cap.read() # 다음 프레임 읽기
				if ret: # 프레임을 읽었으면
						cv2.imshow('동영상 재생', img) # 프레임 보이기
						cv2.waitKey(delay) # 지연시간 25ms 설정
				else:
						break
else:
		print('동영상을 열 수 없습니다')
cap.release() # 자원 반납
cv2.destroyAllWindows()
```
