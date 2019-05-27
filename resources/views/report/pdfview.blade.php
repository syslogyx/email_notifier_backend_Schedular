<!doctype html>
<html>
	<style type="text/css">
        @page {
            header: page-header;
            footer: page-footer;
            /*margin-top: 100px;*/
            /*margin-bottom: 150px;*/
        }
       /* .page-break {
            page-break-after: always;
        }*/
       table th , td{
            padding-left: 0.35em;
            padding-right: 0.35em;
            padding-top: 0.35em;
            padding-bottom: 0.35em;
            vertical-align: top;
            border:1px solid black;
        }
    	footer { 
            position: fixed; 
            bottom: -10px; 
            left: 0px; 
            right: 0px; 
            height: 30px; 
        }
        footer .pagenum:before {
          	content: counter(page);
    	}
        @page { margin: 100px 100px; }

     	header { 
            position: fixed;
            top: -25px; 
            left: 0px; 
            right: 0px; 
            height: 50px; 
        }
    </style>
    <body>
       <header name="page-header">
      		<span><b>Machine Working Report</b></span>
    	</header>
        <hr>
        <h3 style="text-align:center;font-family:Calibri (Body);"> Machine Status Details</h3>
        <div class="page-break">
            <table style="font-family:Calibri (Body);border-collapse: collapse;" width="100%">
                <thead width="100%">
                    <tr>
                        <th width="7%" style="text-align:center">Sr No.</th>
                        <th width="15%" style="text-align:center">Machine Name</th>
                        <th width="13%" style="text-align:center">Off Time</th>
                        <th width="13%" style="text-align:center;">On Time</th>
                        <th width="12%" style="text-align:center;">Estimation Hour</th>
                        <th width="11%" style="text-align:center">Actual Hour</th>
                        <th width="13%" style="text-align:center">Reason</th>
                        <th width="16%" style="text-align:center">Message</th>
                    </tr>
                </thead>
                <tbody>
                	@foreach ($data as $key => $fn)
                    <tr>
                        <td  width="7%" style="text-align:center">{{++$key}}</td>
                        <td width="15%" style="text-align:center">{{$fn['machine']['name']}}</td>
                        <td width="13%" style="text-align: center;">{{$fn['created_at']}}</td>
                        <td  width="13%" style="text-align:center;">{{$fn['on_time']}}</td>
                        <td width="12%" style="text-align:center;">
                        @if($fn['user_estimation'])
                            @if (count($fn['user_estimation']) > 0)
                                {{$fn['user_estimation'][0]['hour']}}
                            @else
                                {{'-'}}
                            @endif
                        @else{{'-'}}
                        @endif
                        </td>
                        <td width="11%" style="text-align:center">{{$fn['actual_hour']}}</td>
                        <td width="13%" style="text-align:center">
                        @if($fn['user_estimation'])
                            @if (count($fn['user_estimation']) > 0)
                                {{$fn['user_estimation'][0]['reason_data']['reason']}}
                            @else
                                {{'-'}}
                            @endif
                        @else{{'-'}}
                        @endif
                        </td>
                        <td width="16%" style="text-align:center">
                        @if($fn['user_estimation'])
                            @if (count($fn['user_estimation']) > 0)
                            {{$fn['user_estimation'][0]['msg']}}
                            @else
                                {{'-'}}
                            @endif
                        @else{{'-'}}
                        @endif
                        </td>   
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <footer name="page-footer">
	       <div class="pagenum-container" style="text-align: center;color:#cac5c5">Page <span class="pagenum"></span></div>
	    </footer>
    </body>
</html>
