NAME = cub3D

CC = clang

CFLAGS = -O3 -Wall -Wextra -Werror

MLX = mlxopengl

LXFLAGS = -lmlx -framework OpenGL -framework AppKit

HEADER = cub3d.h

B_HEADER = cub3d_bonus.h

SRC = cub3d \
	parse \
	parse_map \
	parse_tools \
	parse_check \
	gnl \
	key \
	screen \
	screen_col \
	sprite \
	bitmap \
	tools \

FIL = $(addsuffix .c, $(addprefix src/, $(SRC)))

OBJ = $(FIL:.c=.o)

BIN = $(addsuffix .o, $(SRC))

B_HEADER = cub3d_bonus.h

B_SRC = screen_row \
	sprite_draw \
	key_more \
	weapons \
	enemy \
	door \
	hud \


.PHONY: all clean fclean re bonus test sqr bmp err inv norm

all: $(NAME)

$(NAME): $(OBJ)
	@echo "\n\033[0;33mCompiling..."
	$(CC) -o $(NAME) -L $(MLX) $(LXFLAGS) $(OBJ)
	@echo "\033[0m"

clean:
	@echo "\033[0;31mCleaning..."
	rm -rf $(OBJ) $(B_OBJ)
	rm -f bitmap.bmp
	@echo "\033[0m"

fclean: clean
	@echo "\033[0;31mRemoving executable..."
	rm -f $(NAME)
	@echo "\033[0m"

re: fclean all

