<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Exports\SiswaExport;
use Maatwebsite\Excel\Facades\Excel;
use App\User;
use PDF;

class SiswaController extends Controller
{
  public function index(Request $request)
  {
    if($request->has('cari')){
      $data_siswa = \App\Siswa::where('nama_depan','LIKE','%'.$request->cari.'%')->get();
    }else{
      $data_siswa = \App\Siswa::all();
    }
    return view('siswa.index',['data_siswa' => $data_siswa]);
  }

  public function create(Request $request)
  {
    $this->validate($request,[
      'nama_depan'    => 'required|min:5',
      'nama_belakang' => 'required',
      'email'         => 'required|email|unique:users',
      'jenis_kelamin' => 'required',
      'agama'        => 'required',
      'alamat'        => 'required',
      'avatar'        => 'mimes:jpg,png',
    ]);
    
    
    
    //insert table user
    $user = new \App\User;
    $user->role = 'siswa';
    $user->name = $request->nama_depan;
    $user->email = $request->email;
    $user->password = bcrypt('rahasia');
    $user->remember_token = str_random(60);
    $user->save();

    //insert table siswa
    $request->request->add(['user_id' => $user->id ]);
    $siswa = \App\Siswa::create($request->all());
    if ($request->hasFile('avatar')) {
      $request->file('avatar')->move('images/',$request->file('avatar')->getClientOriginalName());
      $siswa->avatar = $request->file('avatar')->getClientOriginalName();
      $siswa->save();
    } 
    
    return redirect('/siswa')->with('sukses','Data Berhasil Di Input');
  }

  public function edit($id)
  {
    $siswa = \App\Siswa::find($id);
    return view('siswa/edit',['siswa' => $siswa]);
  }

  public function update(Request $request,$id)
  {
    $siswa = \App\Siswa::find($id);
    $siswa->update($request->all());
    if ($request->hasFile('avatar')) {
      $request->file('avatar')->move('images/',$request->file('avatar')->getClientOriginalName());
      $siswa->avatar = $request->file('avatar')->getClientOriginalName();
      $siswa->save();
    }     
    return redirect('/siswa')->with('sukses','Data berhasil di ubah!');
  }

  public function delete($id)
  {
    $siswa = \App\Siswa::find($id);
    $siswa->delete();
    return redirect('/siswa')->with('sukses','Data Berhasil di Hapus!');
  }

  public function profile($id)
  {
    $siswa = \App\Siswa::find($id);
    $matapelajaran = \App\Mapel::all();
    
    $categories = [];
    $data       = [];

    foreach($matapelajaran as $mp){
      if($siswa->mapel()->wherePivot('mapel_id',$mp->id)->first()){
        $categories[] = $mp->nama;
        $data[]       = $siswa->mapel()->wherePivot('mapel_id',$mp->id)->first()->pivot->nilai;
      }
    }
    // dd($data);
    return view('siswa.profile',['siswa' => $siswa, 'matapelajaran' => $matapelajaran,'categories' => $categories,'data' => $data]);
  }

  public function addnilai(Request $request,$idsiswa)
  {
    $siswa = \App\Siswa::find($idsiswa);
    if($siswa->mapel()->where('mapel_id',$request->mapel)->exists()){
      return redirect('siswa/'.$idsiswa.'/profile')->with('error','Data nilai sudah ada!');
    }
    $siswa->mapel()->attach($request->mapel,['nilai' => $request->nilai]);
    return redirect('siswa/'.$idsiswa.'/profile')->with('sukses','Data nilai berhasil di input!');
  }

  public function deletenilai($idsiswa,$idmapel){
    $siswa = \App\Siswa::find($idsiswa);
    $siswa->mapel()->detach($idmapel);
    return redirect()->back()->with('sukses','Data nilai berhasil di hapus!');
  }

  public function exportExcel() 
    {
        return Excel::download(new SiswaExport, 'siswa.xlsx');
    }

    public function exportPdf() 
    {
      $siswa = \App\Siswa::all();
      $pdf = PDF::loadView('export.siswapdf', ['siswa' => $siswa]);
      return $pdf->download('siswa.pdf');
    }
}