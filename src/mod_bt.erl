-module(mod_bt).
-author("kirill.sysoev@gmail.com").

-mod_title("Kazoo BT").
-mod_description("Braintree addon module for mod_kazoo").
-mod_prio(415).

-export([observe_online_payment_systems/2
        ]).

-include_lib("zotonic_core/include/zotonic.hrl").

observe_online_payment_systems(_, Context) ->
    case modkazoo_auth:is_auth(Context) of
        'false' -> 'undefined';
        'true' -> <<"bt_widget_online_payment.tpl">>
    end.
