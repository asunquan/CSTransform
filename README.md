# CSTransform
一个简单的字典转模型方法

```objective-c
+ (id)transformDictionary:(NSDictionary *)dictionary 
  			toModelClass:(Class)modelClass;
```

可以通过传入字典和模型类型得到一个该类型的对象.

现在只能转换简单的字典, 如果字典中含有其他字典可以继续转化, 如果字典中含有数组则只能数组原样赋值到对象中, 本来是打算根据数组泛型来转化数组中的内容, 但是由于没有发现获取泛型的方法, 所以暂时没有继续细分, 如果有哪位高人能指点一二还望发邮件告知我 [mailTo:asunquan@yeah.net](asunquan@yeah.net). 谢谢