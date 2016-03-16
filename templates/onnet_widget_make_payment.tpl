{% extends "onnet_widget_dashboard.tpl" %}

{% block widget_headline %}
    {{ headline }}
{% endblock %}

{% block widget_content %}
<span id="onnet_widget_make_payment_body_tpl">
    <div class="text-center p-3">
        {% ilazy class="fa fa-spinner fa-spin fa-3x" action={update target="onnet_widget_make_payment_body_tpl"
                                                                    template="onnet_widget_make_payment_body.tpl"
                                                            }
        %}
    </div>
</span>
{% endblock %}

