# -*- encoding : utf-8 -*-
module ApplicationHelper

  REGIONS = {
      "上海" => ["黄浦","卢湾","徐汇","长宁","静安","普陀","闸北","虹口","杨浦","闵行","宝山","嘉定","浦东","金山","松江","青浦","南汇","奉贤","崇明"],
      "北京" => ["东城","西城","崇文","宣武","朝阳","丰台","石景山","海淀","门头沟","房山","通州","顺义","昌平","大兴","怀柔","平谷","密云","延庆"],
      "天津" => ["和平","河东","河西","南开","河北","红桥","塘沽","汉沽","大港","东丽","西青","津南","北辰","武清","宝坻","宁河","静海","蓟县"],
      "江苏" => ["南京","无锡","徐州","常州","苏州","南通","连云港","淮安","盐城","扬州","镇江","泰州","宿迁"],
      "浙江" => ["杭州","宁波","温州","嘉兴","湖州","绍兴","金华","衢州","舟山","台州","丽水"],
      "广东" => ["广州","韶关","深圳","珠海","汕头","佛山","江门","湛江","茂名","肇庆","惠州","梅州","汕尾","河源","阳江","清远","东莞","中山","潮州","揭阳","云浮"],
      "重庆" => ["万州","涪陵","渝中","大渡口","江北","沙坪坝","九龙坡","南岸","北碚","万盛","双桥","渝北","巴南","黔江","长寿","綦江","潼南","铜梁","大足","荣昌","璧山","梁平","城口","丰都","垫江","武隆","忠","开","云阳","奉节","巫山","巫溪","石柱","秀山","酉阳","彭水","江津","合川","永川","南川"],
      "山东" => ["济南","青岛","淄博","枣庄","东营","烟台","潍坊","济宁","泰安","威海","日照","莱芜","临沂","德州","聊城","滨州","荷泽"],
      "辽宁" => ["沈阳","大连","鞍山","抚顺","本溪","丹东","锦州","营口","阜新","辽阳","盘锦","铁岭","朝阳","葫芦岛"],
      "湖北" => ["武汉","黄石","十堰","宜昌","襄樊","鄂州","荆门","孝感","荆州","黄冈","咸宁","随州","恩施","神农架"],
      "广西" => ["南宁","柳州","桂林","梧州","北海","防城港","钦州","贵港","玉林","百色","贺州","河池","来宾","崇左"],
      "海南" => ["海口","三亚"],
      "四川" => ["成都","自贡","攀枝花","泸州","德阳","绵阳","广元","遂宁","内江","乐山","南充","眉山","宜宾","广安","达州","雅安","巴中","资阳","阿坝","甘孜","凉山"],
      "贵州" => ["贵阳","六盘水","遵义","安顺","铜仁地","黔西","毕节","黔东","黔南"],
      "云南" => ["昆明","曲靖","玉溪","保山","昭通","丽江","思茅","临沧","楚雄","红河","文山","西双版纳","大理","德宏","怒江","迪庆"],
      "河北" => ["石家庄","唐山","秦皇岛","邯郸","邢台","保定","张家口","承德","沧州","廊坊","衡水"],
      "陕西" => ["西安","铜川","宝鸡","咸阳","渭南","延安","汉中","榆林","安康","商洛"],
      "甘肃" => ["兰州","嘉峪关","金昌","白银","天水","武威","张掖","平凉","酒泉","庆阳","定西","陇南","临夏","甘南"],
      "青海" => ["西宁","海东","海北","黄南","海南","果洛","玉树","海西"],
      "宁夏" => ["银川","石嘴山","吴忠","固原","中卫"],
      "新疆" => ["乌鲁木齐","克拉玛依","吐鲁番地","哈密地","昌吉","博尔塔拉","巴音郭楞","阿克苏地","克孜勒苏柯尔克孜","喀什","和田","伊犁","塔城","阿勒泰","石河子","阿拉尔","图木舒克","五家渠"],
      "西藏" => ["拉萨","昌都","山南","日喀则","那曲","阿里","林芝"],
      "山西" => ["太原","大同","阳泉","长治","晋城","朔州","晋中","运城","忻州","临汾","吕梁"],
      "内蒙古" => ["呼和浩特","包头","乌海","赤峰","通辽","鄂尔多斯","呼伦贝尔","巴彦淖尔","乌兰察布","兴安盟","锡林郭勒","阿拉善"],
      "吉林" => ["长春","吉林","四平","辽源","通化","白山","松原","白城","延边"],
      "黑龙江" => ["哈尔滨","齐齐哈尔","鸡西","鹤岗","双鸭山","大庆","伊春","佳木斯","七台河","牡丹江","黑河","绥化","大兴安岭"],
      "安徽" => ["合肥","芜湖","蚌埠","淮南","马鞍山","淮北","铜陵","安庆","黄山","滁州","阜阳","宿州","巢湖","六安","亳州","池州","宣城"],
      "福建" => ["福州","厦门","莆田","三明","泉州","漳州","南平","龙岩","宁德"],
      "江西" => ["南昌","景德镇","萍乡","九江","新余","鹰潭","赣州","吉安","宜春","抚州","上饶"],
      "河南" => ["郑州","开封","洛阳","平顶山","安阳","鹤壁","新乡","焦作","濮阳","许昌","漯河","三门峡","南阳","商丘","信阳","周口","驻马店"],
      "湖南" => ["长沙","株洲","湘潭","衡阳","邵阳","岳阳","常德","张家界","益阳","郴州","永州","怀化","娄底","湘西"]
  }

  def provinces
      REGIONS.keys
  end

  def cities
      REGIONS
  end

  def event_categories
    EventCategory.order(:display_order).all
  end

  def hosts
    Host.where(:user_id => current_user.id)
  end

  def rich_editor_tag(name, content = nil, options = {})
    element_id = sanitize_to_id(options[:id] || name)
    options = { :language => I18n.locale.to_s }.merge(options)

    options = {:height => "400px",
              :stylesSet => [],
              :extraPlugins => "stylesheetparser,richfile,MediaEmbed,audio",
              :removePlugins => "scayt,menubutton,contextmenu,image,forms",
              :contentsCss => "/assets/rich/editor.css",
              :removeDialogTabs => "link:advanced;link:target",
              :startupOutlineBlocks => true,
              :forcePasteAsPlainText => true,
              :format_tags => "h3;p;pre",
              :toolbar => [
                  ["Format","Styles"],
                  ["Bold","Italic","-","NumberedList","BulletedList","Blockquote","-","richImage","-","Link","Unlink"],
                  ["Source","ShowBlocks"]
              ],
              :richBrowserUrl => "/rich/files/",
              :uiColor => "#f4f4f4",
              :allowed_styles => ["thumb","rich_thumb","original"],
              :default_style => "thumb",
              :insert_many => false,
              :allow_document_uploads => false,
              :allow_embeds => false,
              :placeholder_image => "data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==",
              :preview_size => "100px",
              :hidden_input => false,
              :width => "76%"}.merge(options)

    input_html = { :id => element_id }.merge( options.delete(:input_html) || {} )
    js_content_for_section = options.delete(:js_content_for)

    output_buffer = ActiveSupport::SafeBuffer.new
    output_buffer << text_area_tag(name, content, input_html)


    js = ["if (CKEDITOR.instances['#{element_id}']) {CKEDITOR.remove(CKEDITOR.instances['#{element_id}']);}"]
    js << "CKEDITOR.replace('#{element_id}', #{ActiveSupport::JSON.encode(options)});"
    js = "(function() { #{js.join} }).call(this);".html_safe
    output_buffer << (js_content_for_section ? content_for(js_content_for_section, js) : javascript_tag(js))
    output_buffer

  end

  def rich_picker_tag(name, content = nil, options = {})
    element_id = sanitize_to_id(options[:id] || name)
    options = { :language => I18n.locale.to_s }.merge(options)

    options = {:height => 400,
              :stylesSet => [],
              :extraPlugins => "stylesheetparser,richfile,MediaEmbed,audio",
              :removePlugins => "scayt,menubutton,contextmenu,image,forms",
              :contentsCss => "/assets/rich/editor.css",
              :removeDialogTabs => "link:advanced;link:target",
              :startupOutlineBlocks => true,
              :forcePasteAsPlainText => true,
              :format_tags => "h3;p;pre",
              :toolbar => [
                  ["Format","Styles"],
                  ["Bold","Italic","-","NumberedList","BulletedList","Blockquote","-","richImage","-","Link","Unlink"],
                  ["Source","ShowBlocks"]
              ],
              :language => "zh-CN",
              :richBrowserUrl => "/rich/files/",
              :uiColor => "#f4f4f4",
              :allowed_styles => ["thumb","rich_thumb","original"],
              :default_style => "thumb",
              :insert_many => false,
              :allow_document_uploads => false,
              :allow_embeds => false,
              :placeholder_image => "data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==",
              :preview_size => "100px",
              :hidden_input => false}.merge(options)

    input_html = { :id => element_id, :class => 'uneditable-input', :readonly => 'readonly' }.merge( options.delete(:input_html) || {} )
    js_content_for_section = options.delete(:js_content_for)

    output_buffer = ActiveSupport::SafeBuffer.new
    output_buffer << text_field_tag(name, content, input_html)
    output_buffer << "<a class='btn' id='#{element_id + '_preview_btn'}'>浏览/上传</a>".html_safe


    js = ["$('##{element_id}, ##{element_id + '_preview_btn'}').click(function(e){e.preventDefault();assetPicker.showFinder('##{element_id}', #{ActiveSupport::JSON.encode(options)});})"]
    js = "(function() { #{js.join} }).call(this);".html_safe
    output_buffer << (js_content_for_section ? content_for(js_content_for_section, js) : javascript_tag(js))
    output_buffer

  end

end
