# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thakala <thakala@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/10 04:31:09 by thakala           #+#    #+#              #
#    Updated: 2022/03/02 13:31:03 by thakala          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

LIBFT_LIB = libft.a

LIBFT_DIR = $(LIBRARIES)


SOURCES = sources
OBJECTS = objects
INCLUDES = includes
LIBRARIES = libraries

.PHONY: all
all: $(NAME)

$(NAME): .pre_requisites $(OBJECT_PATHS) Makefile
	touch .pre_requisites
	ar rcs $(OBJECT_PATHS)

$(OBJECT_PATHS): $(OBJECTS)/%.o:$(SOURCES)/%.c $(H_PATHS) Makefile
	$(CC) $(CFLAGS) $(INCLUSIONS) -c $< -o $@

.pre_requisites: $(FOLDER_LIST) $(H_PATHS) $(C_PATHS)

$(FOLDER_LIST):
	mkdir -p $@

$(H_PATHS):
	touch $@

$(C_PATHS):
	touch $@

.PHONY: clean
clean:
#	/bin/rm -f $(OBJECT_PATHS)

.PHONY: fclean
#	/bin/rm -f $(NAME)

.PHONY: re
re: fclean all
