# Materia2md3 开发与重构 TODO

## 1. 已完成 (Completed)
- [x] GTK3 控件圆角化 (GTK3 Widget Border Radius)

---

## 2. 移除不必要的主题 (Cleanup Legacy Sub-Themes)
- [x] 移除 `src/gtk-2.0` (GTK2)
- [x] 移除 `src/xfwm4` (Xfce 窗口管理器)
- [x] 移除 `src/cinnamon` (Cinnamon 桌面)
- [x] 移除 `src/metacity-1` (Metacity 窗口管理器)
- [x] 移除 `src/plank` (Plank Dock)
- [x] 移除 `src/unity` (Ubuntu Unity 桌面)
- [x] 移除 `src/chrome` (Chrome 主题)
- [x] 清理 `meson.build` 及脚本 (`change_color.sh` / `render-assets.sh`) 中对应的编译与产物逻辑
> **检验结果**：运行 `meson setup build && ninja -C build` 编译成功 (26/26 目标通过)，`build/src` 中仅包含 gtk-3.0、gtk-4.0 与 gnome-shell 产物。

---

## 3. GTK3 的 MD3 化 (GTK3 MD3 Transformation)
- [ ] **MD3 调色板与 Token 体系**
  - [ ] 构建 MD3 Color Roles (Primary, Surface, Surface Container, Outline, State Layers 等) 及其暗色模式映射
- [ ] **按钮与选择控件**
  - [ ] Filled / Tonal / Outlined / Text 四种 MD3 按钮样式
  - [ ] MD3 比例与动画效果的 Switch 开关
  - [ ] MD3 填色与图标样式的 Checkbox 和 Radio
- [ ] **输入框与容器**
  - [ ] Filled Entry (底部激活线) 与 Outlined Entry 样式
  - [ ] MD3 Top App Bar 风格 HeaderBar (移除沉重的深色顶栏与暗阴影)
  - [ ] Outlined & Filled Card 容器样式
- [ ] **菜单与对话框**
  - [ ] Menu、Popover 与 Dialog 采用 MD3 28px 大圆角与 Surface Container 渐变
  - [ ] Notebook / Tab 标签页胶囊状 (Pill-shaped) 激活指示器
> **检验方法**：运行 `GTK_THEME=Materia-md3 gtk3-widget-factory`，检查各 Page 按钮、输入框、Switch、对话框与 HeaderBar 的 MD3 视觉表现。

---

## 4. GTK4 的 MD3 化 (GTK4 MD3 Transformation)
- [x] **MD3 Token 字典架构集中化**
  - [x] 新增集中定义文件 `src/_md3-tokens.scss`，统一定义 Primary, Surface Container (Lowest/Low/Normal/High/Highest), Outline 与 State Layers
  - [x] 更新 `src/_theme-color.scss` 及 `src/_theme-color.template.scss` 映射字典
- [x] **基础按钮与选择控件 (`button`, `switch`, `check`, `radio`)**
  - [x] GTK4 Filled / Tonal / Outlined / Text (Flat) 按钮重构（`9999px` 胶囊圆角与 8% State Layer）
  - [x] GTK4 Switch 开关（MD3 比例滑块与轨道、开/关态分色）
  - [x] GTK4 Checkbox 与 Radio（圆角矩形/圆形与水波动画）
- [x] **输入框与容器 (`entry`, `search-entry`, `.card`, `frame`)**
  - [x] GTK4 Filled Entry (底部线条) 与 Outlined Entry (1px 描边/高亮) 样式
  - [x] GTK4 Search Entry (9999px 全圆角胶囊搜索框)
  - [x] GTK4 Outlined Card (12px/16px 圆角与 `$outline-variant` 边框) 及 Elevated Card
- [x] **顶栏与窗口控制 (`headerbar`, `windowcontrols`, `actionbar`)**
  - [x] GTK4 HeaderBar 扁平 Surface 背景与 MD3 Top App Bar 视觉
  - [x] GTK4 `windowcontrols` 标题栏按钮（`30px` 圆形 Pill 按钮与 hover 交互）
- [x] **浮层、菜单与对话框 (`popover`, `popover.menu`, `dialog`)**
  - [x] GTK4 `popover` 28px 大圆角（MD3 Extra Large）与 Level 3 浮层阴影
  - [x] GTK4 `popover.menu` 菜单项 `modelbutton` 胶囊状 hover/active 悬浮高亮
- [x] **列表、微调框与下拉框 (`listview`, `gridview`, `columnview`, `dropdown`, `spinbutton`)**
  - [x] GTK4 `ListView` / `GridView` / `ColumnView` 选中行胶囊悬浮指示器 (`margin: 2px 6px`, `9999px` 圆角)
  - [x] GTK4 `DropDown` 卡片按钮与 28px 大圆角浮层
  - [x] GTK4 `SpinButton` 横向/纵向连体与分体胶囊微调框
> **检验结果**：重新编译并安装至 `~/.local/share/themes/` 与 `~/.themes/` 成功。运行 `GTK_DATA_PREFIX=/home/ray/.local GTK_THEME=Materia-dark gtk4-widget-factory` 或 `nwg-look` 验证通过。

---

## 5. 添加对 GTK4 + Libadwaita 的支持 (Libadwaita Support)
- [ ] **Libadwaita 颜色变量覆盖**
  - [ ] 建立 CSS 变量映射文件，覆盖 `@accent_color`, `@window_bg_color`, `@headerbar_bg_color`, `@card_bg_color` 等核心变量
- [ ] **Libadwaita 特有控件样式适配**
  - [ ] 适配 `AdwActionRow` / `AdwPreferencesGroup` 卡片样式
  - [ ] 适配 `AdwHeaderBar` / `AdwViewSwitcher` 胶囊分栏
  - [ ] 适配 `AdwToast` 与 `AdwStatusPage`
- [ ] **部署与集成**
  - [ ] 提供注入至 `~/.config/gtk-4.0/gtk.css` 或 Flatpak 环境的部署脚本与说明
> **检验方法**：运行 Libadwaita 应用（如 `adw-1-demo` 或 `gnome-text-editor`），验证主题配色与 ActionRow 控件风格。
