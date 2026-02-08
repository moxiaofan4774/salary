import adminHttp from '@/util/adminHttp'
import publicHttp from '@/util/publicHttp'

/**
 * 操作日志管理 API
 */
const operationLogApi = {
  /**
   * 获取操作日志列表（分页）
   * @param {Object} params - 查询参数
   * @param {string} params.operator_name - 操作人姓名（模糊搜索）
   * @param {string} params.action - 操作类型（CREATE/UPDATE/DELETE/RETRIEVE）
   * @param {string} params.resource_type - 资源类型
   * @param {string} params.start_date - 开始日期
   * @param {string} params.end_date - 结束日期
   * @param {number} params.page - 页码
   * @param {number} params.page_size - 每页数量
   * @returns {Promise}
   */
  getList: (params = {}) => {
    return publicHttp({
      url: '/user/operation-logs/',
      method: 'get',
      params: {
        ...params,
      },
    })
  },

  /**
   * 获取单个操作日志详情
   * @param {string} id - 日志ID
   * @returns {Promise}
   */
  getOne: (id) => {
    return publicHttp({
      url: `/user/operation-logs/${id}/`,
      method: 'get',
    })
  },
}

export default operationLogApi
