# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: flbartol <flbartol@42.student.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/27 12:56:28 by flbartol          #+#    #+#              #
#    Updated: 2019/01/06 18:38:34 by flbartol         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: all, $(NAME), clean, fclean, re

NAME = #insert name of the executable

NOC=\033[0m	  #Reset text
OKC=\033[32m  #Green
ERC=\033[31m  #Red
WAC=\033[33m  #Yellow

CC = gcc
CC_FLAGS = -Wall -Werror -Wextra

SRC_PATH = srcs/     #change if necessary
LFT_PATH = libft/    #change if necessary
INC_PATH = includes/ #change if necessary
OBJ_PATH = objects/  #change if necessary

SRC = $(addprefix $(SRC_PATH),$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))
INC = $(addprefix -I,$(INC_PATH))

OBJ_NAME = $(SRC_NAME:.c=.o)

INC_NAME = #insert header.h

SRC_NAME = #insert srcs.c

all: $(NAME)

$(OBJ_PATH):
	@mkdir $@

$(NAME): $(OBJ_PATH) $(OBJ)
	@echo
	@make -C $(LFT_PATH)
	@$(CC) -o $(NAME) $(OBJ) -lm -L $(LFT_PATH) -lft
	@echo "$(OKC)$(NAME):\t\t$(NAME) ready$(NOC)"
	@echo "======"

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@$(CC) $(CC_FLAGS) -o $@ -c $< $(INC)
	@echo -n =

clean:
	@make -C $(LFT_PATH) clean
	@rm -rf $(OBJ_PATH)
	@echo "$(WAC)$(NAME):\t\tRemoving OBJ path: ./obj/$(NOC)"

fclean: clean
	@make -C $(LFT_PATH) fclean
	@rm -f $(NAME)
	@echo "$(WAC)$(NAME):\t\tRemoving $(NAME) executable$(NOC)"

re: fclean all
