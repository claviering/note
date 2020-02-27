# anguler学习.md

## 组件传值

1. =: 双向绑定，建立起父 scope 和 directive 独立 scope 的双向联系，如果 directive 中需要更改传入的变量，并且这个更改要传回父 scope，则使用这种绑定。
2. @: 字符串绑定，它是将父 scope 的字符串传入独立 scope，比如aaa="bbb"则传入 bbb 这个字面字符串，`aaa={{bbb}}`则传入 bbb 变量在父 scope 上的值，总之它的结果是字符串。很多地方将其解释为单向绑定是不对的，因为它只能绑定字符串。
3. &: 表达式绑定，简单来说就是将传入的表达式在父 scope 上执行，一般用于传入函数表达式，它将一个函数绑定在独立 scope 上。也可以将&用于单向绑定，如aaa=bbb则会将一个aaa()函数绑定在独立 scope 上，它的返回值是父 scope 上的 bbb 属性值（相当于一个 getter 函数），但 aaa()函数返回的仅仅是初始化 directive 时计算得到的 bbb 的值，后续父 scope 对 bbb 的更改不会反应到独立 scope 上。

## 数据检查

`$scope.$apply();`

## ng-if

ng-if这个指令单独开了一个作用域，它只可以继承，不可以进行往外传值，所以，必须要在要传值的地方给加上$parent. 例如我要将（ng-model=“item”），我要获得query，这是打印不出的，只能（ng-model=“$parent.item”）；

## angular中控制器之间传递参数的方式

[angular中控制器之间传递参数的方式](https://segmentfault.com/a/1190000009167725)

1. 通过$rootscope传参
2. 通过事件的方式
3. 通过服务

## 路由 ui-router

`ui-sref="notFound"` `ui-sref` 加的是 routes 配置中 state 的 名字 不是路由路径

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
import { DataService } from '../data.service';
constructor(private data: DataService) { }
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

## UI 组件 material
```
npm install --save @angular/material @angular/cdk @angular/animations
或者
ng add @angular/material
```

app.module.ts 导入
`import { MatSidenavModule, MatRadioModule} from '@angular/material'`

imports 和 exports 给别的组件用
```ts
@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    AboutComponent,
    NavComponent,
    ContactComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    MatSidenavModule,
    MatRadioModule
  ],
  exports : [
    MatRadioModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
```
## 绑定属性

```html
<h1 [ngClass]="{
  'gray': h1Style,
  'large': !h1Style
}">Home</h1>
<h1 [ngStyle]="{
  'color': h1Style ? 'gray' : 'black',
  'font-size': h1Style ? '1em' : '4em'
}">Home</h1>
```
## 单向数据绑定

`<img [src]="heroImageUrl">`

或者

`<img bind-src="heroImageUrl">`

## 双向数据绑定

`[(ngModel)]="person.name"`

## for 
`<li *ngFor="let hero of heroes">`

## click

`(click)="onSelect(hero)"`

`<button on-click="onSave()">On Save</button>`

## if

`<div *ngIf="selectedHero">`

## 生命周期

1. ngOnChanges()
2. ngOnInit()
3. ngDoCheck()
4. ngAfterContentInit()
5. ngAfterContentChecked()
6. ngAfterViewInit()
7. ngAfterViewChecked()
8. ngOnDestroy()