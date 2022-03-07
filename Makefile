# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thakala <thakala@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/10 04:31:09 by thakala           #+#    #+#              #
#    Updated: 2022/03/06 05:11:14 by thakala          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

LIBFT_NAME = libft

LIBFT_DIR = $(LIBRARIES)/libft

LIBFT_PATH = $(LIBFT_DIR)/libft.a

LIBFT_OBJECT_PATHS = $(addprefix $(LIBFT_DIR), \
	ft_abs.o \
	ft_atoi.o \
	ft_bzero.o \
	ft_isalnum.o \
	ft_isalpha.o \
	ft_isascii.o \
	ft_isdigit.o \
	ft_isprint.o \
	ft_isspace.o \
	ft_itoa.o \
	ft_lstadd.o \
	ft_lstdel.o \
	ft_lstdelone.o \
	ft_lstiter.o \
	ft_lstmap.o \
	ft_lstnew.o \
	ft_lstpop.o \
	ft_memalloc.o \
	ft_memccpy.o \
	ft_memchr.o \
	ft_memcmp.o \
	ft_memcpy.o \
	ft_memdel.o \
	ft_memdup.o \
	ft_memjoin.o \
	ft_memmove.o \
	ft_memrplc.o \
	ft_memset.o \
	ft_putchar.o \
	ft_putchar_fd.o \
	ft_putendl.o \
	ft_putendl_fd.o \
	ft_putnbr.o \
	ft_putnbr_fd.o \
	ft_putstr.o \
	ft_putstr_fd.o \
	ft_sign.o \
	ft_strcat.o \
	ft_strchr.o \
	ft_strclr.o \
	ft_strcmp.o \
	ft_strcpy.o \
	ft_strcspn.o \
	ft_strdel.o \
	ft_strdup.o \
	ft_strequ.o \
	ft_striter.o \
	ft_striteri.o \
	ft_strjoin.o \
	ft_strlcat.o \
	ft_strlcpy.o \
	ft_strlen.o \
	ft_strmap.o \
	ft_strmapi.o \
	ft_strncat.o \
	ft_strncmp.o \
	ft_strncpy.o \
	ft_strnequ.o \
	ft_strnew.o \
	ft_strnstr.o \
	ft_strpbrk.o \
	ft_strrchr.o \
	ft_strsep.o \
	ft_strsplit.o \
	ft_strspn.o \
	ft_strspnsep.o \
	ft_strstr.o \
	ft_strsub.o \
	ft_strtrim.o \
	ft_tolower.o \
	ft_toupper.o)

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

FT_LIB = ft

CC = clang
CFLAGS = -Wall -Wextra -Werror

.PHONY: all
all: $(NAME)

$(NAME): .pre_requisites $(O_PATHS) Makefile
	touch .pre_requisites
	ar rcs $(NAME) $(O_PATHS)

$(O_PATHS): $(OBJECTS)/%.o:$(SOURCES)/%.c $(H_PATHS) Makefile
	$(CC) $(CFLAGS) $(INCLUSIONS) -c $< -o $@

.pre_requisites: $(LIBFT_NAME) $(FOLDER_LIST) $(H_PATHS) $(C_PATHS)

.PHONY: $(LIBFT_NAME)
$(LIBFT_NAME):
	make -C $(LIBFT_DIR)

$(FOLDER_LIST):
	mkdir -p $@

$(H_PATHS):
	touch $@

$(C_PATHS):
	touch $@

.PHONY: clean
clean:
#	/bin/rm -f $(OBJECT_PATHS)
#	make -C $(LIBFT_DIR) clean

.PHONY: fclean
fclean:
#	/bin/rm -f $(NAME)
#	make -C $(LIBFT_DIR) fclean

.PHONY: re
re: fclean all

## DEBUG
#
DEBUG_NAME = $(DEBUG_OBJECTS)/libftprintf.a
DEBUG_SUFFIX = -debug.o
DEBUG_OBJECT_PATHS = $(addsuffix $(DEBUG_SUFFIX), \
	$(addprefix $(DEBUG_OBJECTS)/, $(FILES)))
DEBUG_FLAGS = $(CFLAGS) -g -Wconversion

.PHONY: debug
debug: $(DEBUG_NAME)

$(DEBUG_NAME): .debug_pre_requisites $(DEBUG_OBJECT_PATHS) Makefile
	touch .debug_pre_requisites
	ar rcs $(DEBUG_NAME) $(DEBUG_OBJECT_PATHS)

.debug_pre_requisites: $(LIBFT_NAME) $(FOLDER_LIST) $(H_PATHS) $(C_PATHS)

$(DEBUG_OBJECT_PATHS): \
	$(DEBUG_OBJECTS)/%$(DEBUG_SUFFIX):$(SOURCES)/%.c $(H_PATHS) Makefile
	$(CC) $(DEBUG_FLAGS) $(INCLUSIONS) -c $< -o $@
#
## DEBUG
