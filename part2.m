%nomer 7%
pkg load image;

% 1. Baca gambar (bisa berwarna)
img = imread('blabak.jpeg');  % Ganti sesuai file kamu

% 2. Tentukan sudut rotasi (derajat), misal 90 derajat
angle = 90;

% 3. Rotasi gambar dengan interpolasi bilinear
rotated_img = imrotate(img, angle, 'bilinear', 'crop');

% 4. Perbesar citra, misal skala 2x
scale_factor = 2;
resized_img = imresize(rotated_img, scale_factor, 'bilinear');

% 5. Tampilkan gambar asli dan hasil rotasi + perbesaran
figure;

subplot(1,2,1);
imshow(img);
title('Gambar Asli');

subplot(1,2,2);
imshow(resized_img);
title(['Rotasi ', num2str(angle), '° + Perbesaran ', num2str(scale_factor), 'x']);

%8%
pkg load image;

% 1. Baca dan ubah ke grayscale
img = imread('bromo.jpg');  % Ganti nama file jika perlu
gray_img = rgb2gray(img);

% 2. Ukuran gambar
[rows, cols] = size(gray_img);
[X, Y] = meshgrid(1:cols, 1:rows);

% ----------------- Ripple Effect -----------------
amplitude = 10;   % besar gelombang
frequency = 0.05; % frekuensi gelombang

% Koordinat ripple
X_ripple = X + amplitude * sin(2 * pi * Y * frequency);
Y_ripple = Y;

% Interpolasi ripple
ripple_img = interp2(X, Y, double(gray_img), X_ripple, Y_ripple, 'linear', 0);
ripple_img = uint8(ripple_img);

% ----------------- Twirl Effect -----------------
cx = cols / 2;
cy = rows / 2;
radius = min(cx, cy);
angle_max = pi;  % rotasi maksimum (180 derajat)

[Xt, Yt] = meshgrid(1:cols, 1:rows);
dx = Xt - cx;
dy = Yt - cy;
r = sqrt(dx.^2 + dy.^2);
theta = atan2(dy, dx) + (angle_max * (radius - r) ./ radius) .* (r < radius);

X_twirl = cx + r .* cos(theta);
Y_twirl = cy + r .* sin(theta);

% Interpolasi twirl
twirl_img = interp2(X, Y, double(gray_img), X_twirl, Y_twirl, 'linear', 0);
twirl_img = uint8(twirl_img);

% ----------------- Tampilkan -----------------
figure;
subplot(1,3,1);
imshow(gray_img);
title('Citra Asli');

subplot(1,3,2);
imshow(ripple_img);
title('Efek Ripple');

subplot(1,3,3);
imshow(twirl_img);
title('Efek Twirl');

%9%
pkg load image;

% 1. Baca gambar
img = imread('eropa.jpg');  % Ganti nama file jika perlu

% 2. Konversi ke grayscale (opsional, jika ingin fokus pada struktur)
gray_img = rgb2gray(img);

% 3. Buat kernel Gaussian
kernel_size = 5;        % Ukuran kernel (harus ganjil, misalnya 3, 5, 7)
sigma = 1.0;            % Standar deviasi Gaussian
gauss_kernel = fspecial('gaussian', kernel_size, sigma);

% 4. Terapkan filter Gaussian
blurred_img = imfilter(gray_img, gauss_kernel, 'symmetric');

% 5. Tampilkan hasil
figure;

subplot(1,2,1);
imshow(gray_img);
title('Citra Asli');

subplot(1,2,2);
imshow(blurred_img);
title(['Citra Setelah Gaussian Blur (', num2str(kernel_size), 'x', num2str(kernel_size), ', \sigma=', num2str(sigma), ')']);

%10%
pkg load image;

% 1. Baca gambar
img = imread('bangunan.jpg');  % Ganti nama file jika perlu
gray_img = rgb2gray(img);           % Gunakan grayscale untuk kesederhanaan

% 2. Ukuran gambar
[rows, cols] = size(gray_img);
[X, Y] = meshgrid(1:cols, 1:rows);

% 3. Parameter transformasi
theta = deg2rad(30);  % Rotasi 30 derajat
scale_x = 1.2;        % Skala horizontal (perbesar)
scale_y = 0.8;        % Skala vertikal (perkecil)
tx = 50;              % Translasi x (geser kanan)
ty = 30;              % Translasi y (geser bawah)

% 4. Matriks transformasi affine (gabungan)
T = [scale_x*cos(theta), -sin(theta), tx;
     sin(theta), scale_y*cos(theta), ty;
     0, 0, 1];

% 5. Buat citra output
new_rows = rows + abs(ty) + 100;
new_cols = cols + abs(tx) + 100;
[X_out, Y_out] = meshgrid(1:new_cols, 1:new_rows);

% Invers transformasi (untuk backward mapping)
T_inv = inv(T);

% Hitung koordinat asal dari piksel target
coords = [X_out(:)'; Y_out(:)'; ones(1, numel(X_out))];
src_coords = T_inv * coords;

X_src = reshape(src_coords(1, :), size(X_out));
Y_src = reshape(src_coords(2, :), size(Y_out));

% 6. Interpolasi hasil transformasi
transformed_img = interp2(double(gray_img), X_src, Y_src, 'linear', 0);
transformed_img = uint8(transformed_img);

% 7. Tampilkan citra asli dan hasil transformasi
figure;
subplot(1,2,1);
imshow(gray_img);
title('Citra Asli');

subplot(1,2,2);
imshow(transformed_img);
title('Hasil Transformasi Affine (Rotasi + Skala + Translasi)');

