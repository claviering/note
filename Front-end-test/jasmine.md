# jasmine 单元测试学习

## 安装

### JASMINE FOR NODE.JS
项目安装
```
npm install --save-dev jasmine
node node_modules/jasmine/bin/jasmine init
"scripts": { "test": "jasmine" }
npm test
```
全局安装
```
npm install -g jasmine
jasmine init
```

## 使用

```
jasmine init 
jasmine examples
jasmine
nodemon --exec jasmine 监控文件变化
```
## Custom onComplete

```js
jasmine.onComplete(function(passed) {
    if(passed) {
        console.log('All specs have passed');
    }
    else {
        console.log('At least one spec has failed');
    }
});
```

## you suite
```js
describe("A suite", function() {
  it("contains spec with an expectation", function() {
    expect(true).toBe(true);
  });
});
```

## Run the tests
```js
jasmine.execute();
jasmine.execute(['fooSpec.js'], 'a spec name');
var Jasmine = require('jasmine');
var jasmine = new Jasmine();

jasmine.loadConfigFile('spec/support/jasmine.json');
jasmine.configureDefaultReporter({
    showColors: false
});
jasmine.execute();
```

## Setup and Teardown
```js
describe("A suite with some shared setup", function() {
  var foo = 0;
  beforeEach(function() {
    foo += 1;
  });
  afterEach(function() {
    foo = 0;
  });
  beforeAll(function() {
    foo = 1;
  });
  afterAll(function() {
    foo = 0;
  });
});
```

## Disabling Suites

```js
xdescribe("A spec", function() {
  var foo;

  beforeEach(function() {
    foo = 0;
    foo += 1;
  });

  it("is just a function, so it can contain any code", function() {
    expect(foo).toEqual(1);
  });
});
```

## Pending Specs
```js
// Pending specs do not run, but their names will show up in the results as pending.
// Any spec declared with `xit` is marked as pending.
xit("can be declared 'xit'", function() {
  expect(true).toBe(false);
});
// call the function `pending`
it("can be declared by calling 'pending' in the spec body", function() {
  expect(true).toBe(false);
  pending('this is why it is pending');
});
});
```

##  AAA 模式
1. Arrange 准备 设置测试场景, 准备测试数据
2. Act 执行. 调用被测试代码
3. Asset 断言. 验证被测试代码的行为是否符合预期

### Asset

在 it 函数中
```js
expect(result).toBe(expected)
```

## 内置匹配器
1. toBe(expected) 相等
2. toBeCloseTo(expected, precision) 足够接近
3. toBeDefined
4. toBeFalsy
5. toBeTruthy
6. toBeGreaterThan
7. toBeGreaterThanOrEqual
8. toBeLessThanOrEqual
9. toBeLessThan
10. toBeNaN
11. toBeNull
12. toBeUndefined
13. toContain actual 包含 expected
14. toEqual 两个对象相等
15. toMatch actual match expected, expected 可以是正则表达式或者字符串

## Karma

简单快速在不同浏览器中进行自动化单元测试

## Istanbul

javascript 代码覆盖率工具
### nyc
the Istanbul command line interface 
#### 安装使用

`npm i nyc --save-dev`
`nyc npm test`
```js
{
  "scripts": {
    "test": "nyc mocha"
  }
}
```

#### Running reports

`nyc report`

### 安装

`npm i -g istanbul`

### 使用

`istanbul cover test.js`