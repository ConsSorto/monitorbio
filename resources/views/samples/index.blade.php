@extends('layouts.principal')

@section('pagecontent')

    <div class="row">
        <div class="col-lg-12 mb-2 mt-2">
            <div class="pull-left">
                <h2>Muestras</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-success" href="{{ route('samples.create') }}"> Crear nueva muestra </a>
            </div>
        </div>
    </div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif

    <table class="table table-bordered">
        <tr>
            <th>#</th>
            <th>Codigo</th>
            <th>Nombre</th>
            <th>Region Forestal</th>
            <th>Departamento</th>
            <th>Municipio</th>
            <th>Lugar</th>
            <th>UTMX</th>
            <th>UTMY</th>
            <th>MSMN</th>
            <th width="280px">Action</th>
        </tr>
        @foreach ($samples as $sample)
            <tr>
                <td>{{ $sample->id }}</td>
                <td>{{ $sample->code }}</td>
                <td>{{ $sample->name }}</td>
                <td>{{ $sample->forest_region->name }}</td>
                <td>{{ $sample->department->name }}</td>
                <td>{{ $sample->municipality->name }}</td>
                <td>{{ $sample->place }}</td>
                <td>{{ $sample->utmx }}</td>
                <td>{{ $sample->utmy }}</td>
                <td>{{ $sample->msmn }}</td>
                <td>
                    <form action="{{ route('samples.destroy',$sample->id) }}" method="POST">

                        <a class="btn btn-info" href="{{ route('samples.show',$sample->id) }}">Detalles</a>

                        <a class="btn btn-primary" href="{{ route('samples.edit',$sample->id) }}">Editar</a>

                        @csrf
                        @method('DELETE')

                        <button type="submit" class="btn btn-danger show_confirm" >Borrar</button>
                    </form>
                </td>
            </tr>
        @endforeach
    </table>

    {!! $samples->links() !!}

    <script type="text/javascript">

        $('.show_confirm').click(function(event) {
            var form =  $(this).closest("form");
            event.preventDefault();
            swal({
                title: `Estas seguro de borrar esta muestra?`,
                text: "Si borras esta muestra no podras ver los datos de nuevo.",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                        form.submit();
                    }
                });
        });

    </script>
@endsection
