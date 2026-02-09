# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

# 项目概述

**项目名称**：薪资查询系统（Salary Query System）

**架构**：前后端分离架构
- **后端**：Django REST Framework（位于 `RestFramework/` 目录）
- **前端**：Vue 3 + Vite（位于 `Front/` 目录）

**主要功能**：
- 员工薪资查询（前台用户）
- 薪资数据管理（后台管理员）
- 用户权限管理（角色、菜单权限）
- 部门与职称管理
- 新闻公告管理

---

# 技术栈

## 后端技术栈
- **框架**：Django 5.2.8 + Django REST Framework 3.16.1
- **数据库**：MySQL（mysqlclient 2.2.7）
- **认证**：JWT（djangorestframework-simplejwt 5.5.1）+ CAS 单点登录
- **跨域**：django-cors-headers 4.9.0
- **数据处理**：pandas 2.3.3, openpyxl 3.1.5, xlrd 2.0.2
- **服务器**：waitress 3.0.2（生产环境）
- **其他**：requests, beautifulsoup4, tencentcloud-sdk-python

## 前端技术栈
- **框架**：Vue 3.5.22 + Vue Router 4.6.3
- **构建工具**：Vite 7.1.11
- **UI 组件库**：
  - Element Plus 2.11.7（桌面端）
  - NutUI 4.3.14（移动端）
- **状态管理**：Pinia 3.0.4 + pinia-plugin-persistedstate 4.7.1
- **HTTP 请求**：Axios 1.13.2
- **图表**：ECharts 5.6.0
- **富文本编辑器**：WangEditor 5.1.23
- **其他**：jspdf 4.0.0, xlsx 0.18.5

---

# 开发命令

## 后端（Django）

### 环境准备
```bash
# 进入后端目录
cd RestFramework

# 激活虚拟环境（Windows）
.venv\Scripts\activate

# 激活虚拟环境（Linux/Mac）
source .venv/bin/activate

# 安装依赖
pip install -r requirements.txt
```

### 数据库操作
```bash
# 创建迁移文件
python manage.py makemigrations

# 执行迁移
python manage.py migrate

# 创建超级用户
python manage.py createsuperuser
```

### 运行服务
```bash
# 开发服务器（默认 8000 端口）
python manage.py runserver

# 指定 IP 和端口
python manage.py runserver 0.0.0.0:8080
```

### 其他常用命令
```bash
# 收集静态文件
python manage.py collectstatic

# 进入 Django Shell
python manage.py shell

# 查看所有可用命令
python manage.py --help
```

## 前端（Vue）

### 环境准备
```bash
# 进入前端目录
cd Front

# 安装依赖
npm install
```

### 开发与构建
```bash
# 开发模式运行（默认 http://127.0.0.1:8000）
npm run dev

# 构建生产版本
npm run build

# 构建测试版本
npm run build:test

# 构建生产版本（带类型检查）
npm run build:pro

# 预览生产构建
npm run preview

# 代码格式化
npm run format
```

---

# 项目架构

## 后端架构（Django REST Framework）

### 目录结构
```
RestFramework/
├── RestFramework/          # Django 项目配置
│   ├── settings.py        # 项目配置文件
│   ├── urls.py            # 主路由配置
│   └── wsgi.py            # WSGI 入口
├── apps/                  # 业务应用模块
│   ├── user/             # 用户管理模块
│   │   ├── models.py     # 用户、角色、员工档案、部门、职称模型
│   │   ├── views.py      # 视图函数
│   │   ├── serializers.py # 序列化器
│   │   ├── urls.py       # 路由配置
│   │   └── backends.py   # 自定义认证后端
│   ├── salary/           # 薪资管理模块
│   │   ├── models.py     # 应发工资、扣款、年月管理模型
│   │   ├── views.py
│   │   ├── serializers.py
│   │   └── urls.py
│   ├── menu/             # 菜单权限模块
│   │   ├── models.py     # 菜单、权限模型
│   │   ├── views.py
│   │   ├── serializers.py
│   │   └── urls.py
│   └── news/             # 新闻公告模块
│       ├── models.py     # 文章、分类、横幅模型
│       ├── views.py
│       ├── serializers.py
│       └── urls.py
├── media/                # 媒体文件上传目录
├── static/               # 静态文件目录
├── requirements.txt      # Python 依赖
└── manage.py            # Django 管理脚本
```

### 核心应用模块说明

#### 1. user 模块
- **UserInfo**：自定义用户模型（基于 AbstractBaseUser）
- **Role**：角色管理
- **EmployeeProfile**：员工档案（工号、身份证号、部门、职称等）
- **Department**：部门管理
- **TitleCategory**：职称分类
- **EmployeeTitleHistory**：员工职称历史记录
- **OperationLog**：操作日志（自动记录）

#### 2. salary 模块
- **SalaryYingFa**：应发工资数据
- **SalaryKouKuan**：扣款数据
- **YearAndMonth**：年月管理（控制薪资数据的可见性）

#### 3. menu 模块
- **Menu**：菜单管理（树形结构）
- **Permission**：权限管理
- 角色与菜单/权限的多对多关系

#### 4. news 模块
- **Article**：文章/公告
- **Category**：文章分类
- **CategoryGroup**：分类组
- **Banner**：横幅广告

### API 路由结构
所有 API 路由统一使用 `/api/` 前缀：
- `/api/user/` - 用户相关接口
- `/api/salary/` - 薪资相关接口
- `/api/menu/` - 菜单权限接口
- `/api/news/` - 新闻公告接口

---

# 关键技术点

## 后端关键技术

### 1. 数据库设计
- **主键**：所有模型使用 UUID 作为主键（`id = models.UUIDField(primary_key=True, default=uuid.uuid4)`）
- **软删除**：部分模型支持软删除（`is_deleted` 字段）
- **时间戳**：自动记录创建时间和更新时间

### 2. 用户认证
- **自定义用户模型**：`AUTH_USER_MODEL = 'user.UserInfo'`
- **多种登录方式**：
  - 工号（employeeId）登录
  - 身份证号（idCard）登录
  - 用户名（username）登录
- **认证后端**：`apps.user.backends.EmployeeIdBackend`
- **JWT Token**：
  - Access Token 有效期：24 小时
  - Refresh Token 有效期：30 天

### 3. CAS 单点登录
- 集成太原学院 CAS 认证服务器
- 配置在 `settings.py` 中的 `CAS_SERVER_URL`

### 4. 操作日志
- 自动记录用户操作（OperationLog 模型）
- 记录内容：操作用户、操作类型、操作对象、IP 地址、时间戳

### 5. 文件上传
- 媒体文件存储在 `media/` 目录
- 支持头像上传、文章图片上传等

## 前端关键技术

### 1. 路由结构
- **前台路由**：`/`（用户薪资查询界面）
  - `/` - 登录页
  - `/home` - 首页布局
  - `/salary-list` - 薪资列表
  - `/salary-details` - 薪资详情
  - `/salary-compare` - 薪资对比
  - `/salary-print` - 薪资打印
- **后台路由**：`/adminIndex`（管理员系统）
  - `/login` - 后台登录
  - `/adminHome` - 管理首页
  - 各模块管理页面

### 2. 状态管理（Pinia）
- **adminStore**：管理员状态（JWT Token、用户信息）
- **userStore**：前台用户状态
- **持久化**：使用 `pinia-plugin-persistedstate` 持久化到 localStorage

### 3. 路由守卫
- **双重认证守卫**：
  - `requiresAuth`：后台管理员权限（检查 `admin_access_token`）
  - `requiresFrontAuth`：前台用户权限（检查 `userStore.isUserLogin`）
- 未登录自动重定向到登录页

### 4. HTTP 请求
- 使用 Axios 封装 HTTP 请求
- 拦截器自动添加 JWT Token
- 统一错误处理

### 5. UI 组件
- **桌面端**：Element Plus（表格、表单、对话框等）
- **移动端**：NutUI（适配移动端薪资查询）
- 响应式设计，支持多端访问

---

# 数据库配置

## 开发环境
- **数据库类型**：MySQL
- **默认配置**：
  - Host: `localhost`
  - Port: `3306`
  - Database: `salary`
  - 配置文件：`RestFramework/RestFramework/settings.py`

## 生产环境
- 生产环境配置文件：`settings-server.py`（项目根目录）
- SQL 备份文件：`salary2026-*.sql`（项目根目录）

---

# 基础交互规则

1. 所有回答必须使用**中文**，技术术语需标注英文原词（如：函数（function）、装饰器（decorator）），确保准确且易懂；
2. 回复风格：简洁专业，避免冗余，优先给出可运行代码，再补充关键解释（新手友好，不跳过核心步骤）；
3. 沟通逻辑：先给出解决方案结论，再分步骤拆解，最后补充注意事项，符合程序员的思考习惯。

# Python代码规范要求

1. 代码严格遵循**PEP 8规范**（缩进4个空格、行长度≤88字符、命名规范：变量用snake_case，类用CamelCase，常量用UPPER_CASE）；
2. 代码兼容Python 3.8+版本（主流生产环境版本），避免使用仅3.10+的新特性，如需使用需明确标注；
3. 必须包含必要的注释：函数/类加文档字符串（docstring），复杂逻辑加行内注释，注释语言为中文；
4. 优先使用Python标准库，如需第三方库（如requests、pandas），需在代码开头标注安装命令（如：# 安装依赖：pip install requests）；
5. 代码需考虑健壮性：包含异常处理（try-except）、参数校验，避免空值、索引越界等常见错误。

# 输出格式要求

1. 代码块必须使用```python标识，独立成块，可直接复制运行；
2. 多文件代码需按「文件名 + 代码」的格式区分（如：# views.py\n```python\n代码内容```）；
3. 解释部分分点说明，重点内容用**粗体**标注，核心逻辑补充执行流程/原理；
4. 涉及功能实现时，必须附带「输入输出示例」（如适用），验证代码有效性。

# 功能偏好（Python开发专属）

1. 生成代码时，优先考虑可读性和可维护性，其次是性能；
2. 涉及数据处理（如pandas）、网络请求（如requests）、Web开发（如Flask/Django）时，给出行业通用最佳实践；
3. 如需调试/优化代码，先指出问题根源，再给出修改方案，最后说明优化前后的差异；
4. 避免"过度编码"：仅实现核心需求，不添加无关功能，减少Token消耗。

# 成本与Token控制

1. 输出代码时精简注释，仅保留关键逻辑注释，避免冗余说明；
2. 回答长度控制：单个问题的核心代码不超过50行，复杂需求拆分为多个代码块分步给出；
3. 仅在明确要求时，才提供完整项目结构，否则只给出核心文件/函数。

# 文件写入规则

**重要**：写入文件时请分块执行，单次不超过 300 行，不大于 12000 字。

# 不要有过多的总结和说明，任务执行完成后直接给出结果即可。
