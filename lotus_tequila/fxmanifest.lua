fx_version 'cerulean'
game 'gta5'

author 'Lotus Development'
description 'Tequila Job'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'bridge/client/**.lua',
    'cl_tequila.lua',
}

server_scripts {
    'bridge/server/**.lua',
    'sv_tequila.lua',
}

escrow_ignore {
    'config.lua',
    'README.md',
    'fxmanifest.lua',
}

lua54 'yes'