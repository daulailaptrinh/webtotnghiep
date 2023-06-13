<div class="products">
    <div class="breadcrumbs-fixed panel-action">
        <div class="row">
            <div class="products-act">
                <div class="col-md-4 col-md-offset-2">
                    <div class="left-action text-left clearfix">
                        <h2><i class="fa fa-refresh" style="font-size: 14px; cursor: pointer;"
                               onclick="cms_vcrdiscount('1')"></i>Tạo khuyến mãi</h2>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="right-action text-right">
                        <div class="btn-groups">
                            <button type="button" class="btn btn-primary" onclick="cms_add_discount();"><i
                                    class="fa fa-check"></i> Lưu
                            </button>
                            <button type="button" class="btn btn-primary"
                                    onclick="cms_javascript_redirect( cms_javascrip_fullURL() )"><i
                                    class="fa fa-arrow-left"></i> Trở về
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="main-space customer"></div>

    <div class="products-content" style="margin-bottom: 25px;">
        <div class="basic-info">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-4 padd-0">
                        <h4>Thông tin cơ bản</h4>
                        <small>Nhập tên và các thông tin cơ bản của sản phẩm</small>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="form-group clearfix">
                            <div class="col-md-6 padd-left-0">
                                    <label>Tên sản phẩm</label>
                                    <div class="col-md-11 padd-0">
                                        <select class="form-control" id="prd_id">
                                            <optgroup label="Chọn sản phẩm">
                                                <?php if (isset($data['_products']) && count($data['_products'])):
                                                    foreach ($data['_products'] as $key => $val) :
                                                        ?>
                                                        <option <?php echo 'selected ' ?>
                                                            value="<?php echo $val['ID']; ?>"><?php echo $val['ID']; ?></option>
                                                    <?php
                                                    endforeach;
                                                endif;
                                                ?>
                                            </optgroup>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 padd-right-0">
                                    <label>Phần trăm khuyến mãi</label>
                                    <input type="text" id="percent_discount" class="form-control "
                                           placeholder="0"/>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <div class="col-md-6 padd-left-0">
                                    <label>Thời gian khuyến mãi</label>
                                    <input type="text" id="prd_sls" value="" placeholder="0"
                                           class="form-control text-right txtNumber"/>
</div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
</div>
<script>
    initSample();
</script>
