#────────────────────────────╮
NAME	= pipex
#────────────────────────────╯

#---------	FUNCTIONS -----------
#───────────────────────────────╲
FUNC	= pipex.c utils.c
#───────────────────────────────╱

#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃					  PATH 		     			 ┃
#┗━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━┛
#━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━

OBJS_DIR	=	objs/
SRCS_DIR	=	src/
LIBFT		= ./libft/libft.a
LIBFT_PATH	= ./libft

#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃					   OBJS	 		     		 ┃
#┗━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━┛
#━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━


#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃					   SRCS	 		     		 ┃
#┗━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━┛
#━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━

OBJS	= $(addprefix $(OBJS_DIR), $(FUNC:.c=.o))
SRCS	= $(addprefix $(SRCS_DIR), $(FUNC))


#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃					  Flags 		     		 ┃
#┗━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━┛
#━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━

CC			= gcc
RM			= rm -rf
CFLAGS		= -Wall -Wextra -Werror
INCLUDE		= -I. -Ilibft


#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃				   	  RULES 		     		 ┃
#┗━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━┛
#━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━

all:		message message_all $(NAME) message_success

make_OBJS_DIR	:
	@mkdir -p $(OBJS_DIR)

$(LIBFT): $(shell make -C $(LIBFT_PATH) -q libft.a)
	@make -C $(LIBFT_PATH) > /dev/null

clean:		message message_clean
	@$(RM) $(OBJS_DIR)
	@make -C $(LIBFT_PATH) clean > /dev/null
		
fclean:		message message_fclean
	@$(RM) $(OBJS_DIR)
	@$(RM) $(NAME)
	@make -C $(LIBFT_PATH) fclean > /dev/null
	
fclean_re:	message message_re
	@$(RM) $(OBJS_DIR)
	@$(RM) $(NAME)
	@make -C $(LIBFT_PATH) re > /dev/null
	
re:			message fclean_re $(NAME) message_success

#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃				   COMPILATION		     		 ┃
#┗━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━┛
#━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$(NAME):	make_OBJS_DIR $(OBJS) $(LIBFT)
	@$(CC) $(CFLAGS) $(OBJS) $(LIBFT) -o $(NAME)
$(OBJS_DIR)%.o : $(SRCS_DIR)%.c
	@$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@
	@echo "$(COLOUR_OK)[✔] $(COLOUR_BLUE)Just compiled $<$ $(NO_COLOUR)"

#┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
#┃				   	  					 MESSAGES 	        					     		 ┃
#┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

message_success:
	@echo "$(COLOUR_OK)┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$(NO_COLOUR)"
	@echo "$(COLOUR_OK)┃ Compilation Success !!! : Creating $(NAME)	┃$(NO_COLOUR)"
	@echo "$(COLOUR_OK)┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$(NO_COLOUR)"

message_all:
	@echo "$(COLOUR_OK)[✔] $(COLOUR_RED)all\n$(NO_COLOUR)"

message_clean:
	@echo "$(COLOUR_OK)[✔] $(COLOUR_RED)clean\n$(NO_COLOUR)"

message_fclean:
	@echo "$(COLOUR_OK)[✔] $(COLOUR_RED)fclean\n$(NO_COLOUR)"
	@echo "$(COLOUR_OK)[✔] $(COLOUR_BLUE)Removed - $(NAME)\n$(NO_COLOUR)"

message_re:
	@echo "$(COLOUR_OK)[✔] $(COLOUR_RED)re\n$(NO_COLOUR)"

message:
	@printf "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	@printf "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	@printf "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	@printf "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	@printf "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	@tput cup init
	@echo "$(COLOUR_GREEN)██████████████████████████████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)██████████████████████████████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)██████████████████████████████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)██████████████████████████████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)███████$(COLOUR_BLACK)████$(COLOUR_GREEN)████████████$(COLOUR_BLACK)████$(COLOUR_GREEN)███████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)█████$(COLOUR_BLACK)██$(COLOUR_GREEN)████$(COLOUR_BLACK)██$(COLOUR_GREEN)████████$(COLOUR_BLACK)██$(COLOUR_GREEN)████$(COLOUR_BLACK)██$(COLOUR_GREEN)█████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)██████████████████████████████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)██████████████████████████████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)█████████$(COLOUR_BLACK)██████████████$(COLOUR_GREEN)███████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)█████████$(COLOUR_BLACK)██$(COLOUR_RED)██████████$(COLOUR_BLACK)██$(COLOUR_GREEN)███████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)███████████$(COLOUR_BLACK)██$(COLOUR_RED)████████$(COLOUR_BLACK)██$(COLOUR_GREEN)███████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)███████████$(COLOUR_BLACK)██$(COLOUR_RED)████████$(COLOUR_BLACK)██$(COLOUR_GREEN)███████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)█████████████$(COLOUR_BLACK)████████$(COLOUR_GREEN)█████████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)██████████████████████████████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)██████████████████████████████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)██████████████████████████████████$(NO_COLOUR)"
	@echo "$(COLOUR_GREEN)██████████████████████████████████$(NO_COLOUR)"
	@echo "\n\n$(COLOUR_OK)    ...MAKEFILE BY DYDADO13...\n$(NO_COLOUR)"
	@echo "Name	:	$(NAME)"
	@echo "Author	:	dylmarti, Dylan Martinez"
	@echo "Compil	:	cc"
	@echo "Flags	:	-Wall -Werror -Wextra\n"

#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#============ Colours ============

COLOUR_BLUE		= \033[34m
COLOUR_GREEN	= \033[90m
COLOUR_BLACK	= \033[30m
COLOUR_RED		= \033[31m
COLOUR_OK		= \033[32m
COLOUR_BAD		= \033[31m
COLOUR_CYAN		= \033[36m
NO_COLOUR		= \033[0m
