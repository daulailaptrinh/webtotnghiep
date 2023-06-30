<div class="quick-info report row" style="margin-bottom: 15px;">
    <div class="col-md-12 padd-0">
        <div class="col-md-3 padd-right-0">
            <div class="report-box" style="border: 1px dotted #ddd; border-radius: 0">
                <div class="infobox-icon">
                    <i class="fa fa-clock-o cgreen" style="font-size: 45px;" aria-hidden="true"></i>
                </div>
                <div class="infobox-data">
                    <h3 class="infobox-title cgreen"
                        style="font-size: 25px;"><?php echo (isset($total_orders['quantity'])) ? $total_orders['quantity'] : 0; ?>
                        / <?php echo (isset($total_orders['total_quantity'])) ? $total_orders['total_quantity'] : 0; ?></h3>
                    <span class="infobox-data-number text-center" style="font-size: 14px; color: #555;">Số cửa hàng / Số lượng SP</span>
                </div>
            </div>
        </div>
        <div class="col-md-3 padd-right-0">
            <div class="report-box" style="border: 1px dotted #ddd; border-radius: 0">
                <div class="infobox-icon">
                    <i class="fa fa-tag blue" style="font-size: 45px;" aria-hidden="true"></i>
                </div>
                <div class="infobox-data">
                    <h3 class="infobox-title blue"
                        style="font-size: 25px;"><?php echo cms_encode_currency_format((isset($total_orders['total_discount']) ? $total_orders['total_discount'] : 0)); ?></h3>
                    <span class="infobox-data-number text-center"
                          style="font-size: 14px; color: #555;">Tổng số tiền chiết khấu</span>
                </div>
            </div>
        </div>
        <div class="col-md-3 padd-right-0">
            <div class="report-box " style="border: 1px dotted #ddd; border-radius: 0">
                <div class="infobox-icon">
                    <i class="fa fa-refresh orange" style="font-size: 45px;"></i>
                </div>
                <div class="infobox-data">
                    <h3 class="infobox-title orange"
                        style="font-size: 25px;"><?php echo cms_encode_currency_format((isset($total_orders['total_money']) ? $total_orders['total_money'] : 0)); ?></h3>
                    <span class="infobox-data-number text-center"
                          style="font-size: 14px; color: #555;">Doanh số</span>
                </div>
            </div>
        </div>
        <div class="col-md-3 padd-right-0">
            <div class="report-box" style="border: 1px dotted #ddd; border-radius: 0">
                <div class="infobox-icon">
                    <i class="fa fa-clock-o cred" style="font-size: 45px;"></i>
                </div>
                <div class="infobox-data">
                    <h3 class="infobox-title cred"
                        style="font-size: 25px;"><?php echo cms_encode_currency_format((isset($total_orders['total_debt']) ? $total_orders['total_debt'] : 0)); ?></h3>
                    <span class="infobox-data-number text-center" style="font-size: 14px; color: #555;">Khách nợ</span>
                </div>
            </div>
        </div>
    </div>
</div>

<table class="table table-bordered table-striped">
    <thead>
    <tr>
        <th></th>
        <th class="text-center">Tên cửa hàng</th>
        <th class="text-center">Tổng số đơn</th>
        <th class="text-center">Tổng chiết khấu</th>
        <th class="text-center">Tổng tiền</th>
        <th class="text-center">Tổng SP</th>
        <th class="text-center">Tổng nợ</th>
    </tr>
    </thead>
    <tbody>
    <?php if (isset($_list_stores) && count($_list_stores)) :
        foreach ($_list_stores as $key => $item) :
            ?>
            <tr>
                <td style="text-align: center;">
                    <i style="color: #478fca!important;" title="Chi tiết đơn hàng"
                       onclick="cms_show_list_order(<?php echo $item['store_id'];?>)"
                       class="fa fa-plus-circle i-list-order-<?php echo $item['store_id']?>">
                    </i>
                    <i style="color: #478fca!important;" title="Chi tiết đơn hàng"
                       onclick="cms_show_list_order(<?php echo $item['store_id'];?>)"
                       class="fa fa-minus-circle i-hide i-list-order-<?php echo $item['store_id']?>">
                    </i>
                </td>
                <td class="text-center"><?php echo cms_getNamestockbyID($item['store_id']); ?></td>
                <td class="text-center"><?php echo $item['total_order'] ?></td>
                <td class="text-center"><?php echo cms_encode_currency_format($item['total_discount']); ?></td>
                <td class="text-center"><?php echo cms_encode_currency_format($item['total_money']); ?></td>
                <td class="text-center"><?php echo $item['total_quantity']; ?></td>
                <td class="text-center"><?php echo cms_encode_currency_format($item['total_debt']); ?></td>
            </tr>
            <tr class="tr-hide" id="tr-list-order-<?php echo $item['store_id']?>">
                <td colspan="15">
                    <div class="tabbable">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a data-toggle="tab">
                                    <i class="green icon-reorder bigger-110"></i>
                                    Danh sách đơn hàng
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active">
                                <table class="table table-striped table-bordered table-hover dataTable">
                                    <thead>
                                    <tr role="row">
                                        <th class="text-center">STT</th>
                                        <th class="text-left hidden-768">Mã đơn hàng</th>
                                        <th class="text-left">Kho xuất</th>
                                        <th class="text-center">Ngày bán</th>
                                        <th class="text-center">Thu ngân</th>
                                        <th class="text-center ">Số lượng</th>
                                        <th class="text-center ">Chiết khấu</th>
                                        <th class="text-center ">Tổng tiền</th>
                                        <th class="text-center ">Nợ</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                    $queue = 1;
                                    foreach ($item['_list_orders'] as $order) {
                                        ?>
                                        <tr>
                                            <td class="text-center width-5 hidden-320 "><?php echo $queue++; ?></td>
                                            <td class="text-center" style="color: #2a6496; cursor: pointer;"
                                                onclick="cms_detail_order(<?php echo $order['ID']; ?>)"><?php echo $order['output_code']; ?></td>
                                            <td class="text-center"><?php echo cms_getNamestockbyID($order['store_id']); ?></td>
                                            <td class="text-center"><?php echo ($order['sell_date'] != '0000-00-00 00:00:00') ? gmdate("H:i d/m/Y", strtotime(str_replace('-', '/', $order['sell_date'])) + 7 * 3600) : '-'; ?></td>
                                            <td class="text-center"><?php echo cms_getNameAuthbyID($order['user_init']); ?></td>
                                            <td class="text-center"><?php echo $order['total_quantity']; ?></td>
                                            <td class="text-center"><?php echo cms_encode_currency_format($order['coupon']); ?></td>
                                            <td class="text-center"
                                                style="background-color: #F2F2F2;"><?php echo cms_encode_currency_format($order['total_money']); ?></td>
                                            <td class="text-center"
                                                style="background: #fff;"><?php echo cms_encode_currency_format($order['lack']); ?></td>
                                        </tr>
                                    <?php
                                    }
                                    ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        <?php endforeach;
    else :
        echo '<tr><td colspan="9" class="text-center">Không có dữ liệu</td></tr>';
    endif;
    ?>
    </tbody>
</table>
<div class="alert alert-info summany-info clearfix" role="alert">
    <div class="pull-right ajax-pagination">
        <?php echo $_pagination_link; ?>
    </div>
</div>







<?php 
    function convert_name($str) {
		$str = preg_replace("/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/", 'a', $str);
		$str = preg_replace("/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/", 'e', $str);
		$str = preg_replace("/(ì|í|ị|ỉ|ĩ)/", 'i', $str);
		$str = preg_replace("/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/", 'o', $str);
		$str = preg_replace("/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/", 'u', $str);
		$str = preg_replace("/(ỳ|ý|ỵ|ỷ|ỹ)/", 'y', $str);
		$str = preg_replace("/(đ)/", 'd', $str);
		$str = preg_replace("/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/", 'A', $str);
		$str = preg_replace("/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/", 'E', $str);
		$str = preg_replace("/(Ì|Í|Ị|Ỉ|Ĩ)/", 'I', $str);
		$str = preg_replace("/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/", 'O', $str);
		$str = preg_replace("/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/", 'U', $str);
		$str = preg_replace("/(Ỳ|Ý|Ỵ|Ỷ|Ỹ)/", 'Y', $str);
		$str = preg_replace("/(Đ)/", 'D', $str);
		$str = preg_replace("/(\“|\”|\‘|\’|\,|\!|\&|\;|\@|\#|\%|\~|\`|\=|\_|\'|\]|\[|\}|\{|\)|\(|\+|\^)/", '-', $str);
		$str = preg_replace("/( )/", '-', $str);
		return $str;
	}
    // Hàm so sánh tùy chỉnh dựa trên thuộc tính "name" theo thu tu tang dan
    function compareName($a, $b) {
        return strcmp($a->name, $b->name);
    }

    if (isset($_list_stores) && count($_list_stores)) {
        $data = array();
        foreach ($_list_stores as $key => $item) {

            $str_without_accents = convert_name(cms_getNamestockbyID($item['store_id']));

            $myObj = new stdClass();
            $myObj->name = $str_without_accents;
            $myObj->total_money = cms_encode_currency_format($item['total_money']);
            $myObj->total_debt = cms_encode_currency_format($item['total_debt']);

            $myJSON = json_encode($myObj); // string
            // echo $myJSON."<br>";
            $object = json_decode($myJSON); // object
            // echo gettype($object);

            $data[] = $object; // mang chua cac object con

            // Sắp xếp mảng theo thứ tự tăng dần dựa trên thuộc tính "name"
            usort($data, 'compareName');
        }
    }      
?>

<div style="text-align: center;">
    <label style="color: #428bca;font-size: 23px;margin-top: 10px;margin-bottom: 10px;">Biểu đồ doanh thu</label>
</div>

<div id="chart" style="height: 250px;"></div>
<script>
    // Lấy dữ liệu từ PHP và chuyển đổi thành mảng JavaScript
    var data = <?php echo json_encode($data); ?>;
    // console.log(data);

    new Morris.Bar({
        // ID of the element in which to draw the chart.
        element: 'chart',
        // Chart data records -- each entry in this array corresponds to a point on the chart.
        data: data,
        // The name of the data record attribute that contains x-values.
        xkey: 'name',
        // A list of names of data record attributes that contain y-values.
        ykeys: ['total_money','total_debt'],
        // Labels for the ykeys -- will be displayed when you hover over the chart.
        labels: ['Doanh thu','Nợ']
    });
</script>