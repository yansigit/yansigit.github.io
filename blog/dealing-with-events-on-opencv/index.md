# Dealing With Events on Opencv


## 1. 키보드 이벤트

```python
key = cv2.waitKey(0) & OxFF # 8비트 마스킹. 몇몇 64비트 환경에서는 32비트를 반환하기 때문에 ord() 값으로 비교하면 다르게 나올 수 있음.
if key == ord('a'): # 키보드 입력이 a 이면
		print('a 입력됨')
```
<!--more-->
## 2. 마우스 이벤트

- 마우스 입력을 받으려면 이벤트를 처리할 함수를 미리 선언해놓고 `cv2.setMouseCallBack()` 함수에 함수 전달

```python
def onMouse(event, x, y, flags, param):
	# 함수 정의
	pass

# win_name = 이벤트를 등록할 윈도우 이름
# onMouse = 이벤트 처리를 위해 미리 선언해놓은 콜백 함수
# param = 필요에 따라 onMouse에 전달할 인자
cv2.setMouseCallBack(win_name, onMouse [, param])
```

- 콜백 함수에서 받아야 할 파라미터들은 다음과 같다
    - event : 마우스 이벤트 종류.  cv2.EVENT_로 시작하는 상수
        - cv2.EVENT_MOUSEOVER
        - cv2.EVENT_(L,R,M)BUTTON(DOWN,UP,BLCLK)
            - BLCLK : 더블클릭
        - cv2.EVENT_MOUSEWHEEL
        - cv2.EVENT_MOUSEHWHEEL
            - 휠 가로 스크롤
    - x, y : 마우스 좌표
    - flags : 마우스 동작과 함께 일어난 상태, cv2.EVENT_FLAG_ 로 시작하는 상수
        - cv2.EVENT_FLAG_LBUTTON (1)
        - cv2.EVENT_FLAG_RBUTTON (2)
        - cv2.EVENT_FLAG_MBUTTON (4)
        - cv2.EVENT_FLAG_CTRLKEY (8)
        - cv2.EVENT_FLAG_SHIFTKEY (16)
        - cv2.EVENT_FLAG_ALTKEY (32)
- flags 처리에서는 상수들이 2비트 자릿수에 맞는 값을 가짐
    - 따라서 & (AND) 연산을 이용해 각각의 비트 자릿수를 보고 해당 키가 눌려져있는지 상태 비교 가능

    ```python
    if flags & cv2.EVENT_FLAG_LBUTTON: # 마우스 왼쪽 버튼이 눌렸는지
    	pass
    ```

## 3. 트랙바

```python
def onChange(value):
		v = cv2.getTrackbarPos('trackbar', 'win_name') # 이렇게 직접 트랙바의 밸류 얻을수도 있음

# cv2.createTrackbar(트랙바이름, 윈도우이름, 시작포인트, 끝포인트, 할당할_함수)
cv2.createTrackbar('trackbar', 'win_name', 0, 100, onChange)
```
