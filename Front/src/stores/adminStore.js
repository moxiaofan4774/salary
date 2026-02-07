import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import { useTabsStore } from '@/stores/tabsStore'

export const useAdminStore = defineStore('adminStore', () => {
    const adminData = ref({})
    const admin_access_token = ref('')
    const admin_refresh_token = ref('')

    const isAdminLogin = computed(() => {
        return admin_access_token.value !== ''
    })

    const isSuperAdmin = computed(() => {
        return adminData.value.is_superuser
    })


    const setAdminData = (data) => {
        adminData.value = data
    }


    const setAdminToken = (access_token, refresh_token) => {
        admin_access_token.value = access_token
        admin_refresh_token.value = refresh_token
        localStorage.setItem('admin_access_token', access_token)
        localStorage.setItem('admin_refresh_token', refresh_token)
    }

    const adminLogout = () => {
        const tabsStore = useTabsStore()
        adminData.value = {}
        admin_access_token.value = ''
        admin_refresh_token.value = ''
        localStorage.removeItem('admin_access_token')
        localStorage.removeItem('admin_refresh_token')
        tabsStore?.resetTabs()
      
    }

    return {
        adminData,
        admin_access_token,
        admin_refresh_token,
        isAdminLogin,
        isSuperAdmin,
        setAdminData,  
        setAdminToken,
        adminLogout
    }
  
}, {
    persist: {
        key: 'adminStore',
        storage: localStorage,
        paths: ['adminData', 'admin_access_token', 'admin_refresh_token']
    }

})
