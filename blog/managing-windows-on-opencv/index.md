# Managing Windows on Opencv

openCV에서 창 관리
<!--more-->
## 1. 이름을 갖는 창 열기

```python
# title = 창 이름
# option = 창의 옵션
		# cv2.WINDOW_NORMAL: 임의의 크기. 창 크기 조정 가능
		# cv2.WINDOW_AUTOSIE: 이미지와 같은 크기. 창 크기 조정 불가능
cv2.namedWindow(title [, option])
```

## 2. 창 위치 이동

```python
# title = 위치를 변경할 창 이름
cv2.moveWindow(title, x, y)
```

## 3. 창 크기 변경

```python
cv2.resizeWindow(title, width, height)
```

## 4. 창 닫기

```python
cv2.destroyWindow(title)
```

## 5. 모든 창 닫기

```python
cv2.destroyAllWindows()
```
