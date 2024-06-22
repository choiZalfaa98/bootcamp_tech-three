$(document).ready(function() {
    // Event delegation untuk tombol "Edit"
    $('.valueTable').on('click', '.edit-btn', function() {
        var row = $(this).closest('tr');

        // Simpan nilai asli dari setiap kolom (kecuali tombol Edit)
        var originalValues = [];
        row.find('td:not(:last-child)').each(function() {
            var value = $(this).text().trim();
            originalValues.push(value);
        });

        // Loop through each column (except the last one which contains Edit button)
        row.find('td:not(:last-child)').each(function(index) {
            if (index === 0 || index === 4) {
                // Kolom ID Materi atau ID Kelas, tampilkan input type text
                $(this).html('<input type="text" class="edit-input" value="' + originalValues[index] + '">');
            } else {
                // Kolom lain, tampilkan input type text
                $(this).html('<input type="text" class="edit-input" value="' + originalValues[index] + '">');
            }
        });

        // Ganti tombol "Edit" menjadi tombol "Save" dan tambahkan tombol "Cancel"
        $(this).text('Save').addClass('save-btn').removeClass('edit-btn');

        // Nonaktifkan tombol "Edit" lainnya selama pengeditan baris ini
        $('.edit-btn').not('.save-btn').attr('disabled', true);
    });

    // Event delegation untuk tombol "Save"
    $('.valueTable').on('click', '.save-btn', function() {
        var row = $(this).closest('tr');

        // Ganti input field dengan nilai yang diedit ke dalam sel
        row.find('.edit-input').each(function() {
            var newValue = $(this).val().trim();
            $(this).parent('td').html('<span class="value">' + newValue + '</span>');
        });

        // Ganti tombol "Save" kembali menjadi tombol "Edit" dengan ikon edit
        row.find('.save-btn').html('<i class="fa-solid fa-pen-to-square"></i>').addClass('edit-btn').removeClass('save-btn');

        // Aktifkan kembali tombol "Edit" lainnya
        $('.edit-btn').attr('disabled', false);
    });
});

function toggleMenu() {
    subMenu.classList.toggle('open-menu');
}