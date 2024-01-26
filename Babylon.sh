#!/bin/bash

# 安装基础环境
# 安装go
sudo rm -rf /usr/local/go;
curl https://dl.google.com/go/go1.21.5.linux-amd64.tar.gz | sudo tar -C/usr/local -zxvf - ;
cat <<'EOF' >>$HOME/.bashrc
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
EOF
source $HOME/.bashrc

# 安装完成后运行以下命令查看版本
go version

# 安装其他必要的环境
sudo apt-get update -y
sudo apt-get install curl build-essential jq git lz4 -y;

# 下载源代码并编译
cd
git clone https://github.com/babylonchain/babylon.git
cd babylon
git checkout v0.7.2
make install

# 安装完成后可以运行 babylond version 检查是否安装成功。
# 显示应为 v0.7.2

# 运行节点
# 初始化节点
read -p "请输入你的节点名: " moniker
babylond init $moniker --chain-id=bbn-test-2
babylond config chain-id bbn-test-2

# 下载Genesis 文件
cd
wget https://github.com/babylonchain/networks/raw/main/bbn-test-2/genesis.tar.bz2
tar -xjf genesis.tar.bz2 && rm genesis.tar.bz2
mv genesis.json ~/.babylond/config/genesis.json

# 设置peer
cd
PEERS="8665926525cab128fb6820c12e693beae32189cb@2.58.82.86:16456,97483fca7392b9e5286a79c2f15bbc6cd8078c51@89.116.26.9:16456,b79270829412972d4561fddd7b0b19d0ff86e7cb@154.42.7.136:26656,44e51fce32337a039c95a8322bc000994f781025@38.242.213.26:16456,5404edff89d93e97832ab294a88c91bcb8b0e594@54.238.212.246:26656,34ce32c340ee34fb1dce5bf6db3f6bd7bbfe9e74@89.117.58.67:26656,0123d9c8840ef3c9f8b966525bf9ab48012fd29d@65.108.129.239:40656,9330158f5529919c6755789a49289106c0906044@142.93.111.103:31156,36777fb6c115526b9f93c3ed8b12924edef4ed5a@144.91.122.16:31156,0a0d7d245ea67cfeec7d000085260fbe695544f4@207.180.251.220:11656,47758f2d0098336450fb469bdddbd28d33ef55ef@164.68.109.193:26656,08f8da861fcf6e21d6f04d6b21e3486c0d406521@84.247.176.34:16456,118a68dbb190bec1b9882ef27c0edb5af79a052e@104.248.198.47:31156,e55cf962ad87b9136c961818f8f6cf7919b98601@161.97.142.95:16456,2581815dc03b24493d8fa782b103053ff0c101cf@109.205.183.92:16456,39b8c9adc8801d5c2b444fe7145860eb04bbc9ec@65.108.59.77:31156,eef91e5162efc7741a1befa580c38e7c2beed646@173.212.242.247:16456,09096f5f317e8cfa430838e52c77f8219ac440b6@89.116.29.88:26656,16f033e6a8ee599948f2ab9349899ef2bbded61a@65.109.70.45:27656,530fdeb6dabd3973d2a6c292281508a145a66514@164.92.147.45:31156,948793178a6a1ed76ede26d0d0b20d28c2987f1b@62.171.144.190:16456,67cc3790dc79b5b20db33e082d7baa1c3283b29f@37.27.55.100:24656,d0eee59ce53bdd6d82d01281f36819d9b94e7a34@46.4.57.161:16456,84b6e369a271ddf70b7e0922abfe603809769b8b@35.188.47.245:16456,f68522d692c9efc0d6fdae32877394c46b5996d9@154.42.7.189:26656,c9c67bb3a27642a4c4486394f281fc7262c2b91a@65.109.27.66:16456,05b82c341f2b4a38ad818ee008a7ff7e6989a0f3@2.59.156.143:16456,f03de36968bffdd85d39f967790a9a5407ffa6a0@158.220.111.115:16456,f82d5e03c398427c73b56e7269c3036401494c68@217.76.51.234:16456,127d74389dfa4994856648a4efe22a1c60d05a9b@185.219.142.112:16456,af5bbd5e8a568e92884dc4420f8128ad530e0506@185.217.197.227:16456,40847bca6a8ce81505be286c89d8a77ec8e16855@62.171.170.251:16456,32f630b3f1968f6414c0ea5eaad95e02f0363e52@80.65.211.25:26656,0145f790c613115eab414a88f49af52c21513137@185.187.170.244:26656,3d1f62f5ca2e59d74afc01ee03ff219ddee798f0@167.86.114.38:16456,5a5a641151f96d2ebcae7a0c82e1019f83cb08f3@158.220.111.116:16456,725995e126fece1b39071c464d91df7a4cc5f355@4.227.169.16:16456,6644af43b3c8f30c3cda94b28a4f8f81bc03b2cf@194.163.170.129:16456,899c8c04812b245114b9e41f30d1d39c0ec8b5aa@45.94.209.251:16456,0b036129ab350352fb420e366c57c62137f6ccbd@207.180.242.155:16456,50e73c636d2003b429443dc95d38e0df51a64ada@109.123.241.165:16456,5aab12afc44f6e7aa483db25edcef911f3d23265@38.242.216.136:16456,894e1db27292893cc3bc28a812002f6c5a3c5ee5@89.116.30.4:16456,0f8fbe7f95140f201532af60f95f11e382917706@5.78.115.108:26656,2acab2ec47cf74c08837e80397385fda71aeac2c@109.205.180.179:16456,2ba1c7faaaece764e967f22d27579310d03d69f0@154.42.7.84:26656,c5740321ed9c88ae1f68756bcfae6ce72c7496aa@158.220.117.40:16456,b7ed57fe3a7733d3ba4f9811f837400ada0756ad@176.124.198.67:16456,e385f4a8d1ec856be009184e69a330001bd5bac3@31.220.81.18:16456,e0a500684bda510d8f135e5a7cee16f13fd0be03@45.84.138.177:16456,5385dede6e35968e25079ccaa3ea2f2c0d6081fb@217.76.55.142:16456,752d875a6b5cfc1d4d3472d0b8960a934d24432a@84.247.129.5:16456,ea6e8374c3ff2603d535d2648d963b76bd4fd314@109.123.242.32:26656,5b876e871bc2b844a4a2d0ea1fd7ae3768b0e404@80.65.211.208:31156,030bc7c0258bed9a3a7f351086e63b5f5a1239b1@64.23.152.172:16456,0dc7db2998653f0100d6a78976d67334c22e793b@207.180.227.245:16456,41c49af20914f90cf6470df840937a8fda8e938b@74.48.96.73:31156,4a4464bdc267c945d63748a752fa476e0dd8bdbe@85.239.233.251:16456,3768787187f3d8e7d40a5f447d88eaf2c1868fa0@167.86.124.216:16456,d406e755b67d692502c9d4aac38900fe50f0eb9f@194.163.173.205:16456,e9504655fb196e5a590d3de61de1c8dabae37154@194.163.147.249:16456,c44dea4d05903e40ec84a875ab5e37aab3337ca8@45.87.154.220:26656,a2d1338f7d97a5e2cdd5292852fbb42ef6e078d7@161.97.117.23:16456,56278f82c1ceb4c51675e5ab1b0cce4bb67e6cb1@185.202.223.139:16456,51314f182689b204c314f9c0fda2e82a7daa6666@95.111.238.104:16456,1d5afb181d1cd5c37eee2bf5c6ffd80741fca013@62.171.169.236:16456,5fc87fd93fe205247b35fd19440fb7f3d4234f44@84.247.174.173:31656,a8a37b3969c7282f76e68280407335e051d75d63@185.217.197.15:16456,4109f679495f0375830c727c8c9b4e1fc7f3d049@84.247.169.225:16456,c08fe104825dc3ce6ee5f2582f00e497aa8a1c37@75.119.141.16:16456,2fb643493b8ebe450df69758b48c9ff0024e8acc@184.174.34.61:16456,c7893a07860ef132575bc75cf67db63df3a1e4f1@154.42.7.171:26656,279eb15f3a9cc7f90f6a025c66e0b16b6ef58597@185.241.151.110:16456,badbfa1b9fb9077f2a5380e1d59fa6253bf1561f@38.242.234.159:16456,09ad2c93fe84ebf93ce28e43b290fa3b9f3bbf24@161.97.72.103:16456,8af526c37c4892745038d8016ec44056b1a70725@rpc1.testnet.babylonchain.io:26656,8f90a461326ea81c3d43a4e92a8192d8133ca731@115.75.207.21:16456,fd1f698473a06fe717ba7a7e6ea65dd235daefff@genesis-validator1.testnet.babylonchain.io:26656,e8a1ee75decc9c77774c8d13d53d4994c368bff0@161.97.140.251:16456,45215defb2c66c2c427c3bad19f70ad9d765268e@173.249.55.113:16456,6595e73d40ac5771cc510e5a35db144840a7ed4c@116.203.97.211:16456,7dd029e9b3324f12419b34fa453558e90eeb7743@38.242.250.63:16456,ba3a508f05deb21729f9c4e4a4288ffc60ceb01e@154.42.7.38:26656,cc01114366a5520eb9883bfa0e070f0c7b6888dc@154.42.7.183:26656,4a13ce7ce1ceaa527310ffae4fa0b5e9e09d703d@154.42.7.198:26656,4a4f42f81fcf721e197aa0aef075914dcbdc4528@154.42.7.187:26656,0b926256faabb143a03e88a270fa5f618983c167@154.42.7.35:26656,66886aae0323cee9467a5b2bd6dec33899a7ef1c@154.42.7.36:26656,debea867ba3b70c384eb3e529f4e1ea018cf6d46@154.42.7.37:26656,3412554180ddb0f5ad92c3e33dbb12081ecb3b73@154.42.7.39:26656,c5d027f654739450e5845442dcf0ffb94b399938@154.42.7.80:26656,ea5ef5c5336e86d4376728aa4e0698546eac6b8f@154.42.7.145:26656,7ffaacf1ea89b2aa74a554851c96dcf178f243dd@154.42.7.113:26656,7caa73ddca9219878cd6f834133489307083285f@154.42.7.150:26656,0b1ae20b6be9a94322e09f8a1018ef9fe190acf4@148.251.177.108:20656,e37a883d7e1175096dba08a268e7cbe0066476e7@109.123.244.160:16456,67b31015271e75cb9c3762462467fa1b4d1ffa8b@173.212.242.100:16456,4afa7a82cb264892491eb6f9a1953adddd98d9b7@154.42.7.190:26656,ed48c57c13c8ba54e29635b640ac3217e315118d@194.163.176.216:16456,a1cb66979d71b31305e760ef1c8288a3101088c2@194.60.87.74:16456,7ab94a61b34e29f64793d35b00550b6fc03d5207@45.76.80.18:16456,ee6691e91c4538d976a846e799bdce3eb6f50312@154.42.7.55:26656,d81a6f3de406b054a86278200a198f72381287fe@161.97.108.152:26656,2029b842c3eb07265d64a96f41d8f8a461b332ac@154.42.7.192:26656,9b8a98bf62eacc17d81af574b17762f7212b504e@38.242.239.200:16456,8cb87ac14fc02c9ebf1ace9db073005f2b84d26e@154.42.7.62:26656,98d9d0b1686b2286be4b3b6e969b94a8aa1099ac@89.117.61.154:16456,cdd4e8750ccac467b4bf0ff9ba9f1e84542a24b7@65.21.244.219:16456,e75e72ce9c0289d020430d7661c89d7ef605b83b@88.99.98.157:16456,62c5ba8fc87693a2e9167fdb1323e6eaa95d7236@62.171.162.95:16456,259c253393eb30a5941ee6f3856dde418a601acb@161.35.229.92:16456,8e3b56f02d831fb11d880806094bae28bb008927@87.248.64.115:16456,668cd98c28fbe3a4cf13bfae2666f480938f88c4@84.247.169.42:3156,4ae59f728a23d3a4cf32f07d846ba9afc7845cea@135.181.143.55:16456,37896797924b1cb18bce9b9542ba3da915a85038@genesis-validator3.testnet.babylonchain.io:26656,9cb8579ce37b7788bd4ddec249c279f9dbc95d11@193.46.243.253:16456,b27e755189b2719066278671dd1485d3388c4e3c@213.73.206.15:16456,8b87546627f3c565d3a958c3cfb0967c2dd3461d@38.242.215.70:16456,23d267f25dd294572ff4d60a10a1b48d74a57b68@65.21.183.181:16456,ef53a96f1c13040f2b842f4e8111e47299d406e1@79.137.205.7:16456,e89bc7bbe068d531d079785e3cb5c86b2de79888@162.251.238.11:26656,30caba0357792263ca4d658a9b84a7aafbfb3854@89.117.51.186:16456,3eb18a1be76a26c98477eff08a81a055ca59ba5c@62.171.150.54:16456,28fa1dbe003b325f5d55fd307f0d696d0a18318d@217.76.60.200:16456,bb3164eb561275dc640d30014d17dbb9547e284a@213.136.83.74:16456,3d5b7450a7770b0d3abd2abd5fb339d0293474d1@89.116.31.210:16456,89a4dbf6593caa6d337cf02b049cab245ceb6ede@128.140.73.180:26656,6627516cfd0bf7718e8b1204b2c8129fd3844d44@49.13.167.53:26656,1016bb6d890ffafe49eb8b2264937bdbcd775135@46.4.5.45:20656,f5d8da432e8f31754943500562a1dd58d561e66a@95.6.28.8:30656,7c48d6713b44e529a186ebe95fcf8c0f245d580e@116.203.203.208:26656,1a6e0812ca80cd3a3846f6460480862089f24348@164.68.111.143:33656,1e6fc4becb8011d15d739e0e6aee04ed1f0f9e9d@84.247.142.244:16456,e65bea8cd04d9defa5389a041aa994e00c8e27a9@185.252.220.89:25018,5e5a13c41fa73a420bfdb9a52070ed6ebe01552f@185.197.250.29:16456,4f2a63904294aa619523ab5f80ab35f9e41fadce@148.251.2.19:55706,b4abb45ce5d0367a192189207ee90ac51647bb2d@195.14.6.2:26656,7e2c922b8281f7db344c4005dcbf395ad123f01c@194.163.179.176:26656,007e364cc15157ac9f3ecc856c92916f2cff5a7d@84.247.162.11:16456,cc43cffdb2ecc5142bc63e758a9740a71bad1a88@148.251.140.92:36656,050ea55834dac4b6e9a5329c12de16aaca88226e@217.76.58.2:16456,5685dda53d3921895429d1296feee4a562a862ff@38.242.233.201:16456,606b4f67b98c1d4cc273462cc7663bb31a0212ab@207.180.224.225:16456,e7141e9dcf76c18d5ecf70f6b1fde44e30de90a4@31.220.72.51:16456,30fce9878e04efae5860559267589c7f0a5a462d@217.76.49.103:16456,e03b03a3282739615030d623ca1a9952c522b71c@164.68.113.223:16456,bb5b722855de2ce91f03686ded9557ff40a6879a@31.220.72.52:16456,ae2d3554761736d7a237436e442a2a8fca7389da@154.42.7.77:26656,704bdcf540c892a1829677ded6e28cb98967444d@184.174.37.183:16456,7c4373b2a1f4f574c8c6f5f800094e59bb78e5f8@192.248.188.57:26656,d27a8b77aff701341cb6c35b75c0acb32a3b3869@38.242.246.98:16456,a39f248ff0a50aa4565e469c2cd32d393f31fc45@155.133.27.209:16456,3822d4a6ab42b2b47587a5e460464902c4e00172@167.86.91.136:16456,4d31e08fba8acfd4a50948acb4c104cab2fd6032@31.187.74.142:16456,d38b62989c7990ca891b18353085c5c1c7e84974@31.220.73.120:16456,b06dad729c5df6254522c462568d5399434a5b88@161.97.124.242:16456,97cd56529fde47b167c280846d5ad09d2e48d51a@164.68.96.223:16456,393ec4a2bb359679236ca23425cc757efbb4b8e4@82.208.23.190:16456,2e35005813a766746a5c486192ea284e1ccfaec5@138.201.200.32:16456,e20aedea09157c1279bc0914d991f86fcc00d65e@62.171.186.246:16456,d8d28ced52b9714eb7466de869950daaa3f07092@116.203.40.107:16456,288fbd8e3221dba6605a399e56b191c4c566ae91@62.171.134.31:16456,9869b6671117804d6f199a3ed01037286d6df996@194.61.28.11:16456,496a8bae158c2249a930ddac69173598e4a1ef46@207.180.203.252:16456,00ee5d81ab9b8baddb84fe6db1875f81f52001a2@149.102.157.1:16456,6e304e2cca21902d5d4bbf6238fab20abf1d835b@154.42.7.41:26656,338a3a239f5ab61b8c042a6a7fecde4065964962@45.140.185.152:16456,21e57dce3240cd34dfc016c9df5c1afce9c7dc55@38.242.213.226:16456,3ba556d4b540f242972bbc8d38ee57aaf77e839c@84.247.179.185:16456,474567846a454e30bda51c5fa6c7d2aa3f9169a6@185.217.125.160:16456,d15aa9cb0e5145ad98ec5f9c6461a520f9413605@161.97.120.220:16456,01551e3c939416e3a9bd8ec40b35f880de8bb75f@86.48.1.112:16456,a7c42ff093c632d4f771e66294b617a0fc58590d@65.108.41.26:16456,67cda73aadbc1ce10ec7c1e6befdd1bcc0ce3093@75.119.145.178:16456,7cd61869c1cc698416079b40b0c2ee2babdc1a16@161.97.92.129:16456,5d3272610cb846d186d0876f1f20fb723299b5fb@62.171.169.28:16456,43632272f490f6132f8b0f7e35c1f946fa7ede08@185.185.82.104:16456,e4f04c9123868467a02dcbeff1dc4bbf2fc817a3@65.21.32.88:16456,d57bb8dd0b283a150631235974a6d13fe4a6b113@31.220.92.150:16456,67b58a6ae76d27a5c6a161c9b5752caed8c3f471@46.228.199.33:16456,eab120746d6c42d9b74796a6e95d789b99222636@62.171.173.238:16456,2b6ef1b128fd63312b6129179b06b62161305c24@158.220.108.84:16456,eff15050e512636bffedee0bba01d78402132d98@185.197.195.44:16456,52a8a13135276ae147ea045b9ea83b62db16aa66@167.86.69.225:16456,c3bffcd3d6be49865de962d7fca246a5a0edcf82@161.97.101.27:16456,2d56ef5502333cc5ea214ee284e7ae97969f0a8a@109.123.247.220:16456,38ef5a1f557759b7e08762a83cf3473a62fa4d0e@65.109.20.18:16456,dc59f8b0e56d6a202f8971626549f4c873f55fcd@161.97.101.213:16456,1e704fa23b39490e5282cb5776e8170e1439f4be@161.97.123.220:16456,6b7d26ae643bf4683907981faa162d1180b31c54@85.215.77.38:16456,ebf39600a16e2a4a0f79ab9a18b03d263f868564@31.220.76.60:16456,bb8c2fb6cf4f51ebd3b378325b4f728cc0e5b6c3@194.60.201.175:16456,67d0c70c8ee2ce22638081f60fbf76ea5d3dd9af@genesis-validator4.testnet.babylonchain.io:26656,c01f6e33f9a9310c97b9be7667ee0768391706af@65.108.4.212:16456"
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$PEERS\"/" $HOME/.babylond/config/config.toml

# Pruning设置
pruning="custom" && \
pruning_keep_recent="100" && \
pruning_keep_every="0" && \
pruning_interval="10" && \
sed -i -e "s/^pruning *=.*/pruning = \"$pruning\"/" $HOME/.babylond/config/app.toml && \
sed -i -e "s/^pruning-keep-recent *=.*/pruning-keep-recent = \"$pruning_keep_recent\"/" $HOME/.babylond/config/app.toml && \
sed -i -e "s/^pruning-keep-every *=.*/pruning-keep-every = \"$pruning_keep_every\"/" $HOME/.babylond/config/app.toml && \
sed -i -e "s/^pruning-interval *=.*/pruning-interval = \"$pruning_interval\"/" $HOME/.babylond/config/app.toml

# 下载addrbook
cd
wget -O addrbook.json https://snapshots.liveraven.net/snapshots/babylon/addrbook.json --inet4-only
mv addrbook.json ~/.babylond/config

# 下载最新快照同步(当前使用的是Kjnodes提供的快照)
cd
rm -rf $HOME/.babylond/data
curl -L https://snapshots.kjnodes.com/babylon-testnet/snapshot_latest.tar.lz4 | tar -Ilz4 -xf - -C $HOME/.babylond

# 启动节点
sudo tee <<EOF >/dev/null /etc/systemd/system/babylond.service
[Unit]
Description=babylond daemon
After=network-online.target
[Service]
User=$USER
ExecStart=$(which babylond) start
Restart=on-failure
RestartSec=3
LimitNOFILE=10000
[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload && \
sudo systemctl enable babylond && \
sudo systemctl start babylond
