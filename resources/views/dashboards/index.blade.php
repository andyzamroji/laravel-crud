@extends('layouts.master')

@section('content')
    <!-- TABBED CONTENT -->
    <div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Mata Pelajaran</h3>
								</div>
								<div class="panel-body">
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<th>KODE</th>
												<th>NAMA</th>
												<th>SEMESTER</th>
												<th>NILAI</th>
												<th>GURU</th>
												<th>AKSI</th>
											</tr>
										</thead>
										<tbody>
											@foreach($siswa->mapel as $mapel)
											<tr>
												<td>{{$mapel->kode}}</td>
												<td>{{$mapel->nama}}</td>
												<td>{{$mapel->semester}}</td>
												<td><a href="#" class="nilai" data-type="text" data-pk="{{$mapel->id}}" data-url="/api/siswa/{{$siswa->id}}/editnilai" data-title="Masukkan Nilai">{{$mapel->pivot->nilai}}</a></td>
												<td><a href="/guru/{{$mapel->guru_id}}/profile">{{$mapel->guru->nama}}</a></td>
												<td><a href="/siswa/{{$siswa->id}}/{{$mapel->id}}/deletenilai" class="btn btn-danger btn-sm"
                        onclick="return confirm('Apakah Anda Yakin akan menghapus?')">Delete</a></td>
											</tr>
											@endforeach
										</tbody>
									</table>
								</div>
							</div>
									
								<!-- END TABBED CONTENT -->
@stop