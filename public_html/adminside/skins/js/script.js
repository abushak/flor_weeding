jQuery(function($) {
    /** Видалення замовлення **/
    $("body").on("click", ".delete-order", function() {
        if (!confirm(WORD_18)) return false;
    });
    
    /** Друк замовлення**/
    $("body").on("click", ".print-order", function() {
        var _id = $(this).attr("data-order-id"),
            _type = $(this).attr("data-type"),
            _url = SRV + "print.php?type=" + _type + "&order=" + _id;
        
        var w = window.open(_url, "_blank");
        w.print();
        return false;
    });
    
    /** Зміна статусу оплати **/
    $("body").on("change", "#payment_status_select", function() {
        var order_id = $(this).attr("data-order-id"),
            status = $("option:selected", this).val();
        $.ajax({
            url: ADM_SRV + "bin/ajax.php",
            type: "POST",
            data: {
                "function": "order.payment.status",
                "order_id": order_id,
                "status": status
            }
        });
    });
    
    
    
    
    /** ORDER POPUP BOX **/
    $('.show-order-box').click(function(){
        var _order = $(this).parents('tr').attr('data-id'),
            _Data = new FormData();
        
        _Data.append('function', 'get.order.info.box');
        _Data.append('order_id', _order);
        
        ajaxSendPostAsync(_Data, ShowOrderCallback);
        return false;
    });
    
    $('body').on('click', '.close-order-popup', function(){
        $('#admin_order_box').fadeOut('normal', function(){
            $('body').css('overflow', 'auto');
        });
        return false;
    });
    
    function ShowOrderCallback(_Result){
        $('#order-box-content').html(_Result);
        $('#admin_order_box').fadeIn();
        $('body').css('overflow', 'hidden');
    }
    /** ORDER POPUP BOX END **/
    
    /** ORDER COMMENT **/
    $("body").on("click", ".admin_order_comment", function() {
        $("#admin_comment").slideToggle();
        return false;
    });
    
    $("body").on("click", "#order-comment-submit", function() {
        var _textarea = $("#order-comment-text"),
            _order = $("#order-id").val(),
            _text = _textarea.val();
        if (_text == "") {
            _textarea.css("border", "1px solid #FA1B36");
            setTimeout(function() { _textarea.css("border", ""); }, 2000);
        } else {
            var _Data = new FormData();
            
            _Data.append("function", "order.comment");
            _Data.append("order_id", _order);
            _Data.append("text", _text);
            
            _textarea.val("");
            ajaxSendPostAsync(_Data, AddOrderComment);
        }
        return false;
    });
    
    function AddOrderComment(_Result){
        $("#order-comment-box").prepend(_Result);
    }
    /** ORDER COMMENT END **/
    
    
    
    
    
	// Nav
	
	$(".drop_nav").mouseover(function(){
		$(this).parent("li").find(".has_drop").addClass("has_drop_active");
	});
	$(".drop_nav").mouseout(function(){
		$(".has_drop").removeClass("has_drop_active");
	});
	
	// Nav
	
	// Record box
	$(".btn_record").click(function(){
		$("#record_box").fadeIn(500);
			
			return false;
		});
		
		$("body , .close").click(function(){
			$("#record_box").fadeOut(500);		
		});
		
		$(".box_content").click(function(){
			return false;
		});
	// End record box
	
	
	// Tab
	$(".tab_content aside").slice(1).hide();
	$(".tab li").bind("click" , function (){
		$(".tab li a").removeClass("active_tab");
		$(this).find("a").addClass("active_tab");
		$(".tab_content aside:visible").fadeOut(100);
		$(".tab_content aside").eq($(this).index()).fadeIn(100);
	});	
	// END Tab
	
	// Tab zakaz
	$("#contact_tab .tab_zakaz_content aside").slice(1).hide();
	$("#contact_tab .tab_zakaz li").bind("click" , function (){
		$("#contact_tab .tab_zakaz li a").removeClass("active_tab");
		$(this).find("a").addClass("active_tab");
		$("#contact_tab .tab_zakaz_content aside:visible").fadeOut(100);
		$("#contact_tab .tab_zakaz_content aside").eq($(this).index()).fadeIn(100);
	});	
	// END Tab zakaz
	
	// Tab zakaz
	$("#dostavka_tab .tab_zakaz_content aside").slice(1).hide();
	$("#dostavka_tab .tab_zakaz li").bind("click" , function (){
		$("#dostavka_tab .tab_zakaz li a").removeClass("active_tab");
		$(this).find("a").addClass("active_tab");
		$("#dostavka_tab .tab_zakaz_content aside:visible").fadeOut(100);
		$("#dostavka_tab .tab_zakaz_content aside").eq($(this).index()).fadeIn(100);
	});	
	// END Tab zakaz
	
	// Tab zakaz
	$("#order_tab .tab_zakaz_content aside").slice(1).hide();
	$("#order_tab .tab_zakaz li").bind("click" , function (){
		$("#order_tab .tab_zakaz li a").removeClass("active_tab");
		$(this).find("a").addClass("active_tab");
		$("#order_tab .tab_zakaz_content aside:visible").fadeOut(100);
		$("#order_tab .tab_zakaz_content aside").eq($(this).index()).fadeIn(100);
	});	
	// END Tab zakaz
	
	// Tab admin
	$(".admin_tab_content aside").slice(1).hide();
	$(".admin_tab li").bind("click" , function (){
		$(".admin_tab li a").removeClass("active_admin_tab");
		$(this).find("a").addClass("active_admin_tab");
		$(".admin_tab_content aside:visible").fadeOut(100);
		$(".admin_tab_content aside").eq($(this).index()).fadeIn(100);
        return false;
	});	
	// END Tab admin
    
    // Tab admin order
    $(".tab_order_content aside").slice(1).hide();
    $(".admin_tab_order li").bind("click" , function (){
        $(".admin_tab_order li a").removeClass("active_tab");
        $(this).find("a").addClass("active_tab");
        $(".tab_order_content aside:visible").fadeOut(100);
        $(".tab_order_content aside").eq($(this).index()).fadeIn(100);
        return false;
    });
    // END Tab admin order
    
	// Open respond form
	
	$("#open_form").click(function(){
		$(".resp_form .respond_form").slideToggle();
	});
	
	// Open respond form
	
	// Not now item
	
	$(".btn_not").click(function(){
		$(".item_now_box").fadeIn();
	});
	
	$(".item_now_box .close").click(function(){
		$(".item_now_box").fadeOut();
	});
	
	// Not now item
	
	// Call box
	
	$(".btn_call").click(function(){
		$(".box_call").fadeIn();
	});
	
	$(".box_call input[type='reset']").click(function(){
		$(".box_call").fadeOut();
	});
	
	// Call box
	
	// Click order
	
	$(".click_order").click(function(){
		$("#one_order").fadeIn();
	});
	
	$("#one_order .close").click(function(){
		$("#one_order").fadeOut();
	});
	
	// Call box
	
	// Add list
	
	$(".list_link").click(function(){
		$("#add_list").fadeIn();
	});
	
	$("#add_list .close").click(function(){
		$("#add_list").fadeOut();
	});
	
	// Add list
	
	// Table discount
	
	$(".discounts .comment_order").click(function(){
		$(".box_discounts").fadeIn();
	});
	
	$(".box_discounts .close").click(function(){
		$(".box_discounts").fadeOut();
	});
	
	// Add list
	
	// Reg input 
	
	$("#reg_box").click(function() {
		if($("#reg_box").prop("checked")) {
			$(".hide_reg_form").slideDown();
		} else {
			$(".hide_reg_form").slideUp();
		}
	});
	
	// Reg input 
	
	// Comment textarea
	
	$("#open_textarea").click(function(){
		$(".comment_textarea").slideToggle();
	});
	
	// Comment textarea
 
    /* ---------------------------------------------------------------------------------------------------------------*/ 
       
    /* ---------- ADMIN JS ---------- */
    /* $('.admin_save').click(function(){
        var val = "";
        $("input, select, textarea").each(function(){
            var tag = $(this).prop("tagName");
            if(tag == "INPUT") {
                var type = $(this).attr("type");
            }
            val += $(this).attr("name") + " => " + ((type == "checkbox") ? (($(this).is(':checked')) ? "1" : "0") : $(this).val()) + ", "; 
        });
        
        SendPost("test", val, PostData);
    });*/
    
	/* --- KNOB --- */
    $(function() {
        $(".knob").knob();
    });
    
    
    /* --- ORDERS VIEW --- */
    $('.view_type_link').click(function(){
        var type = $(this).attr('data-type');
        $.post(ADM_SRV + "bin/jquery.php", {
            func: 'order.view.change',
            view: type
        }).done(function(data) {
            location.reload();
        });
        
        return false;
    });
    
    $('label').disableSelection();

    /* --- AJAX LOAD ITEM --- */
    var KeyCodes = [8,9,13,16,17,18,19,20,27,33,34,35,36,37,38,39,40,45,46,91,92,93,112,113,114,115,116,117,118,119,120,121,122,123,144,145,154,157];
    $('.auto_complete').keyup(function(e){
        var elem = $(this);
        var word = $(this).val();
        if($.inArray(e.keyCode, KeyCodes) == -1){
            $.post(ADM_SRV + "bin/jquery.php", {
                func: 'test',
                view: word
            }).done(function(data) {
                if(data == "") elem.next(".wrap_action_list").find("ul").fadeOut();
                else {
                    elem.next(".wrap_action_list").find("ul").fadeIn();
                    elem.next(".wrap_action_list").find("ul").html(data);
                }
            });
        }
        
        return false;
    });
    
    $("body").on("click", ".autosel", function(){
        $('.auto_complete').next(".wrap_action_list").find("ul").fadeOut();
        $('.auto_complete').val($(this).html());
        
        return false;
    });
})