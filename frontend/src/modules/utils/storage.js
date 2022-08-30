import { EncryptStorage } from 'encrypt-storage';
import reusableContent from './ReuseableContent'
let key = reusableContent.methods.getMetaValue('VUE_APP_SECRETKEY')
const encryptStorage = new EncryptStorage(key, {
    storageType: 'localStorage',
    encAlgorithm: 'AES'
});

export default encryptStorage