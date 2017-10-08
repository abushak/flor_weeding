<label><?php echo WORD_343; ?>:</label>
<input type="text" name="username" id="user_name" class="required_" value="<?php echo $user['name']; ?>" />
<input type="hidden" name="user_id" id="user_id" value="<?php echo $user['user_id']; ?>" />
<div id="menu-container" style="position:absolute;"></div>

<script>
$(function(){
    $('#menu-container').css('width', $('#user_name').css('width'));
    $('#user_name').autocomplete({
        minLength: 2,
        appendTo: '#menu-container',
        delay: 0,
        source: function(request, response){
            $.ajax({
                url: ADM_SRV + 'bin/jquery.php?func=auto.user&name=' + $('#user_name').val(),
                dataType: 'json',
                success: function(json){
                    response($.map(json, function(item){
                        return{
                            value: item.name,
                            name: item.id,
                            email: item.email,
                            phone: item.phone,
                            city: item.city
                        }
                    }));
                }
            });
        },
        select: function(event, ui){
            $('#user_id').val(ui.item.name);
            $('#user_name').val(ui.item.value);
            $('#user_email').val(ui.item.email);
            $('#user_phone').val(ui.item.phone);
            $('#user_city').val(ui.item.city);
            return false;
        }
    });
})
</script>