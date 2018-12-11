# hexo

## start 
```
npm install hexo-cli -g
hexo init blog
cd blog
npm install
hexo server
# Deploy after generation finishes
hexo generate -d  
# Watch file changes
hexo generate -w
# cleans the cache
hexo clean
hexo new [layout] <title>
categories:
- Sports
- Baseball
tags:
- Injury
- Fight
- Shocking
```

头像设置

sidebar-avatar: ./images/me.jpg

图片放到 blog/source/images/