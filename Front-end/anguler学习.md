# anguler学习.md

## 安装

```
npm install -g @angular/cli
ng new my-app --style=scss // 指定 scss
cd my-app
ng serve --open
```

## 新建组件

```
ng generate component new-component // 自动创建组件
ng generate service data // 自动创建 api 接口
ng g c new-component // 自动创建组件
ng g s data // 自动创建 api 接口
```

## 组件传值

Input, Output, ViewChild 

### 父组件  -> 子组件
父组件
```js
import { OnInit } from '@angular/core'
@component({
  selectot: 'app-parent',
  template: `
    <h1>parent</h1>
    <app-child [message]="mesage"></app-child>
  `
})
export class ParentComponent implement OnInit {
  construtor () {}
  message = "hell world"
  ngOnInit () {

  }
}
```
子组件
```js
import { Input, OnInit } from '@angular/core'
@component({
  selectot: 'app-child',
  template: `
    <h1>child</h1>
    <h3>{{ message }}</h3>
  `
})
export class ChildComponent implement OnInit {

  @Input () message: string
  construtor () {}
  ngOnInit () {

  }
}
```

### 子组件 -> 父组件 Output
父组件
```js
import { OnInit } from '@angular/core'
@component({
  selectot: 'app-parent',
  template: `
    <h1>parent</h1>
    <app-child [message]="mesage"></app-child>
    message from child {{ message }}
    <app-child [messageEvent]="reeviceMeassage($event)"></app-child>
  `
})
export class ParentComponent implement OnInit {
  construtor () {}
  message = "hell world"
  ngOnInit () {

  }
  reeviceMeassage ($event) {
    this.message = $event
  }
}
```
子组件
```js
import { Input, OnInit, OutInput, EventEmitter } from '@angular/core'
@component({
  selectot: 'app-child',
  template: `
    <h1>child</h1>
    <h3>{{ message }}</h3>
    <button (click)="sayMessage()">Send message</button>
  `
})
export class ChildComponent implement OnInit {

  message: string = 'say from child'
  @Output () messageEvent = new EventEmitter<string>()
  construtor () {}
  sayMessage () {
    this.messageEvent.emit(this.message)
  }
}
```
### 子组件 -> 父组件 ViewChild
父组件
```js
import { OnInit, ViewChild, AfterViewInit } from '@angular/core'
import { ChildComponent } from './child/ChildComponent'
@component({
  selectot: 'app-parent',
  template: `
    <h1>parent</h1>
    <app-child [message]="mesage"></app-child>
    message from child {{ message }}
    <app-child [messageEvent]="reeviceMeassage($event)"></app-child>
  `
})
export class ParentComponent implement AfterViewInit {
  @ViewChild(ChildComponent) child
  construtor () {}
  message = "hell world"
  ngOnInit () {

  }
  ngAfterViewInit () {
    this.message = this.child.message
  }
  reeviceMeassage ($event) {
    this.message = $event
  }
}
```
子组件
```js
import { Input, OnInit, OutInput, EventEmitter } from '@angular/core'
@component({
  selectot: 'app-child',
  template: `
    <h1>child</h1>
    <h3>{{ message }}</h3>
    <button (click)="sayMessage()">Send message</button>
  `
})
export class ChildComponent implement OnInit {

  message: string = 'say from child'
  @Output () messageEvent = new EventEmitter<string>()
  construtor () {}
  sayMessage () {
    this.messageEvent.emit(this.message)
  }
}
```

### any <-> any

data.service.ts
```js
import { Injectable} from '@anguler/core'
import { BehaviorSubject} from 'rxjs/BehaviorSubject'

@Injectable()
export class DataService {
  private messageSource = new BehaviorSubject<string>('default message')
  currentMessage = this.messageSource.asObservable()
  constructor () {}
  changeMessage (message: string) {
    this.messageSource.next(message)
  }
}
```

其他组件获取数据

```js
message: string
Oninit () {
  this.data.currentMessage.subscribe(message => this.message = message)
}
```

修改数据
```js
newMessage () {
  this.data.changeMessage('new message')
}
```

## 路由

`ng generate module app-routing --flat --module=app`

```html
<router-outlet></router-outlet>
```

### 添加默认路由

`{ path: '', redirectTo: '/dashboard', pathMatch: 'full' }`

### 点击路由

```js
<nav>
  <a routerLink="/dashboard">Dashboard</a>
  <a routerLink="/heroes">Heroes</a>
</nav>
```