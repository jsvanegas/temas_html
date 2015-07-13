(function () {
    $.ajax({
        url: "palabras.ashx",
        success: function (data) {
            var item = JSON.parse(data);
            var espacio = 0;

            if (typeof (Storage) !== "undefined") {
                localStorage.palabra = item.palabra;
            } else {
                console.log('Error al guardar el localstorage');
            }

            for (var i in item.palabra) {
                if (item.palabra.charAt(i) !== " ") {
                    $("div#cajas").append(
                    $('<input>')
                        .attr({
                            id: 'txt' + i,
                            type: 'text'
                        })
                        .css('margin-left', espacio)
                        .addClass('cajaCreada')
                    //.val(item.palabra.charAt(i))
                     );
                    espacio = 0;
                } else {
                    espacio = 20;
                }
            }

            $('h3#turnos').attr('data-turnos', "8").text('Turnos: 8/8');
        },
        error: function (data) { console.log(data) }
    });

    var cargarImagen = function (x) {
        console.log(x);
        $('div#divImg img').attr({
            src: 'assets/ahocardo' + ((8 - x) + 1) + '.png',
            alt: 'turnos ' + x + ' de 8'
        })
    }

    cargarImagen(8);

    $('input#probarBtn').on('click', function () {
        var char = $(this).prev().val();

        $('#pruebasLst').append($('<option>').attr('value', char).text(char));

        var goles = 0;
        for (var i in localStorage.palabra) {
            if (char === localStorage.palabra.charAt(i)) {
                $('div#cajas input#txt' + i).val(char);
                goles++;
            }
        }
        if (goles == 0) {
            var h3 = $('h3#turnos');
            _turnos = parseInt(h3.attr('data-turnos'));
            _turnos = _turnos - 1;
            h3.attr('data-turnos', _turnos).text('Turnos: ' + _turnos + '/8');
            cargarImagen(_turnos);
        }
    });

})();