import adminHttp from '@/util/adminHttp'

// 角色管理API
export default {
  // 获取所有角色
  getList() {
    return adminHttp.get('/user/roles/')
  },

  // 获取单个角色详情
  getOne(id) {
    return adminHttp.get(`/user/roles/${id}/`)
  },

  // 创建角色
  create(data) {
    return adminHttp.post('/user/roles/', data)
  },

  // 更新角色
  update(id, data) {
    return adminHttp.put(`/user/roles/${id}/`, data)
  },

  // 删除角色
  delete(id) {
    return adminHttp.delete(`/user/roles/${id}/`)
  },

  // 获取角色已有菜单
  getRolePermissions(id) {
    return adminHttp.get(`/user/roles/${id}/permissions/`)
  },

  // 为角色分配菜单
  assignRolePermissions(id, data) {
    return adminHttp.post(`/user/roles/${id}/permissions/`, data)
  },

  // 获取角色已有用户
  getRoleUsers(id) {
    return adminHttp.get(`/user/roles/${id}/users/`)
  },

  // 为角色分配用户
  assignUsersToRole(id, data) {
    return adminHttp.post(`/user/roles/${id}/users/`, data)
  },
}
