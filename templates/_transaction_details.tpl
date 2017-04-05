{% with m.kazoo[{kz_get_subscription subscription_id=transaction["subscription_id"]}] as subscription %}
<div class="">
  <table class="table table-hover table-centered">
   <body>
    <tr class="trans-list">
      <td class="trans-h">First Bill Date</td>
      <td class="trans-t">
        {{ subscription[1]["billing_first_date"]|gregsec_to_date|date:"Y-m-d":m.kazoo.get_user_timezone }}
      </td>
    </tr>
    <tr class="trans-list">
      <td class="trans-h">Current Billing Period</td>
      <td class="trans-t">
         {{ subscription[1]["billing_start_date"]|gregsec_to_date|date:"Y-m-d":m.kazoo.get_user_timezone }}
         – 
         {{ subscription[1]["billing_end_date"]|gregsec_to_date|date:"Y-m-d":m.kazoo.get_user_timezone }}
      </td>
    </tr>
    <tr class="trans-list">
      <td class="trans-h">Next Bill Date</td>
      <td class="trans-t">
        {{ subscription[1]["next_bill_date"]|gregsec_to_date|date:"Y-m-d":m.kazoo.get_user_timezone }}
      </td>
    </tr>
    <tr class="trans-list">
      <td class="trans-h">Next Billing Period Amount</td>
      <td class="trans-t">
        {{ m.config.mod_kazoo.local_currency_sign.value }}{{ subscription[1]["next_bill_amount"] }}
      </td>
    </tr>
   </body>
  </table>
</div>
{% endwith %}
