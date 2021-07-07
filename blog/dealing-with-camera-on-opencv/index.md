# Dealing With Camera on OpenCV


## 카메라 처리
```python
# cv2.VideoCapture(카메라번호)
cap = cv2.VideoCapture(0)

cap.get(cv2.CAP_PROP_FRAME_WIDTH)
cap.get(cv2.CAP_PROP_FRAME_HEIGHT)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 320)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 240)

if cap.isOpened():
		while True:
				ret, img = cap.read() # 다음 프레임 읽기
				if ret:
						cv2.imshow('camera', img)
						if cv2.waitKey(1) != -1: # 1ms 동안 키 입력 대기
								cv2.imwrite('snapshot.jpg', img) # 키 입력 있으면 프레임 저장
								break
						else:
								print('프레임 없음')
								break
else:
		print("카메라 오픈 오류")

cap.release()
cv2.destroyAllWindows()
```
<!--more-->
## 비디오 일부분 레코드

```python
cap = cv2.VideoCapture(0)

if cap.isOpened:
		file_path = './record_fps.avi'

		# fps = 15.0
		fps = cap.get(cv2.CAP_PROP_FPS)
		print('fps=', fps)

		fourcc = cv2.VideoWriter_fourcc(*'DIVX') # 인코딩 포맷

		width = cap.get(cv2.CAP_PROP_FRAME_WIDTH)
		height = cap.get(cv2.CAP_PROP_FRAME_HEIGHT)

		size = (int(width), int(height))
		
		# cv2.VideoWriter(저장될_녹화파일_경로, 인코딩포맷, FPS, (가로길이, 세로길이))
		out = cv2.VideoWriter(file_path, fourcc, fps, size) # VideoWriter 객체 생성

		while True:
				ret, frame = cap.read()
				if ret:
						cv2.imshow('camera-recording', frame)
						out.write(frame)
						if cv2.waitKey(int(1000/fps) != -1 :
								break
				else:
						print('no frame')
						break

		out.release()
else:
		print('열 수 없습니다')

cap.release()
cv2.destroyAllWindows()
```
