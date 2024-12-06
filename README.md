# ingressaAm

<h1>Instruções para Configuração do Ingressa AM</h1>
  <ol>
    <li>
      <h2>Baixar o Android Studio e Configurar</h2>
      <p>
        1. Acesse o site oficial do <a href="https://developer.android.com/studio" target="_blank">Android Studio</a> e faça o download da versão correspondente ao seu sistema operacional.
      </p>
      <p>
        2. Instale o Android Studio seguindo o assistente de instalação.
      </p>
      <p>
        3. Abra o Android Studio e configure o SDK do Android. Certifique-se de baixar as ferramentas recomendadas e os pacotes necessários para compilar projetos Flutter.
      </p>
    </li>
    <li>
      <h2>Baixar o Flutter</h2>
      <p>
        1. Acesse o site oficial do <a href="https://flutter.dev/docs/get-started/install" target="_blank">Flutter</a> e faça o download do SDK.
      </p>
      <p>
        2. Extraia os arquivos baixados para uma pasta no seu computador.
      </p>
      <p>
        3. Configure a variável de ambiente <code>PATH</code> para incluir o caminho do Flutter. No terminal, verifique a instalação com o comando: 
        <code>flutter doctor</code>.
      </p>
    </li>
    <li>
      <h2>Clonar o Projeto</h2>
      <p>
        1. Abra o terminal e navegue até a pasta onde deseja salvar o projeto.
      </p>
      <p>
        2. Execute o comando: <code>git clone https://github.com/seu-repositorio.git</code>.
      </p>
      <p>
        3. Após a clonagem, navegue para a pasta do projeto com: <code>cd nome-do-projeto</code>.
      </p>
    </li>
    <li>
      <h2>Instalar o JSON Server, JSON Server Auth e Express</h2>
      <p>
        1. Certifique-se de ter o <a href="https://nodejs.org/" target="_blank">Node.js</a> e o npm instalados no seu sistema.
      </p>
      <p>
        2. Execute o seguinte comando no terminal para instalar os pacotes globais:
        <br>
        <code>npm install -g json-server@0.17.0 json-server-auth@2.1.0 express</code>
      </p>
    </li>
    <li>
      <h2>Fazer o Pub Get</h2>
      <p>
        1. No terminal, dentro da pasta do projeto, execute: <code>flutter pub get</code>.
      </p>
      <p>
        2. Esse comando irá baixar todas as dependências necessárias para o projeto.
      </p>
    </li>
    <li>
      <h2>Localizar seu IPv4</h2>
      <p>
        1. Abra o terminal ou o prompt de comando e execute: <code>ipconfig</code>.
      </p>
      <p>
        2. Procure o endereço IPv4 listado sob a conexão de rede ativa. Geralmente terá um formato como <code>192.168.x.x</code>.
      </p>
    </li>
    <li>
      <h2>Iniciar o Servidor JSON Server</h2>
      <p>
        1. Navegue até a pasta <code>server</code> dentro do projeto.
      </p>
      <p>
        2. Execute o comando, substituindo <code>seu-ip</code> pelo endereço IPv4 obtido no passo anterior:
        <br>
        <code>json-server-auth --watch --host seu-ip db.json -r routes.json</code>
      </p>
      <p>
        3. O servidor estará em execução e poderá ser acessado pelo endereço: <code>http://seu-ip:3000</code>.
      </p>
    </li>
  </ol>
