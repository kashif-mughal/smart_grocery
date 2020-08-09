<!-- Manage Category Start -->
<div class="content-wrapper">
    <section class="content-header">
        <div class="header-icon">
            <i class="pe-7s-note2"></i>
        </div>
        <div class="header-title">
            <h1>Daily Reports</h1>
            <small>View Daily Report</small>
            <ol class="breadcrumb">
                <li><a href=""><i class="pe-7s-home"></i> Home</a></li>
                <li><a href="#">Report</a></li>
                <li class="active">Daily Report</li>
            </ol>
        </div>
    </section>

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

        <!-- Manage Category -->
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4>Daily Report</h4>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6 pull-left" style="margin-top: 14px;">
                                    <div class="form-group form-inline pull-left" style="width:200px;">
                                      <label for="reportBy">Report By:</label>
                                      <select class="form-control" id="reportBy">
                                        <option>Products</option>
                                        <option>Orders</option>
                                      </select>
                                    </div>
                                    <a href="javascript:void(0)" class="btn btn-primary pull-left" id="generateReport" style="margin-bottom: 14px;">
                                        <i class="fas fa-sync"></i>
                                        Generate
                                    </a>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group form-inline pull-right">
                                        <?php 
                                            $todays_date = date("d/m/Y");
                                         ?>
                                        <input type="text" name="daterange" id="daterange" class="form-control form-inline" 
                                            value="<?php echo $todays_date. ' - ' .$todays_date ?>" style="width: 300px;" />
                                        <a href="javascript:void(0)" class="btn btn-info" id="ExportReport" style="margin-bottom: 14px; margin-top: 14px;">
                                            <i class="fas fa-file-export"></i>
                                            Export
                                        </a>
                                    </div>
                                </div>    
                                
                            </div>
                            
                        </div>

                        <div class="table-responsive">
                            <table id="DailyReportsTable" class="table table-bordered table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>SL#</th>
                                        <th class="text-center" id="headerCol1">Product Id</th>
                                        <th class="text-center" id="headerCol2">Product Name</th>
                                        <th class="text-center" id="headerCol3">Total Price</th>
                                    </tr>
                                </thead>
                                <tbody id="daily_report_body">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- Manage Category End -->

<!-- Delete Category ajax code -->
<script type="text/javascript">
    var startDate = "";
    var endDate = "";
    var haveData = false;
    // Date Range
    $(function() {
      $('input[name="daterange"]').daterangepicker({
        opens: 'left'
      }, function(start, end, label) {
        startDate = start.format('YYYY-MM-DD');
        endDate = end.format('YYYY-MM-DD');
      });
    });

    $('#daterange').on('apply.daterangepicker',function(ev, picker) {
        startDate = picker.startDate.format('YYYY-MM-DD');
        endDate = picker.endDate.format('YYYY-MM-DD');
    });

    $(document).ready(function() {
        var today = new Date();
        startDate = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
        endDate = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();

        filltable('Products');

        $('#ExportReport').click(function() {
            if(haveData) {
                exportTableToCSV.apply(this, [$('#DailyReportsTable'), 'export.csv']);
                windows.location.reload();
            }
        });

        function exportTableToCSV($table, filename) {
    
            var $rows = $table.find('tr:has(td),tr:has(th)'),
        
                // Temporary delimiter characters unlikely to be typed by keyboard
                // This is to avoid accidentally splitting the actual contents
                tmpColDelim = String.fromCharCode(11), // vertical tab character
                tmpRowDelim = String.fromCharCode(0), // null character
        
                // actual delimiter characters for CSV format
                colDelim = '","',
                rowDelim = '"\r\n"',
        
                // Grab text from table into CSV formatted string
                csv = '"' + $rows.map(function (i, row) {
                    var $row = jQuery(row), $cols = $row.find('td,th');
        
                    return $cols.map(function (j, col) {
                        var $col = jQuery(col), text = $col.text();
        
                        return text.replace(/"/g, '""'); // escape double quotes
        
                    }).get().join(tmpColDelim);
        
                }).get().join(tmpRowDelim)
                    .split(tmpRowDelim).join(rowDelim)
                    .split(tmpColDelim).join(colDelim) + '"',
        
                // Data URI
                csvData = 'data:application/csv;charset=utf-8,' + encodeURIComponent(csv);
                
                
              if (window.navigator.msSaveBlob) { // IE 10+
                //alert('IE' + csv);
                window.navigator.msSaveOrOpenBlob(new Blob([csv], {type: "text/plain;charset=utf-8;"}), "csvname.csv")
              } 
              else {
                jQuery(this).attr({ 'download': filename, 'href': csvData, 'target': '_blank' }); 
              }
        }
    });

    // Get Data by product
    $("#generateReport").click(function(e) {
        e.preventDefault();
        var reportType = $("#reportBy").val();
        $("#daily_report_body").empty();

        filltable(reportType);
    });

    function filltable(reportType) {
        $.ajax({
            type: "POST",
            url: '<?php echo base_url('CReport/generate_report') ?>',
            data: {Report_Type: reportType, start_date: startDate, end_date: endDate},
            dataType: "json",
            cache: false,
            success: function(data) {
                var content = "";
                var grand_total = 0;

                if(reportType == 'Products') {
                    $('#headerCol1').text('Product Id');
                    $('#headerCol2').text('Product Name');
                    $('#headerCol3').text('Total Price');
                    for(i = 0; i < data.length; i++) {
                        grand_total += parseInt(data[i].total_price);
                        content += `<tr>
                                        <td>${i+1}</td>
                                        <td class="text-center">${data[i].ItemId}</td>
                                        <td class="text-center">${data[i].ProductName}</td>
                                        <td class="text-center">${data[i].total_price}</td>
                                    </tr>`;
                    }
                    content += `<tr>
                                <td colspan="3" class="text-right">Grand Total</td>
                                <td class="text-left">${grand_total}</td>
                            </tr>`;
                    haveData = true;
                }
                else if(reportType == 'Orders') {
                    $('#headerCol1').text('Order Id');
                    $('#headerCol2').text('Customer Id');
                    $('#headerCol3').text('Total Amount');
                    for(i = 0; i < data.length; i++) {
                        grand_total += parseInt(data[i].OrderValue);
                        content += `<tr>
                                        <td>${i+1}</td>
                                        <td class="text-center">${data[i].OrderId}</td>
                                        <td class="text-center">${data[i].CustomerId}</td>
                                        <td class="text-center">${data[i].OrderValue}</td>
                                    </tr>`;
                    }
                    content += `<tr>
                                <td colspan="3" class="text-right">Grand Total</td>
                                <td class="text-left">${grand_total}</td>
                            </tr>`;
                    haveData = true;
                }
                else {
                    haveData = false;
                    content = "No Record Found";
                }
                
                // Final Append
                $('#DailyReportsTable').append(content);
                content = "";
            },
            error: function(data) {
                console.log(error);
            }
        });

    }

</script>
