require("chatgpt").setup({
	openai_params = {
		model = "gpt-3.5-turbo",
		frequency_penalty = 0,
		presence_penalty = 0,
		max_tokens = 2048,
		temperature = 0,
		top_p = 1,
		n = 1,
	},
})
