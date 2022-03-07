/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: thakala <thakala@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/10 05:48:32 by thakala           #+#    #+#             */
/*   Updated: 2022/03/06 05:24:19 by thakala          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H
# include <unistd.h>
# include <stdlib.h>
# include <stdarg.h>

# define FLAG_OCTOTHORPE '#'
# define FLAG_ZERO '0'
# define FLAG_LEFT_ALIGN '-'
# define FLAG_EXPLICIT_PLUS '+'
# define FLAG_PLUS_SPACE ' '
# define FLAG_LOCALE_THOUSANDS '\''

# define MFW_ASTERISK '*'

typedef struct s_str
{
	char		*str;
	uint64_t	len;
}	t_str;

typedef struct s_format
{
	uint64_t	flags;
	uint64_t	minimum_field_width;
	uint64_t	precision;
	uint64_t	length;
	uint64_t	conversion_specifier;
}	t_format;

typedef uint64_t			t_conversion(const t_format *format, \
	void *argument);

static const char			g_conversion_specifier[] = "cspdiouxXf";

int							ft_printf(const char *format, ...);
t_str						convert_character(const t_format *format, \
	void *argument);
t_str						convert_string(const t_format *format, \
	void *argument);
t_str						convert_pointer(const t_format *format, \
	void *argument);
t_str						convert_signed(const t_format *format, \
	void *argument);
t_str						convert_octal(const t_format *format, \
	void *argument);
t_str						convert_unsigned(const t_format *format, \
	void *argument);
t_str						convert_hexadecimal(const t_format *format, \
	void *argument);
t_str						convert_float(const t_format *format, \
	void *argument);

static t_conversion			*g_conversions[] = {
	convert_character,
	convert_string,
	convert_pointer,
	convert_signed,
	convert_octal,
	convert_unsigned,
	convert_hexadecimal,
	convert_float
};

#endif
