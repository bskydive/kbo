(function($){
    $(document).ready(function(){
        $('.save-nextchat-reset').click(function() {
            var check = confirm("You want to set it to default");
            if(check == true){
                $.ajax({
                    url : nextchat.url,
                    type: 'POST',
                    dataType : 'json',
                    data : {
                        'action' : 'nextchat_reset_setting_default',
                        'default-reset' : 'reset default'
                    }
                }).done(function($result) {
                    location.reload();
                });
            }
        });
    });
})(jQuery);