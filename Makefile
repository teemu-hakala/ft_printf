# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thakala <thakala@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/10 04:31:09 by thakala           #+#    #+#              #
#    Updated: 2022/03/03 12:29:58 by thakala          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

LIBFT_NAME = libft

LIBFT_DIR = $(LIBRARIES)/libft

FILES = \
	convert_character \
	convert_float \
	convert_hexadecimal \
	convert_octal \
	convert_pointer \
	convert_signed \
	convert_string \
	convert_unsigned \
	ft_printf

SOURCES = sources
OBJECTS = objects
INCLUDES = includes
LIBRARIES = libraries
DEBUG_OBJECTS = debug_objects

FOLDER_LIST = \
	$(SOURCES) \
	$(OBJECTS) \
	$(INCLUDES) \
	$(LIBRARIES) \
	$(DEBUG_OBJECTS)

H_FILES = ft_printf

C_PATHS = $(addsuffix .c, $(addprefix $(SOURCES)/, $(FILES)))
H_PATHS = $(addsuffix .h, $(addprefix $(INCLUDES)/, $(H_FILES)))
INCLUSIONS = $(foreach inc, $(INCLUDES), -I $(inc))
O_PATHS = $(addsuffix .o, $(addprefix $(OBJECTS)/, $(FILES)))

CC = clang
CFLAGS = -Wall -Wextra -Werror

.PHONY: all
all: $(NAME)

$(NAME): .pre_requisites $(OBJECT_PATHS) Makefile
	touch .pre_requisites
	ar rcs $(NAME) $(OBJECT_PATHS)

$(OBJECT_PATHS): $(OBJECTS)/%.o:$(SOURCES)/%.c $(H_PATHS) Makefile
	$(CC) $(CFLAGS) $(INCLUSIONS) -c $< -o $@

.pre_requisites: $(LIBFT_NAME) $(FOLDER_LIST) $(H_PATHS) $(C_PATHS)

.PHONY: $(LIBFT_NAME)
$(LIBFT_NAME):
	make -C libraries/libft

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

## DEBUG
#
DEBUG_NAME = $(DEBUG_OBJECTS)/libftprintf.a
DEBUG_SUFFIX = -debug.o
DEBUG_OBJECT_PATHS = $(addsuffix $(DEBUG_SUFFIX), \
	$(addprefix $(DEBUG_OBJECTS)/, $(FILES)))
DEBUG_FLAGS = $(CFLAGS) -g -Wconversion

debug: $(DEBUG_NAME)

$(DEBUG_NAME): .debug_pre_requisites $(DEBUG_OBJECT_PATHS) Makefile
	touch .debug_pre_requisites
	ar rcs $(DEBUG_NAME) $(DEBUG_OBJECT_PATHS)

.debug_pre_requisites: $(LIBFT_NAME) $(FOLDER_LIST) $(H_PATHS) $(C_PATHS)

$(DEBUG_OBJECT_PATHS): $(DEBUG_OBJECTS)/%$(DEBUG_SUFFIX):$(SOURCES)/%.c $(H_PATHS) Makefile
	$(CC) $(DEBUG_FLAGS) $(INCLUSIONS) -c $< -o $@
#
## DEBUG
