/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dydado13 <dydado13@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/19 15:23:52 by dydado13          #+#    #+#             */
/*   Updated: 2023/12/20 22:51:46 by dydado13         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/pipex.h"

int	open_file(char *file, int in_or_out)
{
	int		res;

	if (in_or_out == 0)
		res = open(file, O_RDONLY, 0777);
	if (in_or_out == 1)
		res = open(file, O_WRONLY | O_CREAT | O_TRUNC, 0777);
	if (res == -1)
		exit(0);
	return (res);
}

char	*get_env(char *name, char **env)
{
	int		i;
	int		j;
	char	*sub;

	i = 0;
	while (env[i])
	{
		j = 0;
		while (env[i][j] && env[i][j] != '=')
			j++;
		sub = ft_substr(env[i], 0, j);
		if (ft_strcmp(sub, name) == 0)
		{
			free(sub);
			return (env[i] + j + 1);
		}
		free(sub);
		i++;
	}
	return (NULL);
}

void	ft_free_tab(char **str)
{
	int	i;

	i = -1;
	while (str[++i])
		free(str[i]);
	free(str);
}

char	*get_path(char *cmd, char **env)
{
	int		i;
	char	**allpath;
	char	*part_path;
	char	**s_cmd;
	char	*exec;

	i = -1;
	allpath = ft_split(get_env("PATH", env), ':');
	s_cmd = ft_split(cmd, ' ');
	while (allpath[++i])
	{
		part_path = ft_strjoin(allpath[i], "/");
		exec = ft_strjoin(part_path, s_cmd[0]);
		free(part_path);
		if (access(exec, F_OK | X_OK) == 0)
		{
			ft_free_tab(s_cmd);
			return (exec);
		}
		free(exec);
	}
	ft_free_tab(allpath);
	ft_free_tab(s_cmd);
	return (NULL);
}
