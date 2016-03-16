<table id="bt_transactions_lists_table" class="table display table-striped table-condensed">
    <thead>
        <tr>
            <th class="td-center">{_ Date _}</th>
            <th class="td-center">{_ Sum _}</th>
            <th class="td-center">{_ Status _}</th>
            <th class="td-center">{_ Paid by _}</th>
        </tr>
    </thead>
    <tbody>
            {% for transaction in m.kazoo.kz_bt_transactions %}
                <tr id={{ transaction["id"] }} {% if transaction["subscription_id"] %}style="cursor: pointer;"{% endif %}>
                    <td class="td-center">{{ transaction["created_at"]|inno_iso_to_date|date:"Y-m-d H:i T":m.kazoo.get_user_timezone }}</td>
                    <td class="td-center">{% include "_currency_code_to_sign.tpl" code=transaction %}</td>
                    <td class="td-center">{{ transaction["status"] }}</td>
                    <td class="td-center">
                        {% include "_set_payment_system_sign.tpl" card_type=transaction["card"][1]["card_type"] %}
                        ***{{ transaction["card"][1]["last_four"] }}</td>
                </tr>
                {% if transaction["subscription_id"] %}
                  {% wire id=transaction["id"] action={ dialog_open title=_"Transaction details"
                                                                    template="_lazy_transaction_details.tpl"
                                                                    transaction=transaction }
                  %}
                {% endif %}
            {% endfor %}
    </tbody>
</table>

{% javascript %}
//var initSearchParam = $.getURLParam("filter");
var oTable = $('#bt_transactions_lists_table').dataTable({
"pagingType": "simple",
"bFilter" : true,
"aaSorting": [[ 0, "desc" ]],
"aLengthMenu" : [[5, 15, -1], [5, 15, "All"]],
"iDisplayLength" : 5,
"oLanguage" : {
        "sInfoThousands" : " ",
        "sLengthMenu" : "_MENU_ {_ lines per page _}",
        "sSearch" : "{_ Filter _}:",
        "sZeroRecords" : "{_ Nothing found, sorry _}",
        "sInfo" : "{_ Showing _} _START_ {_ to _} _END_ {_ of _} _TOTAL_ {_ entries _}",
        "sInfoEmpty" : "{_ Showing 0 entries _}",
        "sInfoFiltered" : "({_ Filtered from _} _MAX_ {_ entries _})",
        "oPaginate" : {
                "sPrevious" : "{_ Back _}",
                "sNext" : "{_ Forward _}"
        }
},

});

{% endjavascript %}
