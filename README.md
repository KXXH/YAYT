# YAYT: Yet Another Yuebao Template For 318

一个使用typst编写的318月报模版

## 使用方法

## 安装

1. 安装typst
[官方CLI安装教程](https://github.com/typst/typst)

- MacOS
```bash
brew install typst
```

- Windows
```bash
winget install --id Typst.Typst
```

2. 下载本模版
```bash
git clone ...
```

## 使用
在模版目录下新建`main.typ`或其他命名的`.typ`文件。

### 模版参数
```typst
#show: project.with(
  title: "2023年11月工作汇报",  // 文档标题，用于元信息，无实际可见作用
  author:   // 作者信息，包括姓名、专业、研究方向和年级
    (name: "name", major: "电子信息", direction: "信息可视化与可视分析", grade: 2021),
  date: datetime.today(),  // 提交日期，显示于封面
  year: 2023, // 年份，显示于封面，默认为编译当年年份
  month: 12 // 月份，显示于封面，默认为编译当月月份
)
```

### 常见排版需求
### 标题
```typst
= 一级标题

== 二级标题

=== 三级标题

```

### 文本样式
```typst
*加粗*
_斜体_
`行内代码`
- 无序列表
+ 有序列表
$公式$
```
更多样式参考：[Typst文档](https://typst.app/docs/reference/syntax/)

#### 插图
```typst
#figure(
  image("figures/figure_name.png", width: 70%),
  caption: [
    Bulabulabula
  ]
)
```

#### 表格
```typst
#figure(
  caption: [
    三级目录进度情况
  ],
  kind: table
)[
  #tablex(
    // 列数
    columns: 2,
    inset: 5pt,  // 表格内边距
    // 表格对齐方式，垂直居中+水平居中
    // align: horizon+center,  
    // 表格对齐方式，垂直居中+水平靠左
    align: horizon,
    // 三线表
    auto-vlines: false,
    // 表头行数，如果不跨页则无明显作用
    header-rows: 1,
    // 每个单元格
    [*章节*], [*进度*],
    [第一章: 绪论], [
      - 完成研究现状框架
      - 完成可视化推荐算法研究现状
    ]
  )],
  ```

  #### 参考文献
  引入参考文献文件（bib文件）
  ```typst
#bibliography("reference.bib")
  ```

  引用参考文献
  ```typst
  @cite_key
  ```
  （使用`@`+`cite_key`的形式引用，`cite_key`为参考文献的标识符，可在bib文件中找到）

## 最佳实践
你可以使用[Typst Web App](https://typst.app)来编辑Typst文件（和Overleaf一样），也可以使用VS Code来编辑Typst文件。本模版已经包含Typst Web App所不具有的宋体字体，但使用本地编译能使用本地的中文字体，所以还是建议使用VS Code来编辑Typst文件。
### VS Code拓展
- [Typst LSP](https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp)
- [Typst Preview](https://marketplace.visualstudio.com/items?itemName=mgt19937.typst-preview)：支持实时预览构建效果，比Overleaf还要方便