<!-- Stock report start -->
<script type="text/javascript">
function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
	document.body.style.marginTop="0px";
    window.print();
    document.body.innerHTML = originalContents;
}
</script>

<!-- Supplier Sales Report Start -->
<div class="content-wrapper">
	<section class="content-header">
	    <div class="header-icon">
	        <i class="pe-7s-note2"></i>
	    </div>
	    <div class="header-title">
	        <h1><?php echo display('supplier_sales_details') ?></h1>
	        <small><?php echo display('supplier_sales_details') ?></small>
	        <ol class="breadcrumb">
	            <li><a href="#"><i class="pe-7s-home"></i> <?php echo display('home') ?></a></li>
	            <li><a href="#"><?php echo display('supplier') ?></a></li>
	            <li class="active"><?php echo display('supplier_sales_details') ?></li>
	        </ol>
	    </div>
	</section>

	<!-- Search Supplier -->
	<section class="content">

		<div class="row">
            <div class="col-sm-12">
                <div class="column">
                
                  <a href="<?php echo base_url('Csupplier')?>" class="btn btn-info m-b-5 m-r-2"><i class="ti-plus"> </i> <?php echo display('add_supplier')?> </a>

                  <a href="<?php echo base_url('Csupplier/manage_supplier')?>" class="btn btn-primary m-b-5 m-r-2"><i class="ti-align-justify"> </i>  <?php echo display('manage_supplier')?> </a>

                  <a href="<?php echo base_url('Csupplier/supplier_ledger_report')?>" class="btn btn-success m-b-5 m-r-2"><i class="ti-align-justify"> </i>  <?php echo display('supplier_ledger')?> </a>

                </div>
            </div>
        </div>

		<!-- Sales Details -->
		<div class="row">
		    <div class="col-sm-12">
		        <div class="panel panel-bd lobidrag">
		            <div class="panel-heading">
		                <div class="panel-title">
		                    <h4><?php echo display('supplier_sales_details') ?></h4>
		                </div>
		            </div>
		            <div class="panel-body">
		            	<div class="text-right">
		                    <a  class="btn btn-warning" href="#" onclick="printDiv('printableArea')"><?php echo display('print') ?></a>
		                </div>
		            	<div id="printableArea" style="margin-left:2px;">

		            		<?php if ($supplier_name) { ?>

		            		<div class="text-center">
								<h3> {supplier_name} </h3>
								<h4><?php echo display('address') ?> : {supplier_address} </h4>
								<h4> <?php echo display('print_date') ?>: <?php echo date("d/m/Y h:i:s"); ?> </h4>
							</div>

							<?php } ?>

			                <div class="table-responsive">
			                    <table class="table table-bordered table-striped table-hover">
									<thead>
										<tr>
											<th><?php echo display('date') ?></th>
											<th><?php echo display('product_name') ?></th>
											<th><?php echo display('quantity') ?></th>
											<th><?php echo display('rate') ?></th>
											<th><?php echo display('ammount')?></th>
										</tr>
									</thead>
									<tbody>
									<?php
									if ($sales_info) {
									?>
									{sales_info}
										<tr>
											
											<td>{date}</td>
											<td>
												<a href="<?php echo base_url().'Cproduct/product_details/{product_id}'; ?>">
													{product_name} - {product_model}
												</a>
											</td>
											<td align="right">{quantity}</td>
											<td style="text-align:right !Important"><?php echo (($position==0)?"$currency {supplier_rate}":"{supplier_rate} $currency") ?></td>
											<td style="text-align:right !Important"><?php echo (($position==0)?"$currency {total}":"{total} $currency") ?></td>
										</tr>
									{/sales_info}
									<?php
									}
									?>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="3"></td>
											<td>
												<b><?php echo display('grand_total') ?></b> :
											</td>
											<td style="text-align:right"><b>
											<?php echo (($position==0)?"$currency {sub_total}":"{sub_total} $currency") ?></b></td>
										</tr>
									</tfoot>
			                    </table>
			                </div>
			            </div>
		            </div>
		        </div>
		    </div>
		</div>
	</section>
</div>
<!-- Supplier Sales Details End -->