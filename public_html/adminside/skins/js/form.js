$(document).ready(function(){
    
    /* --- SEO --- */
    $(".seo").click(function(){
        $(".seo_block").css("display", "");
        return false;
    });
    
    $('.seo_block input[type="submit"]').click(function() {
        $(".seo_block").css("display", "none");
        return false;
    });
    /* --- END SEO --- */
    
    
    /* --- DELETE PIC --- */
    $('.del_pic').click(function(){
        var elem = $(this).parent('.foto_item').children('img');
        var pic = elem.attr('src');
        deleteImg(pic, elem);
        return false;
    });
    
    $('.del_pic_water').click(function(){
        var elem = $(this).parent('.foto_item').children('img');
        var pic = elem.attr('src');
        deleteImgWater(pic, elem);
        return false;
    });
    /* --- END DELETE PIC --- */
    
    
    /* --- META TAGS --- */
    $(".meta_link").click(function(){
        $(".meta_input").slideToggle();
        return false;
    });
    /* --- END META TAGS --- */
    
    
    /* --- LANG TABS --- */
    $('.admin_lang').click(function(){
        $('.t_lang').removeClass('t_lang');
        $(this).addClass('t_lang');
        $("table.add tbody").css('display', 'none');
        $("table.add tbody.lang_body").eq($(this).index()).css('display', '');
        return false;
    });
    /* --- END LANG TABS --- */
    
    
    /* --- SEARCH --- */
    $(".btn_search").click(function(){
        $(".search_arrea").slideToggle();
    });
    
    $(".select").click(function(){
        $(this).parent("section").find("ul").fadeIn();
    });
    
    $(".more_search").click(function(){
        $(".st_search").slideToggle();
        return false;
    });
    /* --- END SEARCH --- */
    
    
    /* --- DATEPICKER --- */
    $.datepicker.setDefaults($.extend($.datepicker.regional["ru"]));
    $(".datepicker").datepicker({"minDate": 0});
    $(".datepicker_nolimit").datepicker({"minDate": null});
    /* --- END DATEPICKER --- */
    
    
    /* --- SUBMIT FORM --- */
    $('.admin_save').click(function(){
        (checkRequired()) ? $('form').submit() : alert(NOT_ALL_FIELDS);
        return false;
    });
    
    function checkRequired(){
        var isEmpty = 0;
        $('.required_').each(function(){
            if($(this).val() == "") {
                var elem = $(this);
                isEmpty++;
                elem.css("border", "1px solid #FA1B36");
                setTimeout(function(){ elem.css("border", ""); }, 2000);
            }
        });
        if(isEmpty != 0) return false;
        else return true;
    }

    /* --- END SUBMIT FORM --- */
    
    
    /* --- PICTURE BOX --- */
    $(".upload_pic").click(function(){
        $("#picture_box").trigger("click");
        return false;
    });
    
    $("#picture_box").change(function (){
        var fileName = ($(this).val() == "") ? WORD_40 : $(this).val().split('\\').pop();
        $(".file_name").html(fileName);
    });
    /* --- END PICTURE BOX --- */

})