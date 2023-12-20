/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dylmarti <dylmarti@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/05 20:44:16 by dylmarti          #+#    #+#             */
/*   Updated: 2023/12/20 19:00:22 by dylmarti         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft.h"

static int	wd_count(char *s, char c)
{
	int	i;
	int	wd;
	int	trigg;

	i = 0;
	wd = 0;
	trigg = -1;
	while (s && s[i])
	{
		while (s[i] == c)
			i++;
		if (s[i] != c && s[i])
		{
			wd++;
			while ((s[i] != c || trigg == 1) && s[i] )
			{
				if (s[i] == '\'')
					trigg *= -1;
				i++;
			}
		}
	}
	return (wd);
}

static char	**is_in(char const *s, char c, char **result)
{
	int	i;
	int	j;
	int	word;
	int	trigg;

	i = 0;
	word = -1;
	trigg = -1;
	while (s[i])
	{
		while (s[i] && s[i] == c)
			i++;
		j = -1;
		while (s[i + ++j] && (s[i + j] != c || trigg == 1))
			if (s[i + j] == '\'')
				trigg *= -1;
		if (j)
		{
			result[++word] = ft_calloc(sizeof(char), j + 1);
			ft_strlcpy(result[word], &(s[i]), j + 1);
		}
		i = i + j;
	}
	return (result);
}

char	**ft_split(char const *s, char c)
{
	char	**result;

	result = (char **)ft_calloc(sizeof(char *), wd_count((char *)s, c) + 1);
	if (!result)
		return (NULL);
	return (is_in(s, c, result));
}

// int	main(void)
// {
// 	char	str[] = "tr ' ' '.'";
// 	char	sep = ' ';
// 	char	**result;
// 	int		i;

// 	i = 0;
// 	printf("wd_count%i\n", wd_count(str, sep));
// 	result = ft_split(str, sep);
// 	while (result && result[i])
// 	{
// 		printf("%s\n", result[i]);
// 		i++;
// 	}
// 	return (0);
// }

// int main(void)
// {
// 	char	str[] = "bonjour te st  vdrv   fef";
// 	char	sep = ' ';
	
// 	printf("%i\n", wd_count(str, sep));
// 	while 
// 	return (0);
// }
