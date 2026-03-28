# 鲁班-AI智能体

鲁班-AI智能体是一个面向个人与团队的多 Agent 数字员工系统，用来把不同职责的 AI 员工组织起来，完成开发、理财研究、任务拆解、日报汇总、飞书沟通、企业微信协作等工作。

这个仓库的核心思路是：

- 员工是角色容器
- SKILL 是能力单元
- 先定义职能模块，再把模块分派给员工
- 多员工任务通过拆解、分派、汇总、决策形成闭环

## 项目目标

本项目希望把 AI 从“单次问答工具”升级成“可协作的数字员工体系”。

适用方向包括：

- 代码开发与问题排查
- 投资研究与风险复核
- 日报、周报与进度提醒
- 飞书和企业微信协同沟通
- 后续扩展的运营类岗位

## 仓库结构

```text
鲁班-Ai智能体/
├─ README.md
├─ SKILL.md
├─ frontend/
│  ├─ README.md
│  └─ site/
│     ├─ index.html
│     ├─ about.html
│     ├─ agents.html
│     ├─ skills.html
│     ├─ deploy.html
│     ├─ project.html
│     ├─ styles.css
│     └─ assets/
│        ├─ avatars/
│        └─ logos/
├─ deploy/
│  └─ nginx/
│     └─ luban-ai-agent.conf
├─ scripts/
│  └─ deploy-frontend.sh
├─ skills/
│  ├─ control-decision/
│  ├─ task-decomposition/
│  ├─ task-dispatch/
│  ├─ development-implementation/
│  ├─ bug-triage/
│  ├─ environment-debugging/
│  ├─ technical-review/
│  ├─ investment-research/
│  ├─ risk-review/
│  ├─ daily-summary/
│  ├─ key-reminders/
│  ├─ feishu-communication/
│  ├─ wecom-communication/
│  └─ admin-followup/
└─ 技能与官网资源
```

官网前端现在统一放在 `frontend/site/` 下管理，部署时直接发布这个目录即可。

## 视觉资源

### Logo

![鲁班-AI智能体 Logo](./frontend/site/assets/logos/luban-ai-agent-logo.png)

### 员工头像

| 员工 | 头像 |
| --- | --- |
| 鲁班主控 | ![鲁班主控](./frontend/site/assets/avatars/luban-master.png) |
| 鲁班1号 | ![鲁班1号](./frontend/site/assets/avatars/luban-01.png) |
| 鲁班2号 | ![鲁班2号](./frontend/site/assets/avatars/luban-02.png) |
| 范蠡 | ![范蠡](./frontend/site/assets/avatars/fan-li.png) |
| 吕不韦 | ![吕不韦](./frontend/site/assets/avatars/lv-buwei.png) |
| 上官婉儿 | ![上官婉儿](./frontend/site/assets/avatars/shangguan-waner.png) |
| 诸葛亮 | ![诸葛亮](./frontend/site/assets/avatars/zhuge-liang.png) |
| 小昭 | ![小昭](./frontend/site/assets/avatars/xiao-zhao.png) |
| 阿朱 | ![阿朱](./frontend/site/assets/avatars/a-zhu.png) |

### 资源命名规则

- `frontend/site/assets/logos` 存放项目 Logo
- `frontend/site/assets/avatars` 存放员工头像
- 文件名统一使用英文小写加连字符
- 新增员工头像时，优先沿用同样的命名规则

## 官网部署

官网发布目录为 `frontend/site/`。

- 服务器部署可直接复用 `deploy/nginx/luban-ai-agent.conf`
- 同步脚本见 `scripts/deploy-frontend.sh`
- 若使用 GitHub Pages、Cloudflare Pages 等静态托管，只需要把发布根目录指向 `frontend/site`

## 核心设计

### 1. 员工层

员工层负责定义：

- 员工名称
- 身份定位
- 所属平台
- 固定挂载 SKILL
- 可临时挂载 SKILL
- 职责边界

当前员工包括：

- 鲁班主控
- 鲁班1号
- 鲁班2号
- 范蠡
- 吕不韦
- 上官婉儿
- 诸葛亮
- 小昭
- 阿朱

### 2. SKILL 层

SKILL 层负责定义可复用的职能能力。

当前已拆分的模块包括：

- 总控决策
- 任务拆解
- 任务分派
- 开发实现
- Bug 排查
- 环境调试
- 技术复核
- 投资研究
- 风险复核
- 日报汇总
- 重点提醒
- 飞书沟通
- 企业微信沟通
- 杂务跟进

### 3. 调度逻辑

默认执行流程如下：

1. 先识别任务类型
2. 匹配所需 SKILL 模块
3. 选择最适合的员工承接模块
4. 多员工任务优先由诸葛亮拆解
5. 汇总类任务交由上官婉儿整理
6. 最终决策交由鲁班主控确认

## 主要文件说明

### [SKILL.md](./SKILL.md)

仓库总技能说明文件，负责定义：

- 员工与职能 SKILL 的整体体系
- 模块库说明
- 员工挂载关系
- 分派规则
- 默认执行流程

### [skills](./skills)

独立职能模块目录。每个模块都是一个可单独维护的技能单元，包含：

- `SKILL.md`
- `agents/openai.yaml`

这样做的好处是后续新增员工时，不需要重写全部逻辑，只要复用或组合已有模块。

## 如何使用

### 方式一：按员工使用

如果你已经知道任务该交给谁，可以直接按员工身份执行。

例如：

- 把开发任务交给鲁班1号
- 把理财研究交给范蠡
- 把日报汇总交给上官婉儿

### 方式二：按 SKILL 使用

如果你更关注任务本身，可以先识别能力模块，再决定员工。

例如：

- 登录报错 -> Bug 排查 + 环境调试
- 项目启动 -> 任务拆解 + 任务分派 + 开发实现
- 今日汇总 -> 日报汇总 + 重点提醒

### 方式三：按协作流程使用

如果任务比较复杂，建议采用完整链路：

1. 诸葛亮拆解任务
2. 对应员工执行模块
3. 上官婉儿汇总进展
4. 鲁班主控做最终判断

## 适合继续扩展的方向

当前已经规划、后续可继续补充的岗位有：

- 亚马逊运营
- 顺风车运营
- 星链项目

建议扩展方式：

1. 先补职能 SKILL
2. 再定义新员工
3. 最后建立员工与 SKILL 的挂载关系

## 维护原则

- 文档统一使用 UTF-8 编码
- 中文直接书写，不使用乱码或转义内容
- 优先复用已有 SKILL 模块
- 尽量避免多个员工职责完全重叠
- 员工负责承载角色，SKILL 负责承载能力

## 项目愿景

鲁班-AI智能体不是单个 AI 助手，而是一套可以持续扩展的数字员工组织系统。

后续可以继续往这几个方向演进：

- 员工画像标准化
- 职能模块继续细分
- 自动化任务分派
- 多平台协同接入
- 运营岗位扩容

## 联系方式

官网：`www.lubanos.com`
