## Install mod_bt
```
su zotonic
cd ~/zotonic/user/modules/
git clone https://github.com/onnet/mod_bt.git
zotonic shell
> z:m().
> z_module_manager:activate(mod_bt, z:c(phiz)).
```
### Upload initial keys to Zotonic DB (could be also configured through Zotonic admin portal)

vi mod_bt_initial_keys.csv
```
mod_bt  bt_public_key 3rkgzgrs9tkgsg
mod_bt  bt_private_key  324ggsrsgdrgs42d9tkgsg
mod_bt  bt_merchant_id  sg4f4wc3t
mod_bt  bt_environment  Sandbox
```
zotonic=> \copy config (module,key,value) from '~/mod_bt_initial_keys.csv';

### Credit Cards for tests
https://developers.braintreepayments.com/guides/credit-cards/testing-go-live/python

### Braintree IDs and Keys
Menu: Account -> My User -> API Keys -> View Authorizations
