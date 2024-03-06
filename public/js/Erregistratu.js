document.addEventListener('DOMContentLoaded', function () {
    var form = document.querySelector('.form-register');
    var izenaInput = document.getElementById('Izena');

    form.addEventListener('submit', function (event) {
        var izenaValue = izenaInput.value.trim();

        // Expresio erregularra, letrak bakarrik onartuko ditu
        var soloLetras = /^[A-Za-z]+$/;

        if (!soloLetras.test(izenaValue)) {
            alert('Izena bakarrik letraz osatua izan behar da.');
            event.preventDefault(); // Formularioa ez bidali
        }
    });
});
