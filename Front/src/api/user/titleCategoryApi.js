import adminHttp from '@/util/adminHttp'
import publicHttp from '@/util/publicHttp'

/**
 * 职称分类管理 API
 */
const titleCategoryApi = {
  /**
   * 获取职称分类列表（分页）
   * @param {Object} params - 查询参数
   * @param {string} params.name - 分类名称（模糊搜索）
   * @param {boolean} params.is_active - 是否启用
   * @param {string} params.parent_id - 上级分类ID
   * @param {number} params.page - 页码
   * @param {number} params.page_size - 每页数量
   * @returns {Promise}
   */
  getList: (params = {}) => {
    return publicHttp({
      url: '/user/title-categories/',
      method: 'get',
      params: {
        ...params,
      },
    })
  },

  /**
   * 获取单个职称分类详情
   * @param {string} id - 分类ID
   * @returns {Promise}
   */
  getOne: (id) => {
    return publicHttp({
      url: `/user/title-categories/${id}/`,
      method: 'get',
    })
  },

  /**
   * 创建职称分类
   * @param {Object} data - 分类数据
   * @param {string} data.name - 分类名称（必填）
   * @param {string} data.parent - 上级分类ID（可选）
   * @param {number} data.order - 排序（可选，默认0）
   * @param {boolean} data.is_active - 是否启用（可选，默认true）
   * @param {string} data.description - 描述（可选）
   * @returns {Promise}
   */
  create: (data) => {
    return adminHttp({
      url: '/user/title-categories/',
      method: 'post',
      data,
    })
  },

  /**
   * 更新职称分类（完整更新）
   * @param {string} id - 分类ID
   * @param {Object} data - 分类数据
   * @returns {Promise}
   */
  update: (id, data) => {
    return adminHttp({
      url: `/user/title-categories/${id}/`,
      method: 'put',
      data,
    })
  },

  /**
   * 部分更新职称分类
   * @param {string} id - 分类ID
   * @param {Object} data - 分类数据（部分字段）
   * @returns {Promise}
   */
  patch: (id, data) => {
    return adminHttp({
      url: `/user/title-categories/${id}/`,
      method: 'patch',
      data,
    })
  },

  /**
   * 删除职称分类
   * @param {string} id - 分类ID
   * @returns {Promise}
   */
  delete: (id) => {
    return adminHttp({
      url: `/user/title-categories/${id}/`,
      method: 'delete',
    })
  },

  /**
   * 批量删除职称分类
   * @param {Array<string>} ids - 分类ID数组
   * @returns {Promise}
   */
  deleteChecked: (ids) => {
    return adminHttp({
      url: '/user/title-categories/deleteChecked/',
      method: 'post',
      data: { ids },
    })
  },

  /**
   * 切换职称分类启用状态
   * @param {string} id - 分类ID
   * @returns {Promise}
   */
  toggleActive: (id) => {
    return adminHttp({
      url: `/user/title-categories/${id}/toggle_active/`,
      method: 'post',
    })
  },

  /**
   * 获取职称分类树形结构
   * @param {Object} params - 查询参数
   * @param {boolean} params.only_active - 是否只获取启用的分类（可选，默认false）
   * @returns {Promise}
   */
  getTree: (params = {}) => {
    return publicHttp({
      url: '/user/title-categories/tree/',
      method: 'get',
      params,
    })
  },

  /**
   * 获取职称分类选项列表（用于下拉框）
   * @returns {Promise}
   */
  getOptions: () => {
    return publicHttp({
      url: '/user/title-categories/options/',
      method: 'get',
    })
  },

  /**
   * 获取指定分类的子分类列表
   * @param {string} id - 分类ID
   * @returns {Promise}
   */
  getChildren: (id) => {
    return publicHttp({
      url: `/user/title-categories/${id}/children/`,
      method: 'get',
    })
  },
}

export default titleCategoryApi
