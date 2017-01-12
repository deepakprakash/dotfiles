--[[----------------------------------------------------------------------------

MetadataDefinition.lua
Custom metadata definition for Mylio publish plug-in

------------------------------------------------------------------------------]]

return {

	metadataFieldsForPhotos = {
	
		{
			id = 'previous_tags',
			dataType = 'string',
		},

	},
	
	schemaVersion = 2, -- must be a number, preferably a positive integer
	
}
