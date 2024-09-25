fx_version 'cerulean'
game 'gta5'

author 'Axt0n'
description 'Dominos Job'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'bridge/client/**.lua',
    'cl_dominos.lua',
}

server_scripts {
    'bridge/server/**.lua',
    'sv_dominos.lua',
}

lua54 'yes'