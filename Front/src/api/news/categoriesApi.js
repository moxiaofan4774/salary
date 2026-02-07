import publicHttp from '@/util/publicHttp'
import adminHttp from '@/util/adminHttp'

const categoryApi = {
    getList: (params = {}) => {
        return publicHttp({
            url: '/news/categories/',
            method: 'get',
            params: {
                ...params,
            },
        })
    },
    create: (data) => {
        return adminHttp({
            url: '/news/categories/',
            method: 'post',
            data,
        })
    },
    update: (id, data) => {
        return adminHttp({
            url: `/news/categories/${id}/`,
            method: 'put',
            data,
        })
    },
    delete: (id) => {
        return adminHttp({
            url: `/news/categories/${id}/`,
            method: 'delete',
        })
    },  
    getOne: (id) => {
        return publicHttp({
            url: `/news/categories/${id}/`,
            method: 'get',
        })
    },
}

export default categoryApi