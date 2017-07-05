library(ggplot2)
library(hexSticker)
library(OEIS.R)

file_name <- "OEIS.R-sticker.png"
file_path <- "sticker/"
file_path <- paste0(file_path, file_name)
file_path

id <- "A001615"
A001615 <- OEIS.R::OEIS_sequence(id)

dedekind_psi <- A001615$bfile$data[1:200, ]

(ggplot(dedekind_psi,
            ggplot2::aes(x = n,
                y = as.numeric(A001615)), color = n) +
  geom_point(size = 1, alpha = 0.5, color = "white") +
  theme_void() +
  theme_transparent()) %>%

  hexSticker::sticker(
    package = "OEIS.R",
    # Font size for package name.
    p_size = 20,
    s_x = 1,
    s_y = .75,
    s_width = 1.3,
    s_height = 1,
    # Color to fill hexagon.
    h_fill = "steelblue4",
    # Color for hexagon border.
    h_color	= "gold",
    filename = file_path
  )
