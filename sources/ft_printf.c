/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: thakala <thakala@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/10 04:27:09 by thakala           #+#    #+#             */
/*   Updated: 2022/03/21 10:47:48 by thakala          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	get_next_format(char **format, t_format **format_code)
{
	char	*format_copy;
	char	*conversion_specifier_ptr;

	format_copy = format;
	conversion_specifier_ptr = ft_strpbrk(*format, g_conversion_specifier);
	if (conversion_specifier_ptr)
	{
		g_conversions[*conversion_specifier_ptr]();
	}
}

int	ft_printf(const char *format, ...)
{
	va_list		ap;
	t_format	format_code;
	t_str		tmp;

	va_start(ap, format);
	get_next_format(&format, &format_code);
	tmp = convert_character(&format_code, va_arg(ap, char));
	write(1, tmp.str, tmp.len);
	va_end(ap);
	return (0);
}
