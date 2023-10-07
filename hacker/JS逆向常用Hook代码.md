# JS逆向常用Hook代码

作者：治廷君 https://www.bilibili.com/read/cv17708928?spm_id_from=333.999.0.0 出处：bilibili

## 

[油猴开发指南]实战Webpack劫持Vue实例

https://zhuanlan.zhihu.com/p/658486780

```js
function enableWebpackHook() {
    let originCall = Function.prototype.call
    Function.prototype.call = function (...args) {
        const result = originCall.apply(this, args)
        if (args[2]?.default?.version === '2.5.2') {
            args[2]?.default?.mixin({
                mounted: function () {
                    this.$el['__Ivue__'] = this
                }
            })
        }
        return result
    }
}
enableWebpackHook()
```

##  JSON HOOK

```js
(function () {
  var my_stringify = JSON.stringify;
  JSON.stringify = function (params) {
    console.log("HOOK stringify", params);
    debugger;
    return my_stringify(params);
  };

  var my_parse = JSON.parse;
  JSON.parse = function (params) {
    console.log("HOOK parse", params);
    debugger;
    return my_parse(params);
  };
})();
```

## COOKIE HOOK

```js
(function () {
  var cookie_cache = document.cookie;
  Object.defineProperty(document, "cookie", {
    get: function () {
      console.log("Get cookie");
      debugger;
      return cookie_cache;
    },
    set: function (val) {
      console.log("Set cookie", val);
      debugger;
      var cookie = val.split(";")[0];
      var ncookie = cookie.split("=");
      var flag = false;
      var cache = cookie_cache.split("; ");
      cache = cache.map(function (a) {
        if (a.split("=")[0] === ncookie[0]) {
          flag = true;
          return cookie;
        }
        return a;
      });
      cookie_cache = cache.join("; ");
      if (!flag) {
        cookie_cache += cookie + "; ";
      }
      this._value = val;
      return cookie_cache;
    },
  });
})();

(function () {
  "use strict";
  Object.defineProperty(document, "cookie", {
    get: function () {
      //debugger;
      return "";
    },
    set: function (value) {
      debugger;
      return value;
    },
  });
})();
```

## Search Decode Hook

```js
(function () {
  for (var p in window) {
    var s = p.toLowerCase();
    if (s.indexOf("encode") != -1 || s.indexOf("encry") != -1) {
      console.log("encode function.\n", window[p]);
      debugger;
    }
    if (s.indexOf("decode") != -1 || s.indexOf("decry") != -1) {
      console.log("decode function.\n", window[p]);
      debugger;
    }
  }
})();
```

## Debugger Hook

```js
(() => {
  Function.prototype.__constructor = Function.prototype.constructor;
  Function.prototype.constructor = function () {
    if (arguments && typeof arguments[0] === "string") {
      if ("debugger" === arguments[0]) {
        return;
      }
      return Function.prototype.__constructor.apply(this, arguments);
    }
  };
})();

Function.prototype.constructor_ = Function.prototype.constructor;
Function.prototype.constructor = function (a) {
  if (a == "debugger") {
    return function () {};
  }
  return Function.prototype.constructor_(a);
};

setInterval_new = setInterval;
setInterval = function (a, b) {
  if (a.indexOf("debugger") == -1) {
    return setInterval_new(a, b);
  }
};

Function.prototype.constructor = function(){}

eval_bc = eval;
eval = function (a) {
  if (a === "debugger;a=asdasdasdas") return eval_bc(a);
};

// Hook setTimeout
var setTimeout_ = setTimeout;
var setTimeout = function (func, time) {
  if (func == txsdefwsw) {
    return function () {};
  }
  return setTimeout_(func, time);
};
```

## eval Hook

```js
(function () {
  if (window.__cr_eval) return;
  window.__cr_eval = window.eval;
  var myeval = function (src) {
    console.log(
      "==== eval begin: length=" +
        src.length +
        ",caller=" +
        (myeval.caller && myeval.caller.name) +
        " ===="
    );
    console.log(src);
    console.log("==== eval end ====");
    return window.__cr_eval(src);
  };
  var _myeval = myeval.bind(null);
  _myeval.toString = window.__cr_eval.toString;
  Object.defineProperty(window, "eval", { value: _myeval });
  console.log(">>>> eval injected: " + document.location + " <<<<");
})();
```
