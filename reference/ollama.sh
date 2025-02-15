# ---------------------------------------------------------------
# ollama linux reference
# ---------------------------------------------------------------

#  Source: https://blog.networkchuck.com/posts/is-deepseek-safe-to-run-locally/
docker run -d \
--gpus all \
-v ollama:/root/.ollama \
-p 11434:11434 \
--security-opt=no-new-privileges \
--cap-drop=ALL \
--cap-add=SYS_NICE \
--memory=8g \
--memory-swap=8g \
--cpus=4 \
--read-only \
--name ollama \
ollama/ollama

# Command that works on the jetson orin (ollama server)
sudo docker run -d --runtime=nvidia -v ollama:/root/.ollama -p 11434:11434 --security-opt=no-new-privileges --cap-drop=ALL --cap-add=SYS_NICE --memory=8g --memory-swap=8g --cpus=4 --read-only --name nollama ollama/ollama
2678425d11c92b0e5c9776ebd00fc2c0abb465eaf3d1f7659984256b321adaab

# Command to run in the nollama container (ollama cli)
sudo docker exec -it nollama ollama run deepseek-r1
sudo docker exec -it nollama bash

# Models that work on the jetson
ollama pull llama3.2:3b
ollama pull llama3.1:8b
ollama pull deepseek-r1:7b

# running openwebui in docker
sudo docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main