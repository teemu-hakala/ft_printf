/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: thakala <thakala@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/10 05:48:32 by thakala           #+#    #+#             */
/*   Updated: 2022/02/23 13:03:32 by thakala          ###   ########.fr       */
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


typedef struct s_format
{
	uint64_t	flags;
	uint64_t	minimum_field_width;
	uint64_t	precision;
	uint64_t	length;
	uint64_t	conversion_specifier;
}	t_format;

typedef uint64_t	t_conversion(const t_format format, void *argument);

static const char	g_conversion_specifier[] = "cspdiouxXf";

static const t_conversion * g_conversions[] = {
	
}

#endif
