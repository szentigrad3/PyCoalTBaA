if mods["angelsbioprocessing"] then
data.raw["recipe"]["petri-dish"].enabled=true
end

--bobs mods
require("prototypes/bobs-mods/Data-Final-Fixes")

--omni mods
require("prototypes/omni-mods/Data-Final-Fixes")

--angels mods
require("prototypes/angels-mods/Data-Final-Fixes")

--recipe ingredients deduper

for i, ings in pairs(data.raw.recipe) do
    --log(serpent.block(ings))
    local inglist = {}
    if ings.ingredients ~= nil then
        for a, ing in pairs(ings.ingredients) do
            if ing.name ~= nil then
                if data.raw.item[ing.name] or data.raw.fluid[ing.name] then
                    if not inglist[ing.name] then
                        --log(serpent.block(ing))
                        --log(ing.name)
                        inglist[ing.name] = true
                    else
						if string.sub(ings.name,1,string.len("fish-"))~="fish-" and ings.name~="science-pack-gold" and ings.name~="military-science-pack" and ings.name~="seaweed" and ings.name~="moss" then
                        data.raw.recipe[ings.name].ingredients[a] = nil
                    end
				end
				elseif type(ing[1]) == 'string' then
                --log(serpent.block(ing))
                if not inglist[ing[1]] then
                    inglist[ing[1]] = true
                else
                    data.raw.recipe[ings.name].ingredients[a] = nil
                end
            end
        end
    end

    if ings.normal ~= nil then
        --log(serpent.block(ings))
        for a, ing in pairs(ings.normal.ingredients) do
            if ing.name ~= nil then
                if data.raw.item[ing.name] or data.raw.fluid[ing.name] then
                    if not inglist[ing.name] then
                        --log(serpent.block(ing))
                        --log(ing.name)
                        inglist[ing.name] = true
                    else
                        data.raw.recipe[ings.name].normal.ingredients[a] = nil
                    end
                else
                    data.raw.recipe[ings.name].normal.ingredients[a] = nil
                end
            elseif type(ing[1]) == 'string' then
                --log(serpent.block(ing))
                if not inglist[ing[1]] then
                    inglist[ing[1]] = true
                else
                    data.raw.recipe[ings.name].normal.ingredients[a] = nil
                end
            end
        end
    end
    --reset inglist for expensive ingredients
    inglist = {}

    if ings.expensive ~= nil then
        --log(serpent.block(ings))
        --log(serpent.block(ings.expensive))
        if ings.expensive ~= false then
            if ings.expensive.ingredients ~= nil then
                for a, ing in pairs(ings.expensive.ingredients) do
                    if ing.name ~= nil then
                        if data.raw.item[ing.name] or data.raw.fluid[ing.name] then
                            if not inglist[ing.name] then
                                --log(serpent.block(ing))
                                --log(ing.name)
                                inglist[ing.name] = true
                            else
                                data.raw.recipe[ings.name].expensive.ingredients[a] = nil
                            end
                        else
                            data.raw.recipe[ings.name].expensive.ingredients[a] = nil
						end
						elseif type(ing[1]) == 'string' then
							--log(serpent.block(ing))
							if not inglist[ing[1]] then
								inglist[ing[1]] = true
							else
								data.raw.recipe[ings.name].expensive.ingredients[a] = nil
							end
						end
					end
				end
			end
		end
	end
end
