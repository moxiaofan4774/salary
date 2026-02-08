import adminHttp from '@/util/adminHttp'
import publicHttp from '@/util/publicHttp'

/**
 * 员工职称历史管理 API
 */
const employeeTitleHistoryApi = {
  /**
   * 获取员工职称历史列表（分页）
   * @param {Object} params - 查询参数
   * @param {string} params.employee_id - 员工ID
   * @param {string} params.employeeId - 工号（模糊搜索）
   * @param {string} params.realName - 姓名（模糊搜索）
   * @param {string} params.title_category_id - 职称分类ID
   * @param {boolean} params.is_current - 是否当前职称
   * @param {number} params.page - 页码
   * @param {number} params.page_size - 每页数量
   * @returns {Promise}
   */
  getList: (params = {}) => {
    return publicHttp({
      url: '/user/employee-title-history/',
      method: 'get',
      params: {
        ...params,
      },
    })
  },

  /**
   * 获取单个职称历史详情
   * @param {string} id - 职称历史ID
   * @returns {Promise}
   */
  getOne: (id) => {
    return publicHttp({
      url: `/user/employee-title-history/${id}/`,
      method: 'get',
    })
  },

  /**
   * 创建员工职称历史
   * @param {Object} data - 职称历史数据
   * @param {string} data.employee - 员工ID（必填）
   * @param {string} data.title_category - 职称分类ID（必填）
   * @param {string} data.start_date - 开始日期（必填）
   * @param {string} data.end_date - 结束日期
   * @param {boolean} data.is_current - 是否当前职称
   * @param {string} data.certificate_number - 证书编号
   * @param {string} data.remark - 备注
   * @returns {Promise}
   */
  create: (data) => {
    return adminHttp({
      url: '/user/employee-title-history/',
      method: 'post',
      data,
    })
  },

  /**
   * 更新员工职称历史（完整更新）
   * @param {string} id - 职称历史ID
   * @param {Object} data - 职称历史数据
   * @returns {Promise}
   */
  update: (id, data) => {
    return adminHttp({
      url: `/user/employee-title-history/${id}/`,
      method: 'put',
      data,
    })
  },

  /**
   * 部分更新员工职称历史
   * @param {string} id - 职称历史ID
   * @param {Object} data - 职称历史数据（部分字段）
   * @returns {Promise}
   */
  patch: (id, data) => {
    return adminHttp({
      url: `/user/employee-title-history/${id}/`,
      method: 'patch',
      data,
    })
  },

  /**
   * 删除员工职称历史
   * @param {string} id - 职称历史ID
   * @returns {Promise}
   */
  delete: (id) => {
    return adminHttp({
      url: `/user/employee-title-history/${id}/`,
      method: 'delete',
    })
  },

  /**
   * 批量删除员工职称历史
   * @param {Array<string>} ids - 职称历史ID数组
   * @returns {Promise}
   */
  deleteChecked: (ids) => {
    return adminHttp({
      url: '/user/employee-title-history/deleteChecked/',
      method: 'post',
      data: { ids },
    })
  },

  /**
   * 获取指定员工的职称历史
   * @param {string} employeeId - 员工ID
   * @returns {Promise}
   */
  getByEmployee: (employeeId) => {
    return publicHttp({
      url: `/user/employee-title-history/by_employee/${employeeId}/`,
      method: 'get',
    })
  },

  /**
   * 设置当前职称
   * @param {string} id - 职称历史ID
   * @returns {Promise}
   */
  setCurrent: (id) => {
    return adminHttp({
      url: '/user/employee-title-history/set_current/',
      method: 'post',
      data: { id },
    })
  },

  /**
   * 获取职称统计信息
   * @returns {Promise}
   */
  getStatistics: () => {
    return publicHttp({
      url: '/user/employee-title-history/statistics/',
      method: 'get',
    })
  },

  /**
   * 从Excel导入职称历史
   * @param {File} file - Excel文件
   * @returns {Promise}
   */
  importExcel: (file) => {
    const formData = new FormData()
    formData.append('file', file)
    return adminHttp({
      url: '/user/employee-title-history/import_excel/',
      method: 'post',
      data: formData,
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    })
  },

  /**
   * 导出Excel模板
   * @returns {Promise}
   */
  exportTemplate: () => {
    return adminHttp({
      url: '/user/employee-title-history/export_template/',
      method: 'get',
      responseType: 'blob',
    })
  },
}

export default employeeTitleHistoryApi
