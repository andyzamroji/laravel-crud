@extends('layouts.master')

@section('content')
<div class="main">
  <div class="main-content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6"> 
            <!-- TABBED CONTENT -->
            <div class="panel">
				<div class="panel-heading">
					<h3 class="panel-title">Rangking 5 Besar</h3>
				</div>
				<div class="panel-body">
				    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Rangking</th>
                                <th>Nama</th>
                                <th>Nilai</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $rangking = 1;
                            @endphp
                            @foreach($siswa as $s)
                            <tr>
                                <td>{{$rangking}}</td>
                                <td>{{$s->nama_depan}} {{$s->nama_belakang}}</td>
                                <td>{{$s->rataRataNilai}}</td>
                            </tr>
                            @php
                            $rangking++;
                            @endphp
                            @endforeach
                        </tbody>
					    </table>
				    </div>
			    </div>
            </div>
		</div>
    </div>
</div>
				<!-- END TABBED CONTENT -->
@stop