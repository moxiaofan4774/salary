import adminHttp from '@/util/adminHttp'
import publicHttp from '@/util/publicHttp'

/**
 * 部门管理 API
 */
const departmentApi = {
  /**
   * 获取部门列表（分页）
   * @param {Object} params - 查询参数
   * @param {string} params.name - 部门名称（模糊搜索）
   * @param {boolean} params.is_active - 是否启用
   * @param {string} params.parent_id - 上级部门ID
   * @param {number} params.page - 页码
   * @param {number} params.page_size - 每页数量
   * @returns {Promise}
   */
  getList: (params = {}) => {
    return publicHttp({
      url: '/user/departments/',
      method: 'get',
      params: {
        ...params,
      },
    })
  },

  /**
   * 获取单个部门详情
   * @param {string} id - 部门ID
   * @returns {Promise}
   */
  getOne: (id) => {
    return publicHttp({
      url: `/user/departments/${id}/`,
      method: 'get',
    })
  },

  /**
   * 创建部门
   * @param {Object} data - 部门数据
   * @param {string} data.name - 部门名称（必填）
   * @param {string} data.parent - 上级部门ID（可选）
   * @param {number} data.order - 排序（可选，默认0）
   * @param {boolean} data.is_active - 是否启用（可选，默认true）
   * @param {string} data.description - 描述（可选）
   * @returns {Promise}
   */
  create: (data) => {
    return adminHttp({
      url: '/user/departments/',
      method: 'post',
      data,
    })
  },

  /**
   * 更新部门（完整更新）
   * @param {string} id - 部门ID
   * @param {Object} data - 部门数据
   * @returns {Promise}
   */
  update: (id, data) => {
    return adminHttp({
      url: `/user/departments/${id}/`,
      method: 'put',
      data,
    })
  },

  /**
   * 部分更新部门
   * @param {string} id - 部门ID
   * @param {Object} data - 部门数据（部分字段）
   * @returns {Promise}
   */
  patch: (id, data) => {
    return adminHttp({
      url: `/user/departments/${id}/`,
      method: 'patch',
      data,
    })
  },

  /**
   * 删除部门
   * @param {string} id - 部门ID
   * @returns {Promise}
   */
  delete: (id) => {
    return adminHttp({
      url: `/user/departments/${id}/`,
      method: 'delete',
    })
  },

  /**
   * 批量删除部门
   * @param {Array<string>} ids - 部门ID数组
   * @returns {Promise}
   */
  deleteChecked: (ids) => {
    return adminHttp({
      url: '/user/departments/deleteChecked/',
      method: 'post',
      data: { ids },
    })
  },

  /**
   * 切换部门启用状态
   * @param {string} id - 部门ID
   * @returns {Promise}
   */
  toggleActive: (id) => {
    return adminHttp({
      url: `/user/departments/${id}/toggle_active/`,
      method: 'post',
    })
  },

  /**
   * 获取部门树形结构
   * @param {Object} params - 查询参数
   * @param {boolean} params.only_active - 是否只获取启用的部门（可选，默认false）
   * @returns {Promise}
   */
  getTree: (params = {}) => {
    return adminHttp({
      url: '/user/departments/tree/',
      method: 'get',
      params,
    })
  },

  /**
   * 获取部门选项列表（用于下拉框）
   * @returns {Promise}
   */
  getOptions: () => {
    return publicHttp({
      url: '/user/departments/options/',
      method: 'get',
    })
  },

  /**
   * 获取指定部门的子部门列表
   * @param {string} id - 部门ID
   * @returns {Promise}
   */
  getChildren: (id) => {
    return publicHttp({
      url: `/user/departments/${id}/children/`,
      method: 'get',
    })
  },
}

export default departmentApi