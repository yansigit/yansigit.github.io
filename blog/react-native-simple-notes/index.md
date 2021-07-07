# React Native Simple Notes


## 컴포넌트 기본 구조

`App.js` 

```jsx
import React, { Component } from 'react';

// Hello Component (View)
// 이제 해당 컴포넌트는 JSX 내부에 <Hello /> 식으로 사용 가능
class Hello extends Component {
  render() {
    return (
      <h1>hello, {this.props.name}</h1>
    );
  }
}

export default Hello;
```
<!--more-->
`index.js` 

```jsx
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App'; // App.js

// React.StrictMode -> UI 렌더 시 에러 일어나면 에러 띄워준다고 함.
ReactDOM.render(
  <React.StrictMode>
    <App name="yoon" />
  </React.StrictMode>,
  document.getElementById('root')
);
```

`index.html`

```html
<div id="root"></div>
```

## Props vs State

### Props

- 사용자 입장에서 컨포넌트를 조작할 수 있는 기능
- 아이폰의 버튼, UI
- 즉 태그에다 Prop을 사용해 사용환경 조작
- 컴포넌트 밖에서 Props를 조작해야 함
    - 컴포넌트 내부에서 Props를 조작하는 것은 금지되어 있음 (에러 발생)

### State

- 개발자 입장에서 컨포넌트를 조작하는 기능
- 아이폰의 부품

## Constructor & State

```jsx
class comp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      subject:{title:'jemok',sub:'buje'},
      thumbs: [{name:'flower.jpg', width:'150px'}, {name='guitar.jpg', width='100px'}]
    };
  }

  render() {
    return(
      <Subject title={this.state.subject.title} />
      <Thumb resource={this.state.thumbs} /> // 내부적으로 리스트를 이용해 순차적으로 출력
    );
  }
}
```

- Component
    - 컴포넌트가 실행될 때 먼저 실행되는 부분

## State 에 값 추가하기

```jsx
class test extends Component {
  constructor(props) {
    this.state = {
      Jade : {grade:'A', country='USA'},
      Holmes : {grade:'S', country='England'},
      SomeExp : {
        Sci : { teacher:'Matt', rate:'A+' },
        Korean : { teacher:'Kim', rate:'B+' }
      }
  };

  render() {
    return(
      <button onClick={ function() {
        var _new = this.state.SomeExp.concat({History : { teacher:'Tom', rate:'A' });
        this.setState({ SomeExp : _new });
      }.bind(this) }></button>
    )
  }
}
```

## Event

- React에서는 Props나 State가 변경되면 render()가 자동으로 호출되어 다시 그림
    - 단 setProp, setState을 이용하여 변경했을 때
- 태그에 onClick (HTML과 다르게 대문자를 꼭 지켜서 적어줘야한다) 를 적어서 실행시킬 함수를 호출
    - 익명함수 `function() {}` 사용 가능
- 해당 함수에 인자 `e (event)`를 주어 이벤트를 쉽게 핸들링 가능
    - `e.preventDefault()` 함수를 이용하면, 이벤트가 가지고 있는 기본적인 동작을 방지 가능
    - 즉 페이지 리로드 등
    - 해당 함수 내에서 this `(component)`를 사용하고 싶다면
        - `function(e){}.bind(this)` 를 이용하여 this 값을 포함시킬 수 있다
- 함수도 Prop를 통하여 전달이 가능하다.

```jsx
// App.js
<Subject onPageChanged={ function() { alert('hello') }.bind(this) }

// Subject.js
..
<a href="/" onClick={ function(e) { e.preventDefault(); this.props.onPageChanged(); }>테스트</a>
..
```

## Form

- `onSubmit`
    - 폼을 Submit할 때 내부의 함수를 자동으로 실행
- 폼의 elements 들의 value 값을 얻는 방법
    - onSubmit를 통해 `function(e)`를 실행할 때
        - `e.target` 은 폼 그 자체가 됨
        - `e.target.element_name`을 통해 해당 폼의 엘리먼트를 가져올 수 있음

## `shouldComponentUpdate()`

```jsx
class Test extends Component {
  shouldComponentUpdate(newProps, newState) {
    return false; // 부모 컴포넌트의 State가 바뀌더라도 render() 호출 안하게
  }
  render() {
    return(...);
  }
}
```

- 기본적으로 부모 함수가 `render()` 되면 자식 컴포넌트도 함께 `render()` 된다.
    - 즉 성능 낭비가 일어날 여지가 있다
- 해당 함수를 사용하고 `return false;` 를 해주면
    - 부모 컴포넌트의 State가 바뀌더라도 `render()` 호출하여 다시 그려주지 않음

## Immutable

Javascript나 Python에서는 변수를 다른 변수에 재할당할 때 같은 메모리 주소를 가르키는 경우가 많다.

즉 재할당 할 시 참조만 하게 한다는 소리다.

따라서 얕은 복사, 깊은 복사 등을 써서 아예 다른 메모리 주소에 복사해줘야 한다.

관련한 방법은 [이곳](https://www.zerocho.com/category/JavaScript/post/5750d384b73ae5152792188d)을 참고

### 얕은 복사 (Shallow Copy)

가장 상위에 위치한 객체들만 복사하고 내부 객체들은 참조만 함

### 깊은 복사 (Deep Copy)

모든 객체들을 복사 (새로 생성)
