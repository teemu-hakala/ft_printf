/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   redirections.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: thakala <thakala@student.hive.fi>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/15 11:07:27 by thakala           #+#    #+#             */
/*   Updated: 2022/02/20 13:06:33 by thakala          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "helpers.h"

void	start_redirection(const char *filename, int *fd)
{
	*fd = dup(STDOUT_FILENO);
}

void	reset_redirection()
{
	
}
