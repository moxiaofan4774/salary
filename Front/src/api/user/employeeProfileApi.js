import adminHttp from '@/util/adminHttp'
import publicHttp from '@/util/publicHttp'

/**
 * 员工档案管理 API
 */
const employeeProfileApi = {
  /**
   * 获取员工档案列表（分页）
   * @param {Object} params - 查询参数
   * @param {string} params.employeeId - 工号（模糊搜索）
   * @param {string} params.realName - 姓名（模糊搜索）
   * @param {string} params.department_id - 部门ID
   * @param {string} params.status - 员工状态（active/leave/retire）
   * @param {number} params.page - 页码
   * @param {number} params.page_size - 每页数量
   * @returns {Promise}
   */
  getList: (params = {}) => {
    return publicHttp({
      url: '/user/employee-profiles/',
      method: 'get',
      params: {
        ...params,
      },
    })
  },

  /**
   * 获取单个员工档案详情
   * @param {string} id - 档案ID
   * @returns {Promise}
   */
  getOne: (id) => {
    return publicHttp({
      url: `/user/employee-profiles/${id}/`,
      method: 'get',
    })
  },

  /**
   * 创建员工档案
   * @param {Object} data - 档案数据
   * @param {string} data.user - 关联用户ID（必填）
   * @param {string} data.employeeId - 工号（必填）
   * @param {string} data.realName - 真实姓名（必填）
   * @param {string} data.idCard - 身份证号（必填）
   * @param {string} data.gender - 性别（male/female）
   * @param {string} data.birth_date - 出生日期
   * @param {string} data.department - 部门ID
   * @param {string} data.telephone - 联系电话
   * @param {string} data.email - 邮箱
   * @param {string} data.address - 家庭住址
   * @param {string} data.entry_date - 入职日期
   * @param {string} data.status - 员工状态（active/leave/retire）
   * @param {string} data.remark - 备注
   * @returns {Promise}
   */
  create: (data) => {
    return adminHttp({
      url: '/user/employee-profiles/',
      method: 'post',
      data,
    })
  },

  /**
   * 更新员工档案（完整更新）
   * @param {string} id - 档案ID
   * @param {Object} data - 档案数据
   * @returns {Promise}
   */
  update: (id, data) => {
    return adminHttp({
      url: `/user/employee-profiles/${id}/`,
      method: 'put',
      data,
    })
  },

  /**
   * 部分更新员工档案
   * @param {string} id - 档案ID
   * @param {Object} data - 档案数据（部分字段）
   * @returns {Promise}
   */
  patch: (id, data) => {
    return adminHttp({
      url: `/user/employee-profiles/${id}/`,
      method: 'patch',
      data,
    })
  },

  /**
   * 删除员工档案
   * @param {string} id - 档案ID
   * @returns {Promise}
   */
  delete: (id) => {
    return adminHttp({
      url: `/user/employee-profiles/${id}/`,
      method: 'delete',
    })
  },

  /**
   * 批量删除员工档案
   * @param {Array<string>} ids - 档案ID数组
   * @returns {Promise}
   */
  deleteChecked: (ids) => {
    return adminHttp({
      url: '/user/employee-profiles/deleteChecked/',
      method: 'post',
      data: { ids },
    })
  },

  /**
   * 从Excel导入员工档案
   * @param {File} file - Excel文件
   * @returns {Promise}
   */
  importExcel: (file) => {
    const formData = new FormData()
    formData.append('file', file)
    return adminHttp({
      url: '/user/employee-profiles/import_excel/',
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
      url: '/user/employee-profiles/export_template/',
      method: 'get',
      responseType: 'blob',
    })
  },
}

export default employeeProfileApi
