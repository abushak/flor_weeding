$(document).ready(function(){
    /* --- CHECK ALL --- */
    $("#t_check_all").click(function(){
        $('.checkbox_list input:checkbox').not(this).prop('checked', this.checked);
    });
	/* --- END CHECK ALL --- */
    
    $('.sklad').click(function(){
        return false;
    });
    $('.sklad').hover(function(){
        $(this).next('.quest_text').css('display', 'block');
    }, function(){
        $(this).next('.quest_text').css('display', 'none');
    })
    
    /* --- DELETE ITEM --- */
    //$(".admin_table").on("click", ".admin_order_delete", function() {
    //    if(confirm(WORD_18)){ } else return false;
    //});
    
    $("body").on("click", ".delete-callback, .delete-slide, .delete-review, .delete-news, .delete-cs, .delete-partners, .delete-discount, .delete-user, .delete-catalog", function() {
        if(!confirm(WORD_18)) return false;
    });
    
    $(".values").on("click", ".del_prop", function() {
        if(confirm(WORD_18)){
            if($(this).parent('td').parent('tr').index() > 0) $(this).parent('td').parent('tr').remove();
        }
        return false;
    });
    
    $(".pictures_form").on("click", ".del_slide", function(){
        if(confirm(WORD_18)){
            var id = $(this).attr("data-id");
            $.post(ADM_SRV + 'bin/jquery.php', {
                func: 'del_slide',
                id: id
            }).done(function(data){
                $("#id_" + id).remove();
            });
            return false;
        } else return false;
    });
    
    $(".pictures_form").on("click", ".del_banner", function(){
        if(confirm(WORD_18)){
            var id = $(this).attr("data-id");
            $.post(ADM_SRV + 'bin/jquery.php', {
                func: 'del_banner',
                id: id
            }).done(function(data){
                $("#id_" + id).remove();
            });
            return false;
        } else return false;
    });
	/* --- END DELETE ITEM --- */
    
    
    /* --- DELETE CHECKED --- */
    $('.del_all').click(function(){
        if(confirm(WORD_18)){
            var ids = new Array();
            $('.checkbox_list input:checkbox:checked').each(function() {
                var id = $(this).attr("data-id");
                ids.push(id);
            });
            deleteChecked(ids, route_3);
            return false;
        } else return false;
    });
    /* --- END DELETE CHECKED --- */
    
    
    /* --- ITEM STATUS --- */
    $(".order_status, .admin_btn_list").click(function(){
        $(this).next(".wrap_action_list").find("ul").fadeIn();
        return false;
    });
    
    $(".action_list .close").click(function(){
        $(".action_list").fadeOut();
        return false;
    });
    
    $(".visible_all").click(function(){
        $('.checkbox_list input:checkbox:checked').each(function() {
            var id = $(this).attr("data-id");
            var elem = $('#status_' + id);
            if(id != null) setStatus(id, "1", route_3, elem, setActive);
        });
        return false;
    });
    
    $(".disable_all").click(function(){
        $('.checkbox_list input:checkbox:checked').each(function() {
            var id = $(this).attr("data-id");
            var elem = $('#status_' + id);
            if(id != null) setStatus(id, "0", route_3, elem, setDisable);
        });
        return false;
    });
    
    $(".status_items_list li a").on("click", function(){
        var id = $(this).attr('data-id');
        var status_selected = $(".order_status_" + id);
        var new_status_id = $(this).attr('data-status-id');
        var new_status_name = $(this).html();
        var new_status_class = (new_status_id == 1) ? "new" : "ok";
        $(this).attr('data-status-id', status_selected.attr('data-id'));
        $(this).html(status_selected.children('.status_name').html());
        status_selected.attr('data-id', new_status_id);
        status_selected.children('.status_name').html(new_status_name);
        rCIE(status_selected, 'new');
        rCIE(status_selected, 'ok');
        status_selected.addClass(new_status_class);
        
        setStatusSelect(id, new_status_id, "callback");
        
        return false;
    });
    
    function rCIE(elem, class_name){
        if(elem.hasClass(class_name)) elem.removeClass(class_name);
    }
    /*
    $(".center_text.span2").on("click", ".table_link.active", function(){
        var elem = $(this);
        var id = elem.attr('data-id');
        setStatus(id, "0", route_3, elem, setDisable);
        return false;
    });
    
    $(".center_text.span2").on("click", ".table_link.disable", function(){
        var elem = $(this);
        var id = elem.attr('data-id');
        setStatus(id, "1", route_3, elem, setActive);
        return false;
    });
    
    
    $(".action_list").on("click", ".visible_all", function(){
        $('.checkbox_list input:checkbox:checked').each(function() {
            var elem = $(this).parent('.checkbox_list').parent('.span7').parent('.row').children('.center_text').children('.table_link');
            var id = elem.attr('data-id');
            setStatus(id, "1", route_3, elem, setActive);
        });
        return false;
    });
    
    $(".action_list").on("click", ".disable_all", function(){
        $('.checkbox_list input:checkbox:checked').each(function() {
            var elem = $(this).parent('.checkbox_list').parent('.span7').parent('.row').children('.center_text').children('.table_link');
            var id = elem.attr('data-id');
            setStatus(id, "0", route_3, elem, setDisable);
        });
        return false;
    }); */
    /* --- END ITEM STATUS --- */
    
    
    /* --- SORTABLE --- */
    $('.admin_table').sortable({
        items: ".main_row",
        update: function(){
            $.post(ADM_SRV + 'bin/jquery.php', {
                func: 'sort',
                table: route_3,
                ids: $(this).sortable('serialize')
            });
        }
    }).disableSelection();
    
    $('.sub_rows_container').sortable({
        update: function(){
            $.post(ADM_SRV + 'bin/jquery.php', {
                func: 'sort',
                table: route_3,
                ids: $(this).sortable('serialize')
            });
        }
    }).disableSelection();
    
    $('.sub_sub_rows_container').sortable({
        update: function(){
            $.post(ADM_SRV + 'bin/jquery.php', {
                func: 'sort',
                table: route_3,
                ids: $(this).sortable('serialize')
            });
        }
    }).disableSelection();
    
    $('.pictures_form').sortable({
        update: function(){
            $.post(ADM_SRV + 'bin/jquery.php', {
                func: 'sort',
                table: route_3,
                ids: $(this).sortable('serialize')
            });
        }
    });
    /* --- END SORTABLE --- */
    
    
    /* --- CURRENCY --- */
    $(".currency_add").on("click", function(){
        var currency_id = $(".currency_item").last().attr('data-id');
        currency_id++;
        $.post(ADM_SRV + 'bin/jquery.php', {
            func: 'get_currency_row',
            id: currency_id
        }).success(function(data){
            $(".currency_list").append(data);
        });
        return false;
    });
    /* --- END CURRENCY --- */
    
    /* --- RATING --- */
    $('.unselectable').click(function(){
        return false;
    });
    /* --- END RATING --- */
    
    /* --- EDIT COMMENT --- */
    $('.edit_live').on('click', function(){
        var id = $(this).attr('data-id');
        var elem = $('#textarea_convert_' + id);
        var text = elem.html();
        elem.replaceWith("<textarea style='width:98%;height:70px;' id='save_edited_" + id + "'>" + text + "</textarea>");
        var elem_2 = $('#input_convert_' + id);
        var text_2 = elem_2.html();
        elem_2.replaceWith("<input type='text' style='margin-right:10px;' value='" + text_2 + "' id='save_input_" + id + "' />");
        var elem_3 = $('#date_convert_' + id);
        var text_3 = elem_3.html();
        elem_3.replaceWith("<input type='text' class='datepicker' value='" + text_3 + "' id='save_date_" + id + "' />");
        $('.datepicker').datepicker();
        $('.form_com_' + id).append("<input type='button' data-id='" + id + "' class='save_comment' value='" + WORD_28 + "' />");
        return false;
    });
    
    $('.comment_form').on('click', '.save_comment', function(){
        var id = $(this).attr('data-id');
        var name = $('#save_input_' + id).val();
        var date = $('#save_date_' + id).val();
        var text = $('#save_edited_' + id).val();
        $.post(ADM_SRV + 'bin/jquery.php', {
            func: 'update_comment',
            id: id,
            name: name,
            date: date,
            text: text
        }).success(function(data){
            $('#save_input_' + id).replaceWith("<span id='input_convert_" + id + "'>" + name + "</span>");
            $('#save_date_' + id).replaceWith("<span id='date_convert_" + id + "'>" + date + "</span>");
            $('#save_edited_' + id).replaceWith("<span id='textarea_convert_" + id + "'>" + escapeHtml(text) + "</span>");
            $('.save_comment').remove();
        });
        //return false;
    });
    /* --- END EDIT COMMENT --- */
    
    /* --- DRAG & DROP --- */
    $('#slide_upload').on('dragover', function(e) {
        e.preventDefault();
        e.stopPropagation();
    });
    
    $('#slide_upload').on('dragenter', function(e) {
        e.preventDefault();
        e.stopPropagation();
    });
    
    $('#slide_upload').on('drop', function(e){
        if(e.originalEvent.dataTransfer){
            if(e.originalEvent.dataTransfer.files.length) {
                e.preventDefault();
                e.stopPropagation();
                upload(e.originalEvent.dataTransfer.files);
            }
        }
    });
    
    function upload(files){
        $('.uploader_progress').css('display','');
        var formData = new FormData();
        for (var i = 0; i < files.length; i++) {
            formData.append('picture[]', files[i]);
        }
        
        $.ajax({
            url: ADM_SRV + 'bin/jquery.php?func=upload_slider',
            data: formData,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){
                $('.pictures_form').prepend(data);
                $('.uploader_progress').css('display','none');
            }
        });
    }
    
    $('.slider_selector').on('change', function(){
        upload($(this)[0].files);
    });
    
    $('#banner_upload').on('dragover', function(e) {
        e.preventDefault();
        e.stopPropagation();
    });
    
    $('#banner_upload').on('dragenter', function(e) {
        e.preventDefault();
        e.stopPropagation();
    });
    
    $('#banner_upload').on('drop', function(e){
        if(e.originalEvent.dataTransfer){
            if(e.originalEvent.dataTransfer.files.length) {
                e.preventDefault();
                e.stopPropagation();
                upload_banner(e.originalEvent.dataTransfer.files);
            }
        }
    });
    
    function upload_banner(files){
        $('.uploader_progress').css('display','');
        var formData = new FormData();
        for (var i = 0; i < files.length; i++) {
            formData.append('picture[]', files[i]);
        }
        
        $.ajax({
            url: ADM_SRV + 'bin/jquery.php?func=upload_banner',
            data: formData,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){
                $('.pictures_form').prepend(data);
                $('.uploader_progress').css('display','none');
            }
        });
    }
    
    $('.banner_selector').on('change', function(){
        upload_banner($(this)[0].files);
    });
    /* --- END DRAG & DROP --- */
    
    $('.prop_type').on('change', function(){
        var x = $(this).val();
        var y = $('.values').attr('data-id');
        $.post(ADM_SRV + 'bin/jquery.php', {
            func: 'get_row_values',
            type: x
        }).success(function(data){
            $('.values').html('');
            $(".values").append(data);
            $(".values").attr('data-id', x);
            colorpick();
        });
        return false;
    });
    
    colorpick();
    function colorpick(){
        $('.picker').colpick({
            layout: 'hex',
            submit: 0,
            colorScheme: 'dark',
            onChange: function(hsb, hex, rgb, el, bySetColor) {
                $(el).prev().css('background-color','#' + hex);
                if(!bySetColor) $(el).val(hex);
            }
        }).keyup(function(){
            $(this).colpickSetColor(this.value);
        });
    }
    
    $('.add_prop_value').on('click', function(){
        var x = $('.prop_type').val();
        $.post(ADM_SRV + 'bin/jquery.php', {
            func: 'get_row_values',
            type: x
        }).success(function(data){
            $(".values").append(data);
            colorpick();
        });
        return false;
    });
    
    /* 12.03.2015 */
    $('body').on('click', '.table_link.status_link', function () {
        var elem = $(this),
            id = $(this).attr('data-id'),
            status = 0,
            callBack = setDisable;
            
        if (elem.hasClass('active')) {
            status = 0;
            callBack = setDisable;
        } else if (elem.hasClass('disable')) {
            status = 1;
            callBack = setActive;
        }
        setStatus(id, status, route_3, elem, callBack);
        return false;
    });

})