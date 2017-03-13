<table class="table table-hover table-centered table-condensed">
  <thead>
    <tr style="height: 10px; color: white!important; background-color: white!important;"><td colspan="5"></td></tr>
    <tr>
      <th colspan="4">
        <span id="arrows_{{ #bt_transactions_list }}" style="cursor: pointer;">
          {% wire id="arrows_"++#bt_transactions_list type="click"
                  action={ toggle target="bt_transactions_list_opened" }
                  action={ toggle target=#mybttr }
                  action={ toggle target="arrow_right_"++#bt_transactions_list }
                  action={ toggle target="arrow_down_"++#bt_transactions_list }
          %}
          <i id="arrow_right_{{ #bt_transactions_list }}"
             style="padding-right: 0.5em;"
             class="fa fa-arrow-circle-right"></i>
          <i id="arrow_down_{{ #bt_transactions_list }}"
             style="padding-right: 0.5em; display: none;"
             class="fa fa-arrow-circle-down"></i>
        </span>
        <span style="color: FF9002;">
          {_ Braintree transactions list _}
          {% button class="btn btn-xs btn-onnet pull-right"
                    text=_"refresh list"
                    action={emit signal={update_braintree_transactions_list_tpl signal_filter=m.kazoo.signal_filter}}
          %}
        </span>
      </th>
    </tr>
    <tr id="{{ #mybttr }}"
        style="{% if not m.kazoo[{ui_element_opened element="bt_transactions_list_opened"}] %}display: none;{% endif %}">
      <th colspan="3"></th>
    </tr>
  </thead>
</table>
<span id="bt_transactions_list_opened"
      style="{% if not m.kazoo[{ui_element_opened element="bt_transactions_list_opened"}] %}display: none;{% endif %}">
  {% wire action={connect signal={update_braintree_transactions_list_tpl signal_filter=m.kazoo.signal_filter}
                          action={update target="braintree_transactions_list_tpl"
                                         template="_bt_transactions_list_lazy.tpl"}
                 }
  %}
  <span id="braintree_transactions_list_tpl">
    {% include "_bt_transactions_list_lazy.tpl" %}
  </span>
</span>
