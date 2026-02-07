import publicHttp from '@/util/publicHttp'
import adminHttp from '@/util/adminHttp'

// 菜单管理API
export default {
  // 获取所有菜单（后台管理）
  getList() {
    return publicHttp.get('/menu/menus/')
  },

 

  getOne(id) {
    return adminHttp.get(`/menu/menus/${id}/`)
  },


  // 创建菜单
  create(data) {
    return adminHttp.post('/menu/menus/', data)
  },

  // 更新菜单
  update(id, data) {
    return adminHttp.put(`/menu/menus/${id}/`, data)
  },

  // 删除菜单
  delete(id) {
    return adminHttp.delete(`/menu/menus/${id}/`)
  },

  //根据用户获取菜单
  getUserMenus(user_id) {
    const query = user_id ? `?user_id=${user_id}` : ''
    return adminHttp.get(`/menu/user-menus/${query}`)
  },

}
