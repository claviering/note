# animated.css动画库使用

## 添加时间控制
```
 animation-duration:3s; 持续时间
 animation-delay:2s;  延迟时间
```
添加 CDNJS

```
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">
```

在动画效果的元素上添加
```
<!-- animated是必须添加的；bounce是动画效果；infinite从语义来看也秒懂，无限循环，不添加infinite默认播放一次 -->
<div class="animated bounce infinite">动画</div>
```

jQuery控制动画，使用addClass 和 removeClass
```
$('.titleBox').hover(function() {
    $(this).addClass('shake')
    console.log('ss')
}, function() {
    $(this).removeClass('shake')
});
```

