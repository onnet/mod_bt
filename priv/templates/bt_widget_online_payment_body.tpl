<table class="table table-hover table-centered table-condensed">
  <thead>
    <tr style="height: 10px; color: white!important; background-color: white!important;"><td colspan="3"></td></tr>
    <tr style="background-color:#F8F8F8">
      <th>
        <a class="visible-lg zalarm" style="text-decoration: none; cursor: pointer;" 
          {% if (m.vars.mod_bt.bt_environment == "Sandbox") or (m.vars.mod_bt.bt_environment == "sandbox") %}
           href="https://developers.braintreepayments.com/guides/credit-cards/testing-go-live/python"
           target="_blank">{_ Braintree Sandbox _} <small>({_ click for cards numbers _})</small>
          {% else %}
           href="https://www.braintreepayments.com/about"
           target="_blank">{_ Braintree - Electronic Payment System _}
          {% endif %}
        </a>
        <span class="hidden-lg" style="color: #FF9002">{_ Braintree _}</span>
      </th>
      <th colspan="2">
        <span style="display: block; text-align: right;">
          <img src="/lib/paysysimg/Mastercard.png" height="18px" title="Mastercard" alt="Mastercard">
          <img src="/lib/paysysimg/Discover.png" height="18px" title="Discover" alt="Discover">
          <img src="/lib/paysysimg/Maestro.png" height="18px" title="Maestro" alt="Maestro">
          <img src="/lib/paysysimg/Visa.png" height="18px" title="Visa" alt="Visa">
          <img src="/lib/paysysimg/American-Express.png" height="18px" title="American Express" alt="American Express">
        </span>
      </th>
    </tr>
  </thead>
  <tbody>
    {% if m.kazoo.kz_bt_customer[1]["credit_cards"] %}
      <tr id="make_payment_line_id">
        <td width="50%">
          {_ Enter an amount to pay _}
          ({{ m.session.currency_sign }}10 - {{ m.session.currency_sign }}200)
        </td>
        <td>{{ m.session.currency_sign }}
            <input class="input input-small-onnet" type="text" id="kazoo_transaction" name="kazoo_transaction" value="" />
        </td>
        <td>
          {% button class="btn btn-xs btn-onnet pull-right" text=_"proceed" 
              action={confirm text=_"<br />Do you really want to proceed with payment?
                                     <br /><br />Your default card will be immediately charged!
                                     <br /><br /> Please refer to our <a href='https://onnet.info/termscons'>Terms & Conditions</a>
                                     regarding cancellation and refund policy.<br /><br />"
                              action={mask target="make_payment_line_id"}
                              action={postback postback="kazoo_transaction" delegate="mod_kazoo" qarg="kazoo_transaction"}
              }
           %}
        </td>
      </tr>
    {% endif %}
  </tbody>
</table>

<span id="make_payment_manage_cards_tpl">
    {% include "_make_payment_manage_cards.tpl" %}
</span>

<span id="make_payment_topup_settings_tpl">
{% include "_make_payment_topup_settings.tpl" %}
</span>

{% include "_braintree_transactions_list.tpl" %}

