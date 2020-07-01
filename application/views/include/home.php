
<?php 


?><!-- Admin Home Start -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <section class="content-header">
        <div class="header-icon">
            <i class="pe-7s-world"></i>

        </div>
        <div class="header-title">
            <h1><?php echo display('dashboard') ?></h1>
            <small><?php echo display('home') ?></small>
            <ol class="breadcrumb">
                <li><a href="#"><i class="pe-7s-home"></i> <?php echo display('home') ?></a></li>
                <li class="active"><?php echo display('dashboard') ?></li>
            </ol>
        </div>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Alert Message -->
        <?php
        $message = $this->session->userdata('message');
        if (isset($message)) {
            ?>
            <div class="alert alert-info alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <?php echo $message ?>                    
            </div>
            <?php
            $this->session->unset_userdata('message');
        }
        $error_message = $this->session->userdata('error_message');
        if (isset($error_message)) {
            ?>
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <?php echo $error_message ?>                    
            </div>
            <?php
            $this->session->unset_userdata('error_message');
        }
        ?>
        <!-- First Counter -->
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                <div class="panel panel-bd">
                    <div class="panel-body">
                        <div class="statistic-box">
                            <h2><span class="count-number"><?php echo $total_customer ?></span> <span class="slight"><i class="fa fa-play fa-rotate-270 text-warning"> </i></span></h2>
                            <div class="small"><?php echo display('total_customer') ?></div>
                            <div class="sparkline1 text-center"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                <div class="panel panel-bd">
                    <div class="panel-body">
                        <div class="statistic-box">
                            <h2><span class="count-number"><?php echo $total_product ?></span> <span class="slight"><i class="fa fa-play fa-rotate-270 text-warning"> </i></span></h2>
                            <div class="small"><?php echo display('total_product') ?></div>
                            <div class="sparkline1 text-center"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                <div class="panel panel-bd">
                    <div class="panel-body">
                        <div class="statistic-box">
                            <h2><span class="count-number"><?php echo $total_suppliers ?></span> <span class="slight"><i class="fa fa-play fa-rotate-270 text-warning"> </i> </span></h2>
                            <div class="small"><?php echo display('total_supplier') ?></div>
                            <div class="sparkline1 text-center"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                <div class="panel panel-bd">
                    <div class="panel-body">
                        <div class="statistic-box">
                            <h2><span class="count-number"><?php echo $total_sales ?></span><span class="slight"> <i class="fa fa-play fa-rotate-270 text-warning"> </i> </span></h2>
                            <div class="small"><?php echo display('total_invoice') ?></div>
                            <div class="sparkline1 text-center"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
    </section> <!-- /.content -->
</div> <!-- /.content-wrapper -->
<!-- Admin Home end -->

<!-- ChartJs JavaScript -->
<script src="<?php echo base_url() ?>assets/plugins/chartJs/Chart.min.js" type="text/javascript"></script>

<script type="text/javascript">
    <?php 
    $chart_label = $chart_data = '';
    if (!empty($best_sales_product))
        for ($i = 0; $i < 12; $i++) {
            $chart_label .= (!empty($best_sales_product[$i]) ? '"' . $best_sales_product[$i]->product_name . '", ' : null);
            $chart_data .= (!empty($best_sales_product[$i]) ? $best_sales_product[$i]->quantity . ', ' : null);
        }
        $chart_label = rtrim($chart_label, ", ");
        $chart_data = rtrim($chart_data, ", ");
        ?>
    //line chart
    var ctx = document.getElementById("lineChart");
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
//            labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
labels: [<?php echo $chart_label; ?>],
datasets: [
{
    label: "Sales Product",
    fillColor: "#000000",
    strokeColor: "#000000",
    pointColor: "#000000",
    pointStrokeColor: "#000000",
    pointHighlightFill: "#000000",
    pointHighlightStroke: "#000000",
    maintainAspectRatio: false,
    scaleFontColor: "#000000",
    pointLabelFontColor: "#000000",
    pointLabelFontSize: 30,
    data: [<?php echo $chart_data; ?>]
}
//                ,
//                {
//                    label: "Purchase",
//                    borderColor: "#73BC4D",
//                    borderWidth: "1",
//                    backgroundColor: "#73BC4D",
//                    pointHighlightStroke: "rgba(26,179,148,1)",
//                    data: [
//                    <?php
if (!empty($monthly_sales_report[1]))
    for ($i = 0; $i < 12; $i++)
        echo (!empty($monthly_sales_report[1][$i]) ? $monthly_sales_report[1][$i]->total_month . ", " : null);
?>// 
//                    ]
//                }
]
},
options: {
    responsive: true,
    tooltips: {
        mode: 'index',
        intersect: false
    },
    hover: {
        mode: 'nearest',
        intersect: true
    },
    scales: {
        xAxes: [{
            display: true,
            scaleLabel: {
                display: true,
                labelString: 'Products'
            }
        }],
        yAxes: [{
            display: true,
            ticks: {
                beginAtZero: true,
                steps: 10,
                stepValue: 5,
                max: <?php
                $seperatedData = explode(',', $chart_data);
                echo ($seperatedData[0] + 10);
                ?>
            },
            scaleLabel: {
                display: true,
                labelString: 'Quantity'
            }
        }]
    },
    "animation": {
        "duration": 1,
        "onComplete": function () {
            var chartInstance = this.chart,
            ctx = chartInstance.ctx;

                    // ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                    ctx.color = '#000000';
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'bottom';

                    this.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.controller.getDatasetMeta(i);
                        meta.data.forEach(function (bar, index) {
                            var data = dataset.data[index];
                            ctx.fillText(data, bar._model.x, bar._model.y - 5);
                        });
                    });
                }
            }
        }


    });

    //
</script>