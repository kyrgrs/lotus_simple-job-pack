fx_version 'cerulean'
game 'gta5'

author 'Axt0n'
description 'Popeyes Job'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'bridge/client/**.lua',
    'cl_popeyes.lua',
}

server_scripts {
    'bridge/server/**.lua',
    'sv_popeyes.lua',
}

lua54 'yes'