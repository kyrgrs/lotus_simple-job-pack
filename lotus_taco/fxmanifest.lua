fx_version 'cerulean'
game 'gta5'

author 'Axt0n'
description 'Taco Job'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'bridge/client/**.lua',
    'cl_taco.lua',
}

server_scripts {
    'bridge/server/**.lua',
    'sv_taco.lua',
}

lua54 'yes'