# Robot Framework 自动化测试框架

这是一个基于Robot Framework的自动化测试框架，支持API测试和Web UI测试。

## 项目结构

```
├── Resources/          # 存放关键字和页面对象
│   ├── api/           # API测试相关资源
│   └── web/           # Web测试相关资源
├── Tests/             # 测试用例目录
│   ├── api/          # API测试用例
│   └── web/          # Web测试用例
└── Results/          # 测试报告输出目录
```

## 环境准备

1. 创建虚拟环境
```bash
python -m venv venv
```

2. 激活虚拟环境

Windows:
```bash
venv\Scripts\activate
```

Linux/MacOS:
```bash
source venv/bin/activate
```

3. 安装依赖
```bash
pip install -r requirements.txt
```

## 运行测试

运行API测试：
```bash
robot -d Results Tests/api
```

运行Web测试：
```bash
robot -d Results Tests/web
```

运行所有测试：
```bash
robot -d Results Tests
```

## 测试报告

测试执行完成后，可以在Results目录下查看测试报告：
- report.html：详细的测试报告，包含测试用例执行结果和统计信息
- log.html：测试执行日志，记录了测试过程中的详细步骤和日志信息
- output.xml：测试结果原始数据，可用于生成自定义报告或与其他工具集成

## 注意事项

- 确保在运行测试前已激活虚拟环境
- 测试报告会自动保存在Results目录下，每次运行都会覆盖之前的报告
- 如需保留历史测试报告，建议在运行测试时指定不同的输出目录