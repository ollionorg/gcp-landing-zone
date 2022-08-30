import encryptStorage from "./storage";

export default {
    methods: {
        setStorage(name, value) {
            encryptStorage.setItem(name, value)
        },
        getStorage(name) {
            return encryptStorage.getItem(name);
        },
        DeleteStorage() {
            encryptStorage.clear()
        },
        timeStamp() {
            const today = new Date();
            const date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
            const time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            const timestamp = date + ' ' + time;
            return timestamp;
        }
    }
}