% FILBATAS Melakukan operasi ketetanggan piksel
% menggunakan filter batas dengan beberapa variasi
F = imread('naruto tim 7.jpg');
Ukuran = size(F);
tinggi = Ukuran(1);
lebar = Ukuran(2);

figure(1);

for i = 1:5
    G = F; % Reset citra untuk setiap variasi filter

    for baris=2 : tinggi-1
        for kolom=2 : lebar-1
            neighborhood = [F(baris-1, kolom-1), F(baris-1, kolom), F(baris-1, kolom+1), ...
                            F(baris, kolom-1),   F(baris, kolom),   F(baris, kolom+1), ...
                            F(baris+1, kolom-1), F(baris+1, kolom), F(baris+1, kolom+1)];

            minPiksel = min(neighborhood);
            maksPiksel = max(neighborhood);

            % Variasi filter batas berdasarkan iterasi ke-i
            if i == 1
                % Filter 1: Ganti dengan minimum
                if F(baris, kolom) < minPiksel
                    G(baris, kolom) = minPiksel;
                end
            elseif i == 2
                % Filter 2: Ganti dengan maksimum
                if F(baris, kolom) > maksPiksel
                    G(baris, kolom) = maksPiksel;
                end
            elseif i == 3
                % Filter 3: Ganti dengan rata-rata minimum dan maksimum
                if F(baris, kolom) < minPiksel || F(baris, kolom) > maksPiksel
                    G(baris, kolom) = (minPiksel + maksPiksel) / 2;
                end
            elseif i == 4
                % Filter 4: Ganti dengan nilai antara piksel dan minimum
                if F(baris, kolom) < minPiksel
                    G(baris, kolom) = 0.5 * F(baris, kolom) + 0.5 * minPiksel;
                end
            elseif i == 5
                % Filter 5: Ganti dengan nilai antara piksel dan maksimum
                if F(baris, kolom) > maksPiksel
                    G(baris, kolom) = 0.5 * F(baris, kolom) + 0.5 * maksPiksel;
                end
            else
                G(baris, kolom) = F(baris, kolom);
            end
        end
    end
    subplot(1, 5, i);
    imshow(G);
    title(['Filter Batas ', num2str(i)]);
end

clear;
