# Frontend

官网前端统一放在 `frontend/site/` 下管理。

## 目录约定

- `frontend/site/`：实际部署目录，包含 HTML、CSS 和静态资源
- `frontend/site/assets/`：Logo、头像等静态素材

## 部署方式

- 静态托管平台：把发布目录指向 `frontend/site/`
- Nginx 服务器：参考 `../deploy/nginx/luban-ai-agent.conf`
- 手动同步：执行 `../scripts/deploy-frontend.sh`

## 维护原则

- 官网页面新增或修改，统一在 `frontend/site/` 内完成
- 不再把官网 HTML 散落在仓库根目录
- 面向线上访问的链接，优先使用站内页面或 GitHub 绝对链接
