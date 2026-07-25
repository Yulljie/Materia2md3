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
- [ ] 同步并复用 MD3 SCSS Token 字典
- [ ] 重构 GTK4 `popover` / `popover.menu` 样式（28px 圆角与状态层）
- [ ] 适配 GTK4 `ListView` / `GridView` / `ColumnView` 选中行胶囊指示器
- [ ] 适配 GTK4 `windowcontrols` 标题栏按钮布局
- [ ] 适配 GTK4 `DropDown` 与 `SpinButton` 控件样式
> **检验方法**：运行 `GTK_THEME=Materia-md3 gtk4-widget-factory` 或 `gtk4-demo`，检查浮层菜单、列表与窗口控件。

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
